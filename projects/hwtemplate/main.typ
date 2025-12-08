#import "@preview/crudo:0.1.1"
#import "@preview/wrap-indent:0.1.0": allow-wrapping, wrap-in
#import "@preview/mitex:0.2.6": *
#import "@preview/decasify:0.11.2": *
#import "@preview/lovelace:0.3.0": *
#import "@preview/diagraph:0.3.5": *
#import "@preview/quick-maths:0.2.1": shorthands
#import "@preview/cmarker:0.1.7": *
#import "@preview/lemmify:0.1.8": *
#import "@preview/lilaq:0.5.0"
#import "@preview/equate:0.3.2"
#import "@preview/latex-lookalike:0.1.4"

#let font = "New Computer Modern"
#let size = 11pt
#set text(font: font)
#set heading(numbering: "1ai1ai)")

// Graphiz
#show raw.where(lang: "graphiz"): it => raw-render(it, width: 100%)

// Algorithms
#let pseudocode-list = pseudocode-list.with(booktabs: true, hooks: .5em, title: [#smallcaps[Algorithm]])
#show raw.where(lang: "algorithm"): it => {
  set text(font: font, size)
  show "while": [*while*]
  show "if": [*if*]
  show "else": [*else*]
  show "then": [*then*]
  show "for": [*for*]
  show "True": [*True*]
  show "False": [*False*]
  pseudocode-list[
    #eval(it.text, mode: "markup")
  ]
}

// Theorems
#let (
  theorem,
  lemma,
  corollary,
  remark,
  proposition,
  example,
  proof,
  rules: thm-rules,
) = default-theorems("thm-group", lang: "en")

#show raw.where(lang: "theorem"): it => {
  set text(font: font, size)
  let title = it.text.split("\n").at(0)
  let content = it.text.split("\n").slice(1).join("\n")
  set text(font: font, size)

  theorem(name: eval(title, mode: "markup"))[#box(inset: (x: 1em))[#proof[
    #eval(content, mode: "markup")
  ]]]
}
#show raw.where(lang: "lemma"): it => {
  set text(font: font, size)
  let title = it.text.split("\n").at(0)
  let content = it.text.split("\n").slice(1).join("\n")
  set text(font: font, size)

  lemma(name: eval(title, mode: "markup"))[#box(inset: (x: 1em))[#proof[
    #eval(content, mode: "markup")
  ]]]
}
#show raw.where(lang: "corollary"): it => {
  set text(font: font, size)
  let title = it.text.split("\n").at(0)
  let content = it.text.split("\n").slice(1).join("\n")
  set text(font: font, size)

  corollary(name: eval(title, mode: "markup"))[#box(inset: (x: 1em))[#proof[
    #eval(content, mode: "markup")
  ]]]
}

#show: thm-rules

// Markdown Style Tables
#show raw.where(lang: "table"): it => {
  set text(font: font, size)
  render(it.text)
}

#show: shorthands.with(
  ($+-$, $plus.minus$),
  ($|-$, math.tack),

  ($<==$, math.arrow.double.l),
  ($==>$, math.arrow.double),
)


#import "@preview/nordic:0.1.0" as nordic
#show: nordic.default

#show raw.where(lang: "tex"): it => {
  let rawtext = crudo.r2l(it).at(0).join("\n")
  mi(rawtext)
}

#let headingParams = (
  size: 11pt,
  weight: "semibold",
  numbering: "1.a.i.1.a.i",
  ending: ") ",
  background-colour: color.rgb("#EFEEEE"),
  radius: 0.4cm,
)


#set heading(numbering: (..nums) => "")
#show heading: it => {
  let bgcolor = if page.fill == auto { white } else { page.fill }
  set text(size: headingParams.size, weight: headingParams.weight)

  let placenumber(body) = place(dx: -1in, box(width: 1in, height: 2em, align(right, body), fill: bgcolor))
  let placenumberoffset(body) = place(dx: -1in - 0.47em, box(
    width: 1in,
    height: 2em,
    align(right, body),
    fill: bgcolor,
  ))

  let default = text(context (
    counter(heading)
  )
    .display("1.a.i" + headingParams.ending)
    .split(".")
    .last())
  placenumber(default)
  show regex("\S+\)"): word => placenumberoffset(word)
  it.body
  linebreak()
}


$==> <== +- |-$
```tex
1 + \frac{5}{2}
```
```algorithm
+ while true
  + if the thing that this
  + else next thing which is true
    + and one
```
```graphiz
digraph g {
  a -> b
  b -> a
  a -> c
  c -> a
}
```

```table
| Column 1      | Column 2      |
| ------------- | ------------- |
| Cell 1, Row 1 | Cell 2, Row 1 |
| Cell 1, Row 2 | Cell 1, Row 2 |
```
= 3.2) This is the very first problem $E=m c^2$
```theorem
Given a string, $x$
E = m c ^2
```
#lorem(50)
== This is the second problem
#lorem(51)
=== $E=m c^2$ Hello
#lorem(52)

= 25) hello there #lorem(3)
== b) there is another
=== iii) here is another one
======== 5)
