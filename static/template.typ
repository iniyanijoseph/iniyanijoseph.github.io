#let resume(body) = {
  set list(indent: 1em)
  show list: set text(size: 0.92em)
  show link: underline
  show link: set underline(offset: 3pt)

  set page(
    paper: "us-letter",
    margin: (x: 0.5in, y: 0.5in)
  )

  set text(
    size: 9pt,
      font: "New Computer Modern",
  )

  body
}

#let name_header(name) = {
  set text(size: 2.15em)
  [*#name*]
}

#let header(
  name: "Firstname Lastname",
  phone: "123-456-7890",
  email: "email@domain.extension",
  linkedin: "linkedin.com/in/name",
  site: "github.com/name",
) = {
  align(center,
    block[
      #name_header(name) \
      #phone |
      #link("mailto:" + email)[#email] |
      #link("https://" + linkedin)[#linkedin] |
      #link("https://" + site)[#site]
    ]
  )
  v(5pt)
}

#let resume_heading(txt) = {
  show heading: set text(size: 0.92em, weight: "regular")

  block[
    = #smallcaps(txt)
    #v(-4pt)
    #line(length: 100%, stroke: 1pt + black)
  ]
}

#let edu_item(
  name: "University", 
  degree: "B.S in Degree", 
  location: "Foo, BA", 
  date: "Aug. 1600 - May 1750"
) = {
  set block(above: 0.7em, below: 1em)
  pad(left: 1em, right: 0.5em, grid(
    columns: (3fr, 1fr),
    align(left)[
      *#name* \
      _#degree _
    ],
    align(right)[
      #location \
      _#date _
    ]
  ))
}

#let exp_item(
  name: "Workplace",
  role: "Worker",
  date: "June 1837 - May 1845",
  location: "Foo, BA",
  ..points
) = {
    set block(above: 0.7em, below: 1em)
    pad(left: 1em, right: 0.5em, box[
      #grid(
        columns: (3fr, 1fr),
        align(left)[
          *#role* \
          _#name _
        ],
        align(right)[
          #date \
          _#location _
        ]
      )
      #list(..points)
    ])
}

#let project_item(
  name: "Example Project",
  skills: "Programming Language 1, Database3",
  date: "May 1234 - June 4321",
  ..points
) = {
  set block(above: 0.7em, below: 1em)
  pad(left: 1em, right: 0.5em, box[
    *#name*  _#skills _ #h(1fr) #date
    #list(..points)
  ])
}


#let research_item(
  name: "Example Paper",
  authors: "John Smith, Jane Smith",
  conference: "SODA",
) = {
  set block(above: 0.7em, below: 1em)
  pad(left: 1em, right: 0.5em, box[
    #text(size: 9pt)[*#name*  #h(1fr) #conference\ _  #authors _]
  ])
}

#let piano_item(
  event: "Federation",
  score: "Outstanding",
  ..pieces
) = {
  set block(above: 0.7em, below: 1em)
  pad(left: 1em, right: 0.5em, box[
    #text(size: 9pt)[*#event*  #h(1fr) _ #score _]
    #list(..pieces)
  ])
}

#let skill_item(
  category: "Skills",
  skills: "Balling, Yoga, Valorant",
) = {
  set block(above: 0.7em)
  set text(size: 0.91em)
  pad(left: 1em, right: 0.5em, block[*#category*: #skills])
}
