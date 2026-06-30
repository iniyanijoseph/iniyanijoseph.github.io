#import "src/tufted.typ": *
#import "@preview/bullseye:0.1.0":*

#show: tufted-web.with(
  title: "Iniyan Joseph",
  nav: (
    ("index.html",  "Home"),
    ("mailto:iniyanijoseph@gmail.com",  "Email"),
    ("cv.pdf",    "CV"),
    ("blog",  "Blog"),
  ),
  email: "iniyanijoseph@gmail.com",
  website: "https://iniyanjoseph.com",
  icon: "./photo.jpg",
)
#margin-note(image("photo.jpg"))
#margin-note([My name is Iniyan Joseph. I am an incoming Ph.D. Computer Science student at Purdue, advised by #link("https://www.alexpsomas.com/home")[Alex Psomas]. I completed my undergraduate degree at the University of Texas at Dallas, where I had the honor of working with #link("https://ekfox.web.illinois.edu/")[Emily K. Fox] and #link("https://jessekim.com/")[Jin-Ryong Kim]. Broadly, I am interested in Theory CS — especially Algorithmic Game Theory and Combinatorial Optimization.])
#margin-note(link("https://iniyanjoseph.com")[Website])
#margin-note(link("mailto:iniyanijoseph@gmail.com")[Email])
#margin-note(link("https://calendar.app.google/UfMqmGkxtsVEtBMN9")[Schedule a Meeting])

== Education
#edu(
  start: dt(2026, 8),
  end: "Present",
  degree: "Ph.D. in Computer Science",
  university: "Purdue University",
  advisor: "Alex Psomas",
)

#edu(
  start: dt(2023, 8),
  end: dt(2025, 8),
  degree: "B.S. in Computer Science",
  university: "University of Texas at Dallas",
  details: context {
    if target() != "html" { "Graduated Summa Cum Laude (3.987/4)" } else {
      link("school/utdtranscript.pdf")[Graduated Summa Cum Laude (3.987/4)]
    }
  },
)

== Research
#paper("papers/publications.bib")
== Employment

#job(
  start: dt(2025, 10),
  end: "Present",
  role: "Math Teacher",
  location: "KD College Prep",
)

#job(
  start: dt(2025, 6),
  end: dt(2025, 12),
  role: "Software Engineer",
  location: "ReviveXR",
)

#job(
  start: dt(2025, 8),
  end: dt(2025, 10),
  role: "Substitute Teacher",
  location: "Frisco Independent School District",
)

#job(
  start: dt(2025, 1),
  end: dt(2025, 5),
  role: "Grader – Discrete Math for Computing",
  location: "University of Texas at Dallas",
)

#job(
  start: dt(2022, 12),
  end: dt(2025, 12),
  role: "Pianist (Seasonal)",
  location: "Cedar Creek Lake United Methodist Church",
)

== Awards & Honors

#award(
  start: dt(2026, 8),
  end: dt(2027, 5),
  name: "Herbold Scholarship",
  description: "Purdue University",
)

#award(
  start: dt(2023, 8),
  end: dt(2025, 8),
  name: "Academic Excellence Scholarship",
  description: "University of Texas at Dallas",
)

#award(
  start: dt(2023, 8),
  end: dt(2025, 8),
  name: "Dean's List",
  description: "University of Texas at Dallas (Fall 2023, Spring 2024, Spring 2025, Summer 2025)",
)
== Activities
#other(
  start: dt(2024, 5),
  end: dt(2025, 8),
  name: "UTD Algorithms Club",
  description: "President",
)

#other(
  start: dt(2023, 8),
  end: dt(2025, 8),
  name: "UTD Codeburners",
  description: "",
)

// #other(
//   start: dt(2023, 8),
//   end: dt(2024, 3),
//   name: "Nebula Labs",
//   description: "",
// )

