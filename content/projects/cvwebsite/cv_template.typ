#import "@preview/bullseye:0.1.0": *
#import "typki.typ"


// apply image styling only for html output
#show image: show-target(html: img => {
  html.elem("img", attrs: ("src": img.source, "alt": img.alt))
})
#let cv(
  author: "",
  address: "",
  contacts: (),
  updated: datetime.today(),
  body,
) = {
  set document(author: author, title: author, date: updated)
  set text(
    size: 11pt,
    lang: "en",
    font: "New Computer Modern",
  )

  show: show-target(paged: doc => {
    set page(
      margin: (
        top: 1.25cm,
        bottom: 1.25cm,
        left: 1.5cm,
        right: 1.5cm,
      ),
      footer: [
        #align(center)[
          #author -- #context { counter(page).display("1 of 1", both: true) }
        ]
      ],
    )
  align(center)[ #block(text(size: 14pt, weight: 700, [#smallcaps(author)])) ]
    pad(
      top: 0pt,
      align(center)[
        #contacts.join(" | ")
      ],
    )

    show heading: it => text(size: 12pt, it.body)
    show heading.where(level: 2): it => pad(bottom: 0pt, it)
    show heading.where(level: 3): it => text(size: 11pt, it.body)
    show heading.where(level: 4): it => text(size: 11pt, emph[#it.body])

  doc

  })

  context on-target(html: {
    html.elem("h1", attrs:("style":"text-align: center"), 
      author
    )
    html.elem("p", attrs:("style":"text-align: center"), 
    contacts.join(" | ")
    )
  })
  set par(justify: true)

  show grid: it => if target() == "html" {
    let (children, stroke, inset, ..v) = it.fields();
    table(..v, inset: if inset == (:) {0pt} else {inset}, stroke: if stroke == (:) {none} else {stroke}, ..children.map(it => {
      let (body, ..v) = it.fields();
      table.cell(..v, body)
    }))
  } else {
    it
  }
  body
}

#let timeline(
  event: "",
  start: "",
  end: "",
) = {
  context {
    if target() != "html" {
      grid(
        columns: (auto, 6em, 1fr),
        align(left)[
          #event
        ],
        [],
        align(right)[
          #{ if type(start) == datetime [#start.display("[month repr:long] [year]")] else [#start] } - #{ if type(end) == datetime [#end.display("[month repr:long] [year]")] else [#end] }
        ],

        gutter: 0.5em,
      )
    } else {
      html.elem("table", attrs:("style":"width:100%"),
        html.elem("tr",{
          html.elem("td", attrs: (style:"text-align:left"))[
            #event
          ]
          html.elem("td", attrs: (style:"text-align:right"))[ #{ if type(start) == datetime [#start.display("[month repr:long] [year]")] else [#start] } - #{ if type(end) == datetime [#end.display("[month repr:long] [year]")] else [#end] } ]
        })
      )
    }
  }
}

#let edu(
  institution: "",
  date: "",
  degrees: (),
  location: "",
  gpa: "",
  details: "",
) = context {
  if target() != "html" {
    [#grid(
        columns: (auto, 1fr),
        align(left)[
          #{
            for degree in degrees [
              #strong[#degree]
            ]
          }#emph[#details]
          \ #institution
          \ #{
            if gpa != "" [
              GPA: #gpa
            ]
          }
        ],
        align(right)[
          #{ if location != "" { location } }
          #{
            if type(date) == datetime [
              \ #date.display("[month repr:long] [year]")
            ] else [
              \ #date
            ]
          }
        ],
      )
    ]
  } else {
    html.elem("table", attrs:("style":"width:100%"),
      {
        for degree in degrees {
          html.elem("tr", {
            html.elem("td", attrs: (style:"text-align:left"))[
              #strong[#degree], #emph[#details]
            ]
            html.elem("td", attrs: (style:"text-align:right"))[
              #{
                if type(date) == datetime [
                  \ #date.display("[month repr:long] [year]")
                ] else [
                  \ #date
                ]
              }
            ]
          })
          html.elem("tr", {
            html.elem("td", attrs: (style:"text-align:left"))[
              #institution
            ]
            html.elem("td", attrs: (style:"text-align:right"))[
              #if gpa != "" [
                #gpa
              ]
            ]
          })
        }
      }
    )
  }
}

