#import "base.typ":* 

#let edu(start: "", end: "", degree: "", university: "", details:none, advisor:none, thesis:none) = {
  two_panel(
    dates: time_range(start:start, end: end),
    content: [
      #strong(degree), #university, #{
        if type(end) == datetime {
          end.display("[month repr:long] [year]")
        }
      }#if details != none [, #emph(details)]

      #if advisor != none [Advisor: #advisor]
      
      #if advisor != none [Thesis: #emph(thesis)]
    ],
  )
}

#let job(start: "", end: "", role: "", location: "",) = {
  two_panel(
    dates: time_range(start:start, end: end),
    content: [
      #strong(role), #location
    ],
  )
}

#let other(date: "", name: "", description: "", start: "", end: "") = {
  two_panel(
    dates: {if date == "" {time_range(start: start, end: end)} else {[#date.display("[year]")]}},
    content: [
      #strong(name)#{if description != "" [, #description]}
    ],
  )
}

#let award(date: "", name: "", description: "", start: "", end: "") = {other(date:date, name:name, description:description, start:start, end:end)}


