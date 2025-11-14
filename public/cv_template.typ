/// Apply the cv layout to the document.
/// Sets up a header for the front page.
/// Additional sections should be created using other functions, such as `exp` and `edu`.
/// -> content
#let cv(
  /// The person to be listed at the top of the CV.
  /// This is probably where your name goes.
  /// -> content
  author: "",
  /// Your address, preferably in two-line format. -> str | content
  address: "",
  /// A list of contact information. Email, GitHub, and LinkedIn are all good things to put here. -> array
  contacts: (),
  /// Date updated. -> datetime | str
  updated: datetime.today(),
  /// The content of the cv. -> content
  body,
) = {
  // Sets document metadata
  set document(author: author, title: author, date: updated)

  // Document-wide formatting, including font and margins
  set text(
    size: 11pt,
    lang: "en",
    font: "New Computer Modern"
  )

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

  // shrink headings
  show heading: it => text(size: 12pt, it.body)
  // show heading.where(level: 1): it => pad(bottom: 12pt, smallcaps(it))
  show heading.where(level: 2): it => pad(bottom: 0pt, it)
  show heading.where(level: 3): it => text(size:11pt, it.body)
  show heading.where(level: 4): it => text(size:11pt, emph[#it.body])

  // Author
  align(center)[
    #block(text(size: 14pt, weight: 700, [#smallcaps(author)]))
  ]

  // Contact
  pad(
    top: 0pt,
    align(center)[
      #[#contacts.join(" | ")]
    ],
  )

  // Main body.
  set par(justify: true)

  body
}

#let timeline(
  /// The name of the award. If it is a specific grant, the identifier can also go here. -> content | str | none
  event: "",
  /// Date the award was given. -> datetime | str | none
  start: "",
  /// Date the award was given. -> datetime | str | none
  end: "",

) = {
  grid(
    columns: (8em, auto, 3em),
    align(left)[
      #{ if type(start) == datetime [#start.display("[month repr:short] [year]")] else [#start] }-#{ if type(end) == datetime [#end.display("[month repr:short] [year]")] else [#end] }
    ],
    align(left)[
      #event
    ],
    gutter: 0.5em,
  )
}

/// Create an education entry, suitable for one degree and accompanying information.
/// -> content
#let edu(
  /// Degree-granting institution. -> str | content
  institution: "",
  /// Date of graduation / attaining degree. -> str | datetime
  date: "",
  /// Degrees obtained.
  /// Majors are traditionally listed directly with the degree type.
  /// Minors might be listed as an additional entry in the array:
  /// `([Degree], [Minor: Basketweaving])`
  /// -> array
  degrees: (),
  /// Location of institution. -> str | content
  location: "",
  /// (optional) GPA and additional honors. -> str | content
  gpa: "",
  /// (optional) Additional details. -> str | content
  details: "",
) = {
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
            // parse datatime variables into nicely formatted dates
            \ #date.display("[month repr:long] [year]")
          ] else [
            // or allow strings for cases like expected graduation date
            \ #date
          ]
        }
      ],
    )
    // #{ if details != "" [#details] }
  ]
}


/// Create an entry detailing work experience.
/// -> content
#let exp(
  /// Role at the organization. -> str
  role: "",
  /// Organization that the work took place at. -> str
  org: "",
  /// Start date of employment. -> datetime | str | none
  start: "",
  /// End date of employment. -> datetime | str | none
  end: "",
  /// Location that the work took place at.
  /// List where you actually worked, rather than where the company's main office might be.
  /// -> str
  location: "",
  /// One-sentence summary of the work. -> str | none
  summary: "",
  /// Detailed description of the work, traditionally in bullet points.
  /// -> content | none
  details: [],
) = {
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
    ) #details]
}


/// Create an entry detailing service to the field.
/// -> content
#let ser(
  /// Role in which you served. -> str
  role: "",
  /// Organization that the service was done with. -> str | none
  org: "",
  /// Start date of work. -> datetime | str | none
  start: "",
  /// End date of work. -> datetime | str | none
  end: "",
  /// One-sentence summary of work. -> str | none
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