#let exp(
  role: "",
  org: "",
  start: "",
  end: "",
  location: "",
  summary: "",
) = context {
if target() != "html" {
  [#grid(
    columns: (auto, 1fr),
    align(left)[
      #strong[#role]
      \ #org
      #{
        if summary != "" [
          \ #summary
        ]
      }
    ],
    align(right)[
      #{
        if location != "" [
          #location
        ]
      }
      #text[
        \ #{
          if type(start) == datetime {
            start.display("[month repr:long] [year]")
          } else { start }
        } #{
          if end != "" [
            #{
              if type(end) == datetime {
                end.display("- [month repr:long] [year]")
              } else [\- #end]
            }
          ]
        }]
    ],
  )]

} else {
    html.elem("table", attrs:("style":"width:100%"),
      {
        html.elem("tr", {
          html.elem("td", attrs: (style:"text-align:left"))[
            #strong[#role]
          ]
          html.elem("td", attrs: (style:"text-align:right"))[
            #location
          ]
        })
        html.elem("tr", {
          html.elem("td", attrs: (style:"text-align:left"))[
            #org
          ]
          html.elem("td", attrs: (style:"text-align:right"))[ #{ if type(start) == datetime [#start.display("[month repr:long] [year]")] else [#start] } - #{ if type(end) == datetime [#end.display("[month repr:long] [year]")] else [#end] } ]
        })
      }
    )
  }
}

#let ser(
  role: "",
  org: "",
  start: "",
  end: "",
  summary: none,
) = {
  grid(
    columns: (auto, 1fr),
    align(left)[
      #org, #strong[#role]
      #{
        if summary != none [
          \ #summary
        ]
      }
    ],
    align(right)[
      #text[
        #{
          if type(start) == datetime {
            start.display("[month repr:long] [year]")
          } else { start }
        } #{
          if end != "" [
            #{
              if type(end) == datetime {
                end.display("- [month repr:long] [year]")
              } else [\- #end]
            }
          ]
        }]
    ],
  )
}

#let award(
  name: "",
  date: "",
  from: "",
  amt: "",
  details: "",
) = context {
  if target() != "html" {
    grid(
      columns: (auto, 1fr),
      align(left)[
        #strong[#name,] #text[#from. #details]
      ],
      align(right)[
        #{ if type(date) == datetime [#date.display("[year]")] else [#date] }
      ],

      gutter: 0.5em,
    )
  } else {
    html.elem("table", attrs:("style":"width:100%"),
      html.elem("tr",{
        html.elem("td", attrs: (style:"text-align:left"))[
          #strong[#name,] #text[#from. #details]
        ]
        html.elem("td", attrs: (style:"text-align:right"))[
          #{ if type(date) == datetime [#date.display("[year]")] else [#date] }
        ]
      })
    )
  }
}


#let hide(
  should-hide,
  content,
) = {
  if not should-hide {
    content
  }
}


