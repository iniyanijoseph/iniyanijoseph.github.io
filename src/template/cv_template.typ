#import "@preview/bullseye:0.1.0": *
#import "math.typ": template-math
#import "refs.typ": template-refs
#import "figures.typ": template-figures
#import "layout.typ": full-width, margin-note

#let cv(author: "", icon:"", aboutme: "", photo: "", website: "", email:"", subpage:false, blog-shown:false, root:"", body) = {
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

    if (not subpage) {
      heading(author, level: 1)
      align(center, [#link(website) | #link("mailto:"+email)])
    }
    // line(length: 100%)
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
      show: template-math
      show: template-refs
      show: template-figures


      html.head({
        html.meta(charset: "utf-8")
        html.meta(name: "viewport", content: "width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no")
        html.title(author)
        html.link(rel: "stylesheet", href: root+"src/styles/style.css")
        html.link(rel: "icon", href: "favicon.ico")
        html.script(src: root+"src/scripts/navbar.js")
        html.script(src: root+"src/scripts/trim.js")
        html.script(src: root+"src/scripts/collapsible.js")
        html.script(src: root+"src/scripts/scroll-animation.js")
        html.script(src: root+"src/scripts/theme-toggle.js")
        if (blog-shown) {
          html.script(src: root+"src/scripts/blog-link.js")
        }
        if (not subpage) {
          html.script(src: root+"src/scripts/cv-link.js")
        }
        if (subpage) {
          html.script(src: root+"src/scripts/home-link.js")
        }
      })

      let pictureStyling = "border-radius: 50%; aspect-ratio: 1/1; object-fit: cover; height: 33vh !important; width: auto !important; transition: all 0.3s ease;"
      html.article({
        if (not subpage) {
          html.elem("img", attrs:(src: photo, style: pictureStyling)) 
          heading(html.elem("a", attrs:(href: "cv.pdf", style: ""), author), level: 1)
        }
        if aboutme != "" {
           html.elem("p", attrs:(class: "aboutme"), aboutme)
        }
        html.section(body)
      })
    }
  }
}


