#import "@preview/bullseye:0.1.0": *
#import "../cv.typ": *

#show: cv.with(subpage: true, root: "../../", fancylist: false)
#let linked-image(src) = context if target() == "html" {html.elem("img", attrs:(src: src))}
#let linked-video(src) = context if target() == "html" {html.elem("video",  attrs: (src: src, controls:"true"))[Your browser doesn't support video]}