/// Creates an entry for an award, such as a scholarship or fellowship.
/// -> content
#let award(
  /// The name of the award. If it is a specific grant, the identifier can also go here. -> content | str | none
  name: "",
  /// Date the award was given. -> datetime | str | none
  date: "",
  /// Institution that granted the award. -> content | str | none
  from: "",
  /// (optional) Amount of the award. -> content | str | int | none
  amt: "",
  /// (optional) Detailed description of the award. -> content | str | none
  details: "",
) = {
  grid(
    columns: (6em, auto, 3em),
    align(left)[
      #{ if type(date) == datetime [#date.display("[year]")] else [#date] }
    ],
    align(left)[
      #strong[#name,] #text[#from. #details]
    ],
    gutter: 0.5em,
  )
}


/// Skills section formatting, responsible for collapsing individual entries into a single list.
/// -> content
#let skills(
  /// A list of skills in a particular area.
  /// -> array(str, array)
  areas,
) = {
  for area in areas {
    strong[#area.at(0): ]
    area.at(1).join(" | ")
    linebreak()
  }
}

/// Allows hiding or showing full resume dynamically using global variable. This can
/// be helpful for creating a single document that can be rendered differently depending on
/// the desired output, for cases where you'd like to simultaneously render both a full copy
/// and a single-page instance of only the most important or vital information.
/// -> content
#let hide(
  /// Whether or not to hide the content. -> bool
  should-hide,
  /// Content to be hidden -> content
  content,
) = {
  if not should-hide {
    content
  }
}


/// Create an entry documenting a research project.
/// Styled after the Goldwater CV entries, which record:
/// - Manner of access
/// - Project significance
/// - Skills obtained
/// -> content
#let proj(
  /// Title of the project. -> str | content | none
  title: "",
  /// Advisors, such as faculty or graduate students, who mentored you on the project.
  /// -> array
  advisors: (),
  /// Institution where the project took place.
  institution: "",
  /// Start date of the project. -> datetime | str | none
  start: "",
  /// End date of the project. -> datetime | str | none
  end: "",
  /// End date of the project. -> datetime | str | none
  time: "",
  /// Manner of access to the project. -> content | str | none
  access: [],
  /// Significance of the project. -> content | str | none
  significance: [],
  /// Skills learned through the project. -> content | str | none
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

/// Create a publications entry for a conference abstract.
/// -> content
#let abstract(
  /// List of authors in order. -> array | str
  authors: (),
  /// Title of the abstract. -> str | content
  title: "",
  /// Conference that the abstract was presented in/submitted to. -> str | content
  conference: "",
  /// (optional) Submission number for the abstract. -> str | int | content
  number: "",
  /// (optional) Page number in the abstract booklet. Omit if the book was not paginated
  ///  or if the abstract repository was entirely digital.
  /// -> int | str | content | none
  pages: "",
  /// Date the abstract was presented. -> datetime | str
  date: "",
  /// Kind of presentation that the abstract was used for. -> str | content | none
  kind: "",
  /// Location of the conference. Format as City State, Country. -> str | content | none
  location: "",
  /// (optional) Digital Object Identifier for the abstract. -> str | content | none
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
}

