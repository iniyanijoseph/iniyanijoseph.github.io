#import "base.typ": *

#let edu(start: "", end: "", degree: "", university: "", details: none, advisor: none, thesis: none) = {
  two_panel(
    dates: time_range(start: start, end: end),
    content: [
      #strong(degree), #university, #{
        if type(end) == datetime { end.display("[month repr:long] [year]") }
      }#if details != none [, #emph(details)]

      #if advisor != none [Advisor: #advisor]

      #if advisor != none [Thesis: #emph(thesis)]
    ],
  )
}

#let job(start: "", end: "", role: "", location: "", details: none) = {
  two_panel(
    dates: time_range(start: start, end: end),
    content: [
      #strong(role), #location
    ],
    details: details,
  )
}

#let other(date: "", name: "", description: "", start: "", end: "", details: none) = {
  two_panel(
    dates: { if date == "" { time_range(start: start, end: end) } else { [#date.display("[year]")] } },
    content: [
      #strong(name)#{ if description != "" [, #description] }
    ],
    details: details,
  )
}

#let award(date: "", name: "", description: "", start: "", end: "", details: none) = {
  other(date: date, name: name, description: description, start: start, end: end, details: details)
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
