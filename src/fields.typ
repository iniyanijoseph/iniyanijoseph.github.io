#import "@preview/bullseye:0.1.0":*
#import "@preview/citegeist:0.2.2": load-bibliography
#import "@preview/titleize:0.1.1":titlecase

#let time_range(start: "", end: "") = [
  #{ if type(start) == datetime { emph(start.display("[year]")) } else { emph(start) } } - #{
    if type(end) == datetime { emph(end.display("[year]")) } else { emph(end) }
  }
]

#let dt(year, month) = datetime(year: year, month: month, day: 1)

#let two_panel_table(dates: none, content: none) = {
  table(
    columns: (8em, auto),
    column-gutter: 1em,
    row-gutter: 0em,
    align: (left, left),
    stroke: none,
    dates, content,
  )
}

#let two_panel_html(dates: none, content: none, details: none) = {
  [#strong(dates) #content \ #if details != none {emph(details)}]
}

#let two_panel(dates: none, content: none, details: none) = context {
  if target() == "html" {
    two_panel_html(dates: dates, content: content, details: details)
  } else {
    two_panel_table(dates: dates, content: content + emph(details))
  }
}

#let edu(start: "", end: "", degree: "", university: "", details: none, advisor: none, thesis: none) = {
  two_panel(
    dates: time_range(start: start, end: end),
    content: [
      #strong(degree), #university#{
        if type(end) == datetime {", " + end.display("[month repr:long] [year]") }
      }#if details != none [, #emph(details)]

      #if advisor != none [Advisor: #advisor]

      #if thesis != none [Thesis: #emph(thesis)]
    ],
  )
}

#let job(start: "", end: "", role: "", location: "", details: none) = {
  two_panel(
    dates: time_range(start: start, end: end),
    content: [
      #strong(role)
    ],
    details: location,
  )
}

#let other(date: "", name: "", description: "", start: "", end: "", details: none) = {
  two_panel(
    dates: { if date == "" { time_range(start: start, end: end) } else { [#emph(date.display("[year]"))] } },
    content: [
      #strong(name)
    ],
    details: description,
  )
}

#let award(date: "", name: "", description: "", start: "", end: "") = {
  other(date: date, name: name, start: start, end: end, description: description)
}


#let paper(bibtex) = {
  context(if target() == "html" {
    let bib = load-bibliography(read("../" + bibtex), sentence-case-titles: false)
    let entries = bib.values().sorted(key: item => int(item.fields.at("year", default: "0")))
    for item in entries.rev() [
      #let data = item.fields
      - #strong(titlecase[#data.title]) \ #data.author.split(" and ").map(underline).join(", ")) \ #emph(if data.at("note", default: none) != none {data.at("note").split(", ").map({text => if text == "Honorable Mention" or text == "Best Paper" {linebreak(); strong(text)} else {text}}).join(" ")
      })
    ]
  } else {
    bibliography("../"+bibtex, title: none, full: true)
  })
}
