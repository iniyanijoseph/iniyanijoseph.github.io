#import "../cv.typ":template,margin-note, linked-image, linked-video

#show: template.with(title: "Blog", root: "../")

// Base URL used to turn the site's relative paths into absolute
// links for the RSS feed. Update this to your actual domain.
#let base-url = "https://iniyanjoseph.com/blog/"

// Renders exactly like #link(path)[title] did before, but also tags
// itself with <post> metadata so the RSS feed (built further below)
// can find it via query(<post>), no matter what else is on this page.
// `date` is a Typst datetime, e.g. datetime(year: 2025, month: 1, day: 1)
// -- rfc822() below turns it into the string format RSS pubDate needs.
#let rfc822(date) = date.display(
  "[weekday repr:short], [day padding:zero] [month repr:short] [year] 00:00:00 GMT"
)

#let post(title, date, path) = {
  [#metadata((title: title, date: date, link: base-url + path)) <post>]
  link(path)[#title]
}

== Travel
- #post("Amtrak Rail Pass", datetime(year: 2025, month: 1, day: 1), "train")
- #post("South Texas", datetime(year: 2025, month: 1, day: 1), "southtexas")
- #post("Guide to Greater Lafayette", datetime(year: 2025, month: 1, day: 1), "guidetolafayette")

== File on Conscience
- #post("Statement of Conscience", datetime(year: 2025, month: 1, day: 1), "letteronconscience")

== Hobbies
- #post("Kites", datetime(year: 2025, month: 1, day: 1), "kites")
- #post("Sock Monkeys", datetime(year: 2025, month: 1, day: 1), "sockmonkey")
- #post("Weekend List", datetime(year: 2025, month: 1, day: 1), "weekendlist")

== Other
- #post("My Experience with PhD Applications", datetime(year: 2025, month: 1, day: 1), "phdapplications")
- #post("Productivity Tips", datetime(year: 2026, month: 7, day: 2), "productivity")

// Everything below is invisible on the rendered page -- #metadata
// never produces visible output. It just exposes the collected posts
// as a queryable XML string for `make blog/feed.xml` to pull out.
#let esc(s) = s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")

#context {
  // newest first: query() returns posts in source/document order,
  // which is category order here, not chronological -- sort explicitly.
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
    "  <title>My Blog</title>\n" +
    "  <link>" + base-url + "</link>\n" +
    "  <description>My feed</description>\n" +
    items + "\n" +
    "</channel></rss>\n"
  )

  [#metadata(xml) <feed>]
}

