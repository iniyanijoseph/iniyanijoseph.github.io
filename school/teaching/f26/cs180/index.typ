#import "../../../../cv.typ":template,margin-note, linked-image, linked-video
#import "@preview/tablem:0.3.0": three-line-table, tablem
#show: template.with(title: "CS 180, Fall 2026", root: "../../../../")

#let base-url = "https://iniyanjoseph.com/school/teaching/f26/cs180/"
#let rfc822(date) = date.display(
  "[weekday repr:short], [day padding:zero] [month repr:short] [year] 00:00:00 GMT"
)

#let post(title, date, body) = {
  let slugify(s) = lower(s.replace(regex("[^A-Za-z0-9]+"), "-")).trim("-", at: start).trim("-", at: end)
  let slug = slugify(title)
  [#metadata((title: title, date: date, link: base-url + "#" + slug)) <post>]
  block(above: 1.5em, below: 0.5em)[
    #heading(level: 3)[#title] #label(slug)
    #text(size: 0.85em, style: "italic")[#date.display("[month repr:long] [day], [year]")]
  ]
  body
}

#post("Welcome", datetime(year: 2026, month: 8, day: 12))[
  Hello! Welcome to CS 180 (Problem Solving And Object-Oriented Programming). My name is Iniyan and I will be your TA. This course primarily discusses the basics of programming, inheritance, exception handling, and a few algorithms and their implementations.

  As we go through this course, I will share resources and information on this page. If you would like to meet with me to discuss this class, your grades, etc., you can request office hours with me #link("https://calendar.app.google/2v1WK9e2M3tzVKWa8")[here].

  Generally, I am most responsive via #link("mailto:josep266@purdue.edu")[email], but feel free to follow up if I don't respond in 1 business day.

  You can subscribe to announcements via this RSS feed: #link("https://iniyanjoseph.com/school/teaching/f26/cs180/feed.xml")
]

// Everything below stays the same -- RSS export.
#let esc(s) = s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
#context {
  let posts = query(<post>).map(it => it.value).sorted(key: p => p.date).rev()
  let items = posts.map(p =>
    "  <item>\n" +
    "    <title>" + esc(p.title) + "</title>\n" +
    "    <link>" + esc(p.link) + "</link>\n" +
    "    <guid>" + esc(p.link) + "</guid>\n" +
    "    <pubDate>" + rfc822(p.date) + "</pubDate>\n" +
    "  </item>"
  ).join("\n")
  let xml = (
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
    "<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\"><channel>\n" +
    "  <atom:link href=\"" + base-url + "feed.xml\" rel=\"self\" type=\"application/rss+xml\" />\n" +
    "  <title>Announcements</title>\n" +
    "  <link>" + base-url + "</link>\n" +
    "  <description>My feed</description>\n" +
    items + "\n" +
    "</channel></rss>\n"
  )
  [#metadata(xml) <feed>]
}
