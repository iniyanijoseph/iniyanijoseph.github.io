#import "@preview/bullseye:0.1.0": *

#let time_range(start: "", end: "") = [
  #{ if type(start) == datetime {
      emph(start.display("[year]"))
    } else {
      emph(start)
    }
  } - #{
    if type(end) == datetime {
      emph(end.display("[year]"))
    } else {
      emph(end)
    }
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
    dates,
    content,
  )
}
#let two_panel_html(dates: none, content: none) = {
  html.elem("table", attrs:(class:"twopanel"),
    html.elem("tr",{
      html.elem("td", attrs: (class:"paneldate"))[#dates]
      html.elem("td", attrs: (class:"panelcontent"))[#content]
    })
  )
}


#let two_panel(dates: none, content: none) = context {
  if target() == "html" {
    two_panel_html(dates: dates, content: content)
  } else {
    two_panel_table(dates: dates, content: content)
  }
}
