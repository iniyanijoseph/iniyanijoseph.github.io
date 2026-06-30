#import "math.typ": template-math
#import "refs.typ": template-refs
#import "notes.typ": template-notes
#import "fields.typ": *
#import "figures.typ": template-figures
#import "layout.typ": full-width, margin-note
#import "@preview/bullseye:0.1.0": *

#let make-header(links) = html.header(
  if links != none {
    html.nav(
      for (href, title) in links {
        html.a(href: href, title)
      },
    )
  },
)

#let tufted-web(
  title: "Tufted",
  description: [],
  lang: "en",
  css: (
    "https://cdnjs.cloudflare.com/ajax/libs/tufte-css/1.8.0/tufte.min.css",
    "src/assets/tufted.css",
    "src/assets/custom.css",
  ),
  nav: (),
  email: "",
  website: "",
  icon: "",
  content,
) = context {
  if target() == "html"{
    // Apply styling
    show: template-math
    show: template-refs
    show: template-notes
    show: template-figures

    set text(lang: lang)

    html.html(
      lang: lang,
      {
        // Head
        html.head({
          html.meta(charset: "utf-8")
          // html.elem("base", attrs: (href:base))
          html.meta(name: "viewport", content: "width=device-width, initial-scale=1")
          html.title(title)

          // Stylesheets
          for (css-link) in css {
            html.link(rel: "stylesheet", href: css-link)
          }
        })
        // Body
        html.body({
          // Add website header
          make-header(nav)
          // Main content
          html.article(
          {
            heading(title)
            html.section(content)
          },
          )
        })
      },
    )
  } else {
  set document(title: title, date: datetime.today())

  set text(size: 12pt, lang: "en", font: "New Computer Modern")
  set par(leading: 0.5em, spacing: 0.5em)

  show raw.where(lang: "table"): it => render(it.text) 

  show raw.where(lang: "graphiz"): it => raw-render(it, width: 100%)
  let linked-image(src) = html.elem("img", attrs:(src: src))

  show: show-target(paged: doc => {
    set page(
      margin: (
        top: 1.25cm,
        bottom: 1.25cm,
        left: 1.5cm,
        right: 1.5cm,
      ),
    )
    show heading.where(level: 1): it => align(center, it)
    heading(title)
    align(center, [#link(website) | #link("mailto:"+email)])
    content
  }
  )
}
}
