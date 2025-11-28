#import "@preview/bullseye:0.1.0": *
#import "base.typ": *
#import "cv_template.typ": *
#import "fields.typ": *

#show: cv.with(author: "Iniyan Joseph", icon: "favicon.ico")

== Education
#edu(
  start: dt(2023, 8),
  end: dt(2025, 8),
  degree: "B.S. in Computer Science",
  university: "University of Texas at Dallas",
  details: "Graduated Summa Cum Laude (3.987/4)",
)

== Research
#other(start: dt(2024, 9), end: "Present", name: "Advised by Emily Fox", description: "")

#other(start: dt(2023, 9), end: dt(2024, 9), name: "Advised by Jin-Ryong Kim", description: "")

=== Publications
#bibliography("publications.bib", title: none, full: true)

== Employment
#job(
  start: dt(2025, 10),
  end: "Present",
  role: "Teacher",
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
  role: "Grader - Discrete Math for Computing",
  location: "University of Texas at Dallas",
)

#job(
  start: dt(2022, 12),
  end: dt(2025, 12),
  role: "Pianist - Seasonal",
  location: "Cedar Creek Lake United Methodist Church",
)

== Awards & Honors
#award(
  start: datetime(year: 2023, month: 8, day: 1),
  end: datetime(year: 2025, month: 8, day: 23),
  name: "Academic Excellence Scholarship",
  description: "University of Texas at Dallas",
)

#award(
  start: datetime(year: 2023, month: 8, day: 1),
  end: datetime(year: 2025, month: 8, day: 23),
  name: "Dean's List",
  description: "University of Texas at Dallas, (Fall 2023, Spring 2024, Spring 2025, Summer 2025)",
)

#award(date: datetime(year: 2023, month: 5, day: 1), name: "Gold Cup", description: "Texas Federation of Music Clubs")

#context {
  if target() == "html" [
    == Projects


  ]
}

== Other Activities
#other(
  start: datetime(year: 2024, month: 5, day: 1),
  end: datetime(year: 2025, month: 8, day: 23),
  name: "UTD Algorithms Club",
  description: "President",
)

#other(
  start: datetime(year: 2023, month: 8, day: 1),
  end: datetime(year: 2025, month: 8, day: 23),
  name: "UTD Codeburners",
  description: "",
)

#other(
  start: datetime(year: 2023, month: 8, day: 1),
  end: datetime(year: 2024, month: 3, day: 23),
  name: "Nebula Labs",
  description: "",
)

#context {
  if target() == "html" [
    === Piano
    #other(start: datetime(year: 2009, month: 5, day: 1), end: "Present", name: "Piano")

    ==== Performance
    #performance(
      name: "Joy Has Dawned",
      location: "Cedar Creek Lake United Methodist Church",
      date: datetime(year: 2024, month: 12, day: 1),
      musicians: "Seth Thomas, Iniyan Joseph",
      details: "z0EX8l6ZWnk",
    )
    #performance(
      name: "Fall 2024 Recital",
      location: "Cedar Creek Lake United Methodist Church",
      date: datetime(year: 2024, month: 10, day: 1),
      musicians: "Seth Thomas, Iniyan Joseph",
      details: "tY56WEPD9R0",
    )
    #performance(
      name: "A Christmas for All Time",
      location: "Cedar Creek Lake United Methodist Church",
      date: datetime(year: 2023, month: 12, day: 1),
      musicians: "Seth Thomas, Iniyan Joseph",
      details: "0odLKW9OCaA",
    )
    #performance(
      name: "Senior Recital",
      location: "McKinney Bible Church",
      date: datetime(year: 2023, month: 8, day: 1),
      musicians: "Iniyan Joseph",
      details: "T3SfiNYB4DA",
    )
    #performance(
      name: "Senior Recital",
      location: "Cedar Creek Lake United Methodist Church",
      date: datetime(year: 2023, month: 7, day: 1),
      musicians: "Iniyan Joseph",
      details: "Sk_h7YYb2-I",
    )
    #performance(
      name: "Addams Family Musical",
      location: "Independence High School",
      date: datetime(year: 2023, month: 1, day: 1),
      musicians: "Independence High School Pit Orchestra",
    )
    #performance(
      name: "Let There be Christmas",
      location: "Cedar Creek Lake United Methodist Church",
      date: datetime(year: 2022, month: 12, day: 1),
      musicians: "Seth Thomas, Iniyan Joseph",
      details: "f2X2m_pDQNw",
    )
    #performance(
      name: "Tuck Everlasting",
      location: "Independence High School",
      date: datetime(year: 2022, month: 1, day: 1),
      musicians: "Independence High School Pit Orchestra",
    )

    ==== Festivals and Competitions
    #festival(
      score: "Outstanding",
      name: "Texas Federation of Music Clubs",
      category: "Musically Advanced Class II",
      date: datetime(year: 2023, month: 5, day: 1),
      details: "Rachmaninov Polichinelle op. 3 no. 4",
    )
    #festival(
      score: "Outstanding",
      name: "National Federation of Music Clubs",
      category: "Musically Advanced Class II",
      date: datetime(year: 2023, month: 3, day: 1),
      details: "Rachmaninov Polichinelle op. 3 no. 4, Beethoven Tempest Sonata mvmt. 3",
    )
    #festival(
      score: "1",
      name: "University Interscholastic League - Solo and Ensemble",
      category: "1",
      date: datetime(year: 2023, month: 1, day: 1),
      details: "Beethoven Tempest Sonata mvmt. 3",
    )
    #festival(
      score: "Outstanding",
      name: "Texas Federation of Music Clubs",
      category: "Very Difficult Class 2",
      date: datetime(year: 2022, month: 5, day: 1),
      details: "Rachmaninoff Prelude c# minor op 3. no 2",
    )
    #festival(
      score: "Outstanding",
      name: "National Federation of Music Clubs",
      category: "Very Difficult Class 2",
      date: datetime(year: 2022, month: 3, day: 1),
      details: "Rachmaninoff Prelude c# minor op 3. no 2, Bach Invention a minor BWV 784",
    )
    #festival(
      score: "1",
      name: "University Interscholastic League - Solo and Ensemble",
      category: "2",
      date: datetime(year: 2022, month: 1, day: 1),
      details: "Bach Invention a minor BWV 784",
    )
    #festival(
      score: "Outstanding",
      name: "Texas Federation of Music Clubs",
      category: "Difficult Class 2",
      date: datetime(year: 2021, month: 5, day: 1),
      details: "Roubos Rapsodia Española",
    )
    #festival(
      score: "Outstanding",
      name: "National Federation of Music Clubs",
      category: "Difficult Class 2",
      date: datetime(year: 2021, month: 3, day: 1),
      details: "Roubos Rapsodia Española, Beethoven Bagatelle op. 119 no. 1",
    )
  ] else [
    #other(start: datetime(year: 2009, month: 5, day: 1), end: "Present", name: "Piano")
  ]
}
