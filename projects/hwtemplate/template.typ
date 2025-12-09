#let template(author:"", title:"", other: [], font: "New Computer Modern", size: 11pt, dark: true, doc) = {
  import "@preview/crudo:0.1.1"
  import "@preview/wrap-indent:0.1.0": allow-wrapping, wrap-in
  import "@preview/mitex:0.2.6": *
  import "@preview/decasify:0.11.2": *
  import "@preview/lovelace:0.3.0": *
  import "@preview/diagraph:0.3.5": *
  import "@preview/quick-maths:0.2.1": shorthands
  import "@preview/cmarker:0.1.7": *
  import "@preview/lemmify:0.1.8": *
  import "@preview/lilaq:0.5.0"
  import "@preview/equate:0.3.2"
  import "@preview/latex-lookalike:0.1.4"
  import "@preview/nordic:0.1.0" as nordic

  show: nordic.default

  set document(author: author, title: title, description: other)
  set text(font: font)
  align(center,heading[#author, #title #emph(other)])

  // Custom Numbered Headings
  let headingParams = (
    weight: "semibold",
    numbering: "1.a.i.1.a.i",
    ending: ") ",
    radius: 0.4cm,
  )

  set heading(numbering: (..nums) => "")
  show heading: it => {
    let bgcolor = if page.fill == auto { white } else { page.fill }

    set text(size: size, font: font, weight: headingParams.weight)

    let plc(body) = place(dx: -1in, box(width: 1in,  height: size, align(right, body), fill: bgcolor))

    let default = text(context ( counter(heading) ).display("1.a.i" + headingParams.ending) .split(".") .last())

    plc(default)
    show regex("\S+\) "): word => plc(word)
    it.body
    linebreak()
  }

  // Graphiz Diagrams
  show raw.where(lang: "graphiz"): it => raw-render(it, width: 100%)

  // Algorithms
  let pseudocode-list = pseudocode-list.with(booktabs: true, hooks: .5em, title: [#smallcaps[Algorithm]])
  show raw.where(lang: "algorithm"): it => {
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
  let (
    theorem,
    lemma,
    corollary,
    remark,
    proposition,
    example,
    proof,
    rules: thm-rules,
  ) = default-theorems("thm-group", lang: "en")

  show raw.where(lang: "theorem"): it => {
    set text(font: font, size)
    let title = it.text.split("\n").at(0)
    let content = it.text.split("\n").slice(1).join("\n")
    set text(font: font, size)

    theorem(name: eval(title, mode: "markup"))[#box(inset: (x: 1em))[#proof[
      #eval(content, mode: "markup")
    ]]]
  }
  show raw.where(lang: "lemma"): it => {
    set text(font: font, size)
    let title = it.text.split("\n").at(0)
    let content = it.text.split("\n").slice(1).join("\n")
    set text(font: font, size)

    lemma(name: eval(title, mode: "markup"))[#box(inset: (x: 1em))[#proof[
      #eval(content, mode: "markup")
    ]]]
  }
  show raw.where(lang: "corollary"): it => {
    set text(font: font, size)
    let title = it.text.split("\n").at(0)
    let content = it.text.split("\n").slice(1).join("\n")
    set text(font: font, size)

    corollary(name: eval(title, mode: "markup"))[#box(inset: (x: 1em))[#proof[
      #eval(content, mode: "markup")
    ]]]
  }

  show: thm-rules

  // Markdown Style Tables
  show raw.where(lang: "table"): it => {
    set text(font: font, size)
    render(it.text)
  }

  // Math Shorthands
  show: shorthands.with(
    ($+-$, $plus.minus$),
    ($|-$, math.tack),
    ($<==$, math.arrow.double.l),
    ($==>$, math.arrow.double),
  )

  // Render tex
  show raw.where(lang: "tex"): it => {
    let rawtext = crudo.r2l(it).at(0).join("\n")
    mi(rawtext)
  }

  doc
}
