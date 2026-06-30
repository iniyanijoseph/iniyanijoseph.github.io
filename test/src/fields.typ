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
    two_panel_table(dates: dates, content: content)
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

#let performance(date: "", name: "", details: none, location: "", musicians: "") = {
  two_panel(
    dates: { date.display("[year]") },
    content: [
      #strong(name)#{
        if musicians != "" [, #musicians]
        if location != "" [, #emph(location)]
      }
    ],
    details: if details != none [#link("https://youtu.be/" + details)[Link to Performance]
    ],
  )
}

#let festival(date: "", name: "", details: none, category: "", score: "") = {
  two_panel(
    dates: { date.display("[year]") },
    content: [
      #strong(name)#{
        if category != "" [, Category: #category]
        if score != "" [, #emph[Score: #score]]
      }
    ],
    details: details,
  )
}

#let blog(name: "", url: "", details: none, ) = {
  two_panel(
    dates: {},
    content: [
      #strong(link(url)[#name])
    ],
    details: details,
  )
}