/// Create a publications entry for a peer-reviewed paper.
/// -> content
#let paper(
  /// List of authors in order. -> array | str
  authors: (),
  /// Title of the abstract. -> str | content
  title: "",
  /// Journal that the paper was published in. -> str | content | none,
  journal: none,
  /// Date of publication. -> datetime | str | content | none
  published: "",
  /// (optional) Volume of the journal. -> str | content | none
  vol: none,
  /// (optional) Issue of the journal. -> str | content | none
  issue: none,
  /// (optional) Page range of publication in journal. -> str | content | none
  pages: none,
  /// (optional) Digital Object Identifier for publication. -> str | content | none
  DOI: none,
  /// Whether or not to show the DOI -> bool
  show-link: false,
) = {
  // date formatting
  let date = {
    if type(published) == datetime {
      // prefer datetime form
      strong[#published.display("[year]")]
    } else if type(published) == content or type(published) == str {
      // handle string/content form
      strong[#published]
    }
  }

  // take list of identifiers for journal (journal name, volume, issue, pages) and flatten them into single string.
  let credit = (
    { if journal != none { [#emph(journal) #date] } else { [#date] } },
    { if vol != none [, #vol#{ if issue != none [ (#issue)] }] },
    { if pages != none [, #pages] },
  )
    .enumerate()
    .map(((i, cred)) => { if cred != none { [#cred] } else { none } })
    .join()

  // the actual item listed
  enum.item[
    #{ if type(authors) == array { authors.enumerate().map(((i, author)) => text(author)).join(", ") } else { authors } }.
    #title.
    #credit. // #{if credit != "" [#credit]}
    #{
      if DOI != none [DOI: #link("https://doi.org" + DOI)[#DOI]]
    }
  ]
}


/// Create an entry detailing a preprinted (non-peer-reviewed) manuscript.
/// -> content
#let preprint(
  /// List of authors in order. -> array | str
  authors: (),
  /// Title of the abstract. -> str | content
  title: "",
  /// Preprint archive that the manuscript was published in. -> str | content | none,
  journal: "",
  /// Date of publication. -> datetime | str | content | none
  published: "",
  /// (optional) Status of the manuscript. Traditionally listed as "submitted" or "in revisions", depending on progress.
  /// -> str | none
  status: none,
  /// (optional) Digital Object Identifier for publication. -> str | content | none
  DOI: none,
) = {
  // date formatting
  let date = {
    if type(published) == datetime {
      // prefer datetime form
      published.display("[month repr:long] [day], [year]")
    } else {
      // handle string/content form
      published
    }
  }

  // the actual item listed
  enum.item[
    #{ if type(authors) == array { authors.enumerate().map(((i, author)) => text(author)).join(", ") } else { authors } }.
    #title.
    #emph[#status]#{if date != "" [.]}
    #emph[#journal]#{if date != "" [,]}#date.
    #{
      if DOI != none [DOI: #link("https://doi.org/" + DOI)[#DOI]]
    }
  ]
}

/// Create an entry for a conference presentation.
/// -> content
#let pres(
  /// List of authors in order. -> array | str
  authors: (),
  /// Title of the abstract. -> str | content
  title: "",
  /// Conference that the abstract was presented in/submitted to. -> str | content
  conference: "",
  /// (optional) Submission number for the abstract. -> str | int | content
  number: "",
  /// (optional) Page number in the abstract booklet. Omit if the book was not paginated
  ///  or if the abstract repository was entirely digital.
  /// -> int | str | content | none
  pages: "",
  /// Date the abstract was presented. -> datetime | str
  date: "",
  /// Kind of presentation that the abstract was used for. -> str | content | none
  kind: "",
  /// Location of the conference. Format as City State, Country. -> str | content | none
  location: "",
  /// (optional) Digital Object Identifier for the abstract. -> str | content | none
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
}

/// Create an entry for an Extracurricular Activity
/// -> content
#let extracurricular(
  /// Role at the organization. -> str
  role: "",
  /// Organization that the work took place at. -> str
  org: "",
  /// Start date of extracurricular activity. -> datetime | str | none
  start: "",
  /// End date of extracurricular activity. -> datetime | str | none
  end: "",
  /// Location that the work took place at.
  /// List where you actually worked, rather than where the company's main office might be.
  /// -> str
  location: "",
  /// One-sentence summary of the work. -> str | none
  /// -> content | none
) = {
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
}

// Piano Stuff

/// Creates an entry for an award, such as a scholarship or fellowship.
/// -> content
#let festival(
  /// The name of the award. If it is a specific grant, the identifier can also go here. -> content | str | none
  festival: "",
  category: "",
  date: "",
  score: "",
  pieces: "",
) = {
  grid(
    columns: (4em, auto, 3em),
    align(left)[
      #{ if type(date) == datetime [#date.display("[year]")] else [#date] }
    ],
    align(left)[
      #strong[#score,] #text[#festival,  #category. #pieces]
    ],
    gutter: 0.5em,
  )
}
// #performance(
//   program: "Let There be Christmas",
//   location: "Cedar Creek Lake United Methodist Church",
//   date: datetime(year: 2022, month: 12, day: 1),
//   peformers: ([Seth Thomas], [*Iniyan Joseph*]) ,
//   link: "",
// )
#let performance(
  /// List of performers in order. -> array | str
  musicians: (),
  /// Name of the Program. -> str | content
  program: "",
  /// Location or Event for Program. -> str | content | none,
  location: none,
  /// Date of publication. -> datetime | str | content | none
  date: "",
  performancelink: "",
) = {
  // the actual item listed
  enum.item[
    #{ if type(musicians) == array { musicians.enumerate().map(((i, musicians)) => text(musicians)).join(", ") } else { musicians } }.
    #program, #emph[#location]. \ #{
      if type(date) == datetime {
        date.display("[month repr:long] [year]")
      } else { date }
    }
    #{
      if performancelink != "" [link: #emph[#link("https://y2u.be/" + performancelink)[#{"https://y2u.be/"+performancelink}]]]
    }
  ]
}
