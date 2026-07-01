#!/usr/bin/env python3
"""Build blog/feed.xml from the `posts` metadata in blog/index.typ.

Typst's HTML export always wraps output in a full <!DOCTYPE html> document
and treats tags like <link> as void elements, so it can't emit a standalone
RSS/XML file directly. Instead, this pulls the structured post metadata out
with `typst query` (pure Typst data) and serializes it to RSS here.
"""
import json
import subprocess
import sys
from datetime import datetime, timezone
from xml.sax.saxutils import escape
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BASE_URL = "https://iniyanjoseph.com"
TITLE = "Iniyan Joseph's Blog"
DESCRIPTION = "Posts from iniyanjoseph.com"


def get_posts():
    result = subprocess.run(
        ["typst", "query", "blog/index.typ", "<posts>", "--field", "value", "--one", "--root", "."],
        cwd=ROOT,
        capture_output=True,
        text=True,
        check=True,
    )
    return json.loads(result.stdout)


def rfc822(date_str):
    dt = datetime.strptime(date_str, "%Y-%m-%d").replace(tzinfo=timezone.utc)
    return dt.strftime("%a, %d %b %Y %H:%M:%S %z")


def build_feed(posts):
    posts = sorted(posts, key=lambda p: p["date"], reverse=True)
    items = []
    for p in posts:
        url = f"{BASE_URL}/blog/{p['slug']}/"
        items.append(f"""    <item>
      <title>{escape(p['title'])}</title>
      <link>{escape(url)}</link>
      <guid>{escape(url)}</guid>
      <pubDate>{rfc822(p['date'])}</pubDate>
      <description>{escape(p['summary'])}</description>
    </item>""")

    build_date = datetime.now(timezone.utc).strftime("%a, %d %b %Y %H:%M:%S %z")
    return f"""<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
  <channel>
    <title>{escape(TITLE)}</title>
    <link>{escape(BASE_URL + "/blog/")}</link>
    <description>{escape(DESCRIPTION)}</description>
    <lastBuildDate>{build_date}</lastBuildDate>
{chr(10).join(items)}
  </channel>
</rss>
"""


def main():
    posts = get_posts()
    feed = build_feed(posts)
    out_path = ROOT / "blog" / "feed.xml"
    out_path.write_text(feed)
    print(f"wrote {out_path}")


if __name__ == "__main__":
    main()