#let proj(
  title: "",
  advisors: (),
  institution: "",
  start: "",
  end: "",
  time: "",
  access: [],
  significance: [],
  skills: [],
) = {
  pagebreak()

  heading(title)
  grid(columns: (1fr, auto))

  strong[Access.]
  [#access]

  strong[Significance.]
  [#significance]

  strong[Skills.]
  [#skills]
}

#let abstract(
  authors: (),
  title: "",
  conference: "",
  number: "",
  pages: "",
  date: "",
  kind: "",
  location: "",
  DOI: none,
) = {
  let credit = (
    { if pages != "" [#pages,] else [] },
    { if kind != "" [ Abstract and #kind] else [ Abstract] },
    { if number != "" [ #number] },
  )
    .enumerate()
    .map(((i, cred)) => { if cred != none { [#cred] } else { none } })
    .join()

  enum.item[
    // #pad(right:6em)[
    #{ if type(authors) == array { authors.enumerate().map(((i, author)) => text(author)).join(", ") } else { authors } }.
    #title.
    #emph[#conference],
    // #date.display("[year] [month repr:long] [day]")\;
    #location\;
    #credit.
    #{
      if DOI != none [DOI: #link("https://doi.org" + DOI)[#DOI]]
    }
  ]
  // ]
}

#let paper(
  authors: (),
  title: "",
  journal: none,
  published: "",
  vol: none,
  issue: none,
  pages: none,
  DOI: none,
  show-link: false,
  file: "",
) = {
  let date = {
    if type(published) == datetime {
      // prefer datetime form
      strong[#published.display("[year]")]
    } else if type(published) == content or type(published) == str {
      // handle string/content form
      strong[#published]
    }
  }
  let credit = (
    { if journal != none { [#emph(journal) #date] } else { [#date] } },
    { if vol != none [, #vol#{ if issue != none [ (#issue)] }] },
    { if pages != none [, #pages] },
  )
    .enumerate()
    .map(((i, cred)) => { if cred != none { [#cred] } else { none } })
    .join()

  enum.item[
    #{ if type(authors) == array { authors.enumerate().map(((i, author)) => text(author)).join(", ") } else { authors } }.
    #title.
    #{ if credit != "" [#credit.] }
    #{
      if DOI != none [DOI: #link("https://doi.org" + DOI)[#DOI]]
    }
    #if file != "" {pdf.attach(file)}
]
}


#let preprint(
  authors: (),
  title: "",
  journal: "",
  published: "",
  status: none,
  DOI: none,
  file: "",
) = {
  let date = {
    if type(published) == datetime {
      published.display("[month repr:long] [day], [year]")
    } else {
      published
    }
  }

  enum.item[
    #{ if type(authors) == array { authors.enumerate().map(((i, author)) => text(author)).join(", ") } else { authors } }.
    #title.
    #emph[#status]#{ if date != "" [.] }
    #emph[#journal]#{ if date != "" [,] }#date.
    #{
      if DOI != none [DOI: #link("https://doi.org/" + DOI)[#DOI]]
    }
    #if file != "" {pdf.attach(file)}
  ]
}

#let pres(
  authors: (),
  title: "",
  conference: "",
  number: "",
  pages: "",
  date: "",
  kind: "",
  location: "",
  DOI: none,
) = {
  let credit = (
    { if pages != "" [#pages, ] },
    { if kind != "" [#kind] },
    { if number != "" [ #number] },
  )
    .enumerate()
    .map(((i, cred)) => { if cred != none [#cred] })
    .join()

  enum.item[
    // #pad(right: 6em)[
    #{ if type(authors) == array { authors.enumerate().map(((i, author)) => text(author)).join(", ") } else { authors } }.
    #title.
    #emph[#conference],
    // #date.display("[year] [month repr:long] [day]")\;
    #location\;
    #credit.
    #{
      if DOI != none [DOI: #link("https://doi.org" + DOI)[#DOI]]
    }
  ]
  // ]
}

#let extracurricular(
  role: "",
  org: "",
  start: "",
  end: "",
  location: "",
) = context {
  if target() != "html" {
    [#grid(
      columns: (auto, 1fr),
      align(left)[
        #strong[#org]
        \ #{
          if role != "" [
            #role
          ]
        }
      ],
      align(right)[
        #{
          if location != "" [
            #location
          ]
        }
        #text[
          \ #{
            if type(start) == datetime {
              start.display("[month repr:long] [year]")
            } else { start }
          } #{
            if end != "" [
              #{
                if type(end) == datetime {
                  end.display("- [month repr:long] [year]")
                } else [\- #end]
              }
            ]
          }]
      ],
    )]
  } else {
    html.elem("table", attrs:("style":"width:100%"),
      {
        html.elem("tr", {
          html.elem("td", attrs: (style:"text-align:left"))[
            #strong[#org]
          ]
          html.elem("td", attrs: (style:"text-align:right"))[ #{ if type(start) == datetime [#start.display("[month repr:long] [year]")] else [#start] } - #{ if type(end) == datetime [#end.display("[month repr:long] [year]")] else [#end] } ]
        })
        html.elem("tr", {
          html.elem("td", attrs: (style:"text-align:left"))[
            #role
          ]
        })
      }

    )
  }
}


#let festival(
  festival: "",
  category: "",
  date: "",
  score: "",
  pieces: "",
) = context {
  if target() != "html" {
    enum.item[
      #grid(
        columns: (auto, 3em, 1fr),
        align(left)[
          #strong[#score,] #text[#festival,  #category. #pieces]
        ],
        [],
        align(right)[
          #{ if type(date) == datetime [#date.display("[year]")] else [#date] }
        ],

        gutter: 1em,
      )
    ]
  } else {
    html.elem("table", attrs:("style":"width:100%"),
      html.elem("tr",{
        html.elem("td", attrs: (style:"text-align:left"))[
          #strong[#score,] #text[#festival, #category. #pieces]
        ]
        html.elem("td", attrs: (style:"text-align:right"))[
          #{ if type(date) == datetime [#date.display("[year]")] else [#date] }
        ]
      })
    )
  }
}

#let performance(
  musicians: (),
  program: "",
  location: none,
  date: "",
  performancelink: "",
) = {
  enum.item[
    #{ if type(musicians) == array { musicians.enumerate().map(((i, musicians)) => text(musicians)).join(", ") } else { musicians } }.
    #program, #emph[#location]. #{
      if type(date) == datetime { date.display("[month repr:long] [year]") } else { date }
    }.
    #{
      if (
        performancelink != ""
      ) [link: #emph[#link("https://y2u.be/" + performancelink)[#{ "https://y2u.be/" + performancelink }]]]
    }
  ]
}
