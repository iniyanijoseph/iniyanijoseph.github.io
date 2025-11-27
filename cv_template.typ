#import "@preview/bullseye:0.1.0": *
#import "math.typ": template-math
#import "refs.typ": template-refs
#import "notes.typ": template-notes
#import "figures.typ": template-figures
#import "layout.typ": full-width, margin-note

#let cv(author: "", body) = {
  set document(author: author, title: author, date: datetime.today())

  set text(size: 12pt, lang: "en", font: "New Computer Modern")
  set par(leading: 0.5em, spacing: 0.5em)

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

    heading(author, level: 1)

    body
  })

  context {
    if target() == "html" {
      let make-header(links) = html.header(
        html.nav(
          for (href, title) in links {
            html.a(href: href, title)
          },
        ),
      )
      // let global-css = "https://cdnjs.cloudflare.com/ajax/libs/tufte-css/1.8.0/tufte.min.css"
      let local-css = "style.css"

      show: template-math
      show: template-refs
      show: template-notes
      show: template-figures


      html.head({
        html.meta(charset: "utf-8")
        html.meta(name: "viewport", content: "width=device-width, initial-scale=1")
        html.title(author)
        // html.link(rel: "stylesheet", href: global-css)
        html.link(rel: "stylesheet", href: local-css)
      })

      html.article({
        heading(author, level: 1)
        html.section(body)
      })
    }
  }
}


