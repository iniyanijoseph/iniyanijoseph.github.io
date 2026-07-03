#!/usr/bin/env python3
"""Weekly digest: RSS + r/purdue + YouTube subs + weather -> one email.
Separate email: new newsletters from IMAP inbox.
Runs via GitHub Actions cron. No state file - filters by 'published in last 7 days'.
"""
import os
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from datetime import datetime, timedelta, timezone

import feedparser
import requests
import yaml

SINCE = datetime.now(timezone.utc) - timedelta(days=7)

with open(os.path.join(os.path.dirname(__file__), "config.yml")) as f:
    CFG = yaml.safe_load(f)


def entry_dt(entry):
    for key in ("published_parsed", "updated_parsed"):
        t = entry.get(key)
        if t:
            return datetime(*t[:6], tzinfo=timezone.utc)
    return None


def get_rss_items():
    sections = []
    for url in CFG.get("rss_feeds", []):
        feed = feedparser.parse(url)
        title = feed.feed.get("title", url)
        items = []
        for e in feed.entries:
            dt = entry_dt(e)
            if dt and dt >= SINCE:
                items.append((e.get("title", "untitled"), e.get("link", "")))
        if items:
            sections.append((title, items))
    return sections


def get_reddit_items():
    headers = {"User-Agent": "weekly-digest-bot/1.0"}
    sections = []
    for sub in CFG["reddit"]["subreddits"]:
        url = f"https://www.reddit.com/r/{sub}/.rss"
        resp = requests.get(url, headers=headers, timeout=15)
        feed = feedparser.parse(resp.content)
        items = []
        for e in feed.entries:
            dt = entry_dt(e)
            if dt and dt >= SINCE:
                items.append((e.get("title", "untitled"), e.get("link", "")))
        sections.append((sub, items))
    return sections


def get_youtube_items():
    sections = []
    for cid in CFG["youtube"]["channel_ids"]:
        url = f"https://www.youtube.com/feeds/videos.xml?channel_id={cid}"
        feed = feedparser.parse(url)
        title = feed.feed.get("title", cid)
        items = []
        for e in feed.entries:
            dt = entry_dt(e)
            if dt and dt >= SINCE:
                items.append((e.get("title", "untitled"), e.get("link", "")))
        if items:
            sections.append((title, items))
    return sections


def get_weather():
    w = CFG["weather"]
    url = (
        "https://api.open-meteo.com/v1/forecast"
        f"?latitude={w['lat']}&longitude={w['lon']}"
        "&daily=weathercode,temperature_2m_max,temperature_2m_min,precipitation_probability_max"
        "&temperature_unit=fahrenheit&timezone=America%2FChicago&forecast_days=7"
    )
    r = requests.get(url, timeout=15).json()
    daily = r.get("daily", {})
    days = daily.get("time", [])
    out = []
    codes = {
        0: "Clear", 1: "Mostly clear", 2: "Partly cloudy", 3: "Overcast",
        45: "Fog", 48: "Fog", 51: "Light drizzle", 61: "Light rain",
        63: "Rain", 65: "Heavy rain", 71: "Light snow", 73: "Snow",
        75: "Heavy snow", 80: "Rain showers", 95: "Thunderstorm",
    }
    for i, day in enumerate(days):
        code = daily["weathercode"][i]
        hi = daily["temperature_2m_max"][i]
        lo = daily["temperature_2m_min"][i]
        pop = daily["precipitation_probability_max"][i]
        out.append(f"{day}: {codes.get(code, 'code ' + str(code))}, {lo:.0f}-{hi:.0f}F, {pop}% precip")
    return w["location_name"], out


def get_newsletter_items():
    sections = []
    for url in CFG.get("newsletters", []):
        feed = feedparser.parse(url)
        title = feed.feed.get("title", url)
        items = []
        for e in feed.entries:
            dt = entry_dt(e)
            if dt and dt >= SINCE:
                items.append((e.get("title", "untitled"), e.get("link", "")))
        sections.append((title, items))
    return sections


def build_digest_html(rss, reddit, youtube, weather):
    loc, forecast = weather
    html = ["<html><body style='font-family:sans-serif'>"]
    html.append(f"<h1>Weekly Digest — {datetime.now().strftime('%B %d, %Y')}</h1>")

    html.append(f"<h2>Weather — {loc}</h2><ul>")
    for line in forecast:
        html.append(f"<li>{line}</li>")
    html.append("</ul>")

    html.append("<h2>Reddit</h2>")
    for sub, items in reddit:
        html.append(f"<h3>r/{sub}</h3><ul>")
        for title, link in items:
            html.append(f"<li><a href='{link}'>{title}</a></li>")
        if not items:
            html.append("<li>No new posts this week</li>")
        html.append("</ul>")

    html.append("<h2>YouTube Subscriptions</h2>")
    for feed_title, items in youtube:
        html.append(f"<h3>{feed_title}</h3><ul>")
        for title, link in items:
            html.append(f"<li><a href='{link}'>{title}</a></li>")
        html.append("</ul>")
    if not youtube:
        html.append("<p>No new videos this week</p>")

    html.append("<h2>RSS Feeds</h2>")
    for feed_title, items in rss:
        html.append(f"<h3>{feed_title}</h3><ul>")
        for title, link in items:
            html.append(f"<li><a href='{link}'>{title}</a></li>")
        html.append("</ul>")
    if not rss:
        html.append("<p>No new items this week</p>")

    html.append("</body></html>")
    return "\n".join(html)


def build_newsletter_html(newsletters):
    html = ["<html><body style='font-family:sans-serif'>"]
    html.append(f"<h1>Newsletters — {datetime.now().strftime('%B %d, %Y')}</h1>")
    for feed_title, items in newsletters:
        html.append(f"<h3>{feed_title}</h3><ul>")
        for title, link in items:
            html.append(f"<li><a href='{link}'>{title}</a></li>")
        if not items:
            html.append("<li>No new issues this week</li>")
        html.append("</ul>")
    html.append("</body></html>")
    return "\n".join(html)


def send_email(subject, html):
    smtp_user = os.environ["SMTP_USER"]
    smtp_pass = os.environ["SMTP_PASS"]
    recipient = os.environ["RECIPIENT_EMAIL"]

    msg = MIMEMultipart("alternative")
    msg["Subject"] = subject
    msg["From"] = smtp_user
    msg["To"] = recipient
    msg.attach(MIMEText(html, "html"))

    with smtplib.SMTP_SSL("smtp.gmail.com", 465) as server:
        server.login(smtp_user, smtp_pass)
        server.sendmail(smtp_user, recipient, msg.as_string())


def main():
    rss = get_rss_items()
    reddit = get_reddit_items()
    youtube = get_youtube_items()
    weather = get_weather()
    digest_html = build_digest_html(rss, reddit, youtube, weather)
    send_email(f"Weekly Digest — {datetime.now().strftime('%b %d, %Y')}", digest_html)

    newsletters = get_newsletter_items()
    newsletter_html = build_newsletter_html(newsletters)
    send_email(f"Newsletters — {datetime.now().strftime('%b %d, %Y')}", newsletter_html)


if __name__ == "__main__":
    main()
