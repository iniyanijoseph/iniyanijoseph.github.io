// TODO: figures and figures with captions inside margin notes
#import "@preview/bullseye:0.1.0":*

#let margin-note(content) = context {
  if target() == "html"{
    html.span(class: "marginnote", content)
  }
}

// TODO: implement <figure class="fullwidth">
// possible requires introspection or `set html.figure(class: "fullwidth")` support

#let full-width(content) = {
  html.div(class: "fullwidth", content)
}
