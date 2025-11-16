#import "cv_template.typ":* 
#let showpiano = false
#show: cv.with(
  author: "Iniyan Joseph",
  contacts: (
    [#link("mailto:iniyanijoseph@gmail.com")[iniyanijoseph\@gmail.com]],
    [#link("https://iniyanijoseph.github.io")[iniyanijoseph.github.io]]
  ),
  updated: datetime.today(),
)
= Education
#edu(
  institution: "The University of Texas at Dallas",
  degrees: (
    [Bachelor of Science, Computer Science],
  ),
  date: datetime(year: 2025, month: 08, day: 23),
  gpa: "3.99/4",
  details: "Summa Cum Laude",
)

== Employment

#exp(
  role: "Teacher",
  org: "KD College Prep",
  location: "Richardson, TX",
  start: datetime(year: 2025, month: 10, day: 15),
  end: "Present",
)

#exp(
  role: "Software Engineer",
  org: "ReviveXR",
  location: "Richardson, TX",
  start: datetime(year: 2025, month: 6, day: 15),
  end: datetime(year: 2025, month: 12, day: 15),
)

#exp(
  role: "Substitute Teacher",
  org: "Frisco Independent School District",
  location: "Frisco, TX",
  start: datetime(year: 2025, month: 8, day: 15),
  end: datetime(year: 2025, month: 10, day: 15),
)

#exp(
  role: "Grader - Discrete Mathematics for Computing",
  org: "The University of Texas at Dallas",
  location: "Richardson, TX",
  start: datetime(year: 2025, month: 1, day: 15),
  end: datetime(year: 2025, month: 5, day: 15),
)

== Research
#timeline(start: datetime(year: 2024, month: 8, day: 22), end: "Present", event: "Advised by Emily Fox")

#timeline(start: datetime(year: 2023, month: 9, day: 22), end: datetime(year: 2024, month: 9, day: 20), event: "Advised by Jin-Ryong Kim")
=== Publications
#paper(
  authors: ([Hyunjae Gil], [*Iniyan Joseph*], [Jin-Ryong Kim]),
  title: "PropType: Everyday Props as Typing Surfaces in Augmented Reality",
  journal: "ACM CHI",
  published: datetime(year: 2025, month: 03, day: 17),
  DOI: "10.1145/3706598.3714056",
)

#paper(
  authors: ([Hyunjae Gil], [*Iniyan Joseph*], [Jin-Ryong Kim]),
  title: "Design Challenges of In-Air Thumb Typing on Head-Mounted Displays",
  journal: "Submitted",  
)

#preprint(
  authors: ([*Iniyan Joseph*]),
  title: "Survey of Discrete Fair Division",
  journal: "CS 4V95 - Independent Study",
)

== Awards & Honors
#award(
  name: "Dean's List",
  from: "The University of Texas at Dallas",
  date:"Fall 2023, Spring 2024, Spring 2025, Summer 2025",
)

#award(
  name: "Academic Excellence Scholarship",
  from: "The University of Texas at Dallas",
  date: "Fall 2023 - Summer 2025",
)

#award(name: "Gold Cup",
  from: "Texas Federation of Music Clubs",
  date: datetime(year: 2023, month: 5, day: 15),)
  
== Other Activities
#extracurricular(
  role: "President",
  org: "UTD Algorithms Club",
  start: datetime(year: 2024, month: 5, day: 1),
  end: datetime(year: 2025, month: 8, day: 23)
)

#extracurricular(
  org: "UTD Codeburners (Competitive Programming)",
  start: datetime(year: 2023, month: 8, day: 1),
  end: datetime(year: 2025, month: 8, day: 23)
)
#extracurricular(
  org: "Nebula Labs",
  start: datetime(year: 2023, month: 8, day: 1),
  end: datetime(year: 2025, month: 3, day: 1)
)
// Piano Stuff
#{if showpiano [
=== Piano

==== Performance
#performance(
  program: "Joy Has Dawned",
  location: "Cedar Creek Lake United Methodist Church",
  date: datetime(year: 2024, month: 12, day: 1),
  musicians: ([Seth Thomas], [*Iniyan Joseph*]),
  performancelink: "z0EX8l6ZWnk",
)
#performance(
  program: "Fall 2024 Recital",
  location: "Cedar Creek Lake United Methodist Church",
  date: datetime(year: 2024, month: 10, day: 1),
  musicians: ([Seth Thomas], [*Iniyan Joseph*]),
  performancelink: "tY56WEPD9R0",
)
#performance(
  program: "A Christmas for All Time",
  location: "Cedar Creek Lake United Methodist Church",
  date: datetime(year: 2023, month: 12, day: 1),
  musicians: ([Seth Thomas], [*Iniyan Joseph*]),
  performancelink: "0odLKW9OCaA",
)
#performance(
  program: "Senior Recital",
  location: "McKinney Bible Church",
  date: datetime(year: 2023, month:8 , day: 1),
  musicians: ([*Iniyan Joseph*]),
  performancelink: "T3SfiNYB4DA",
)
#performance(
  program: "Senior Recital",
  location: "Cedar Creek Lake United Methodist Church",
  date: datetime(year: 2023, month: 7, day: 1),
  musicians: ([*Iniyan Joseph*]),
  performancelink: "Sk_h7YYb2-I",
)
#performance(
  program: "Addams Family Musical",
  location: "Independence High School",
  date: datetime(year: 2023, month: 1, day: 1),
  musicians: ([Independence High School Pit Orchestra]),
)
#performance(
  program: "Let There be Christmas",
  location: "Cedar Creek Lake United Methodist Church",
  date: datetime(year: 2022, month: 12, day: 1),
  musicians: ([Seth Thomas], [*Iniyan Joseph*]),
  performancelink: "f2X2m_pDQNw",
)
#performance(
  program: "Tuck Everlasting",
  location: "Independence High School",
  date: datetime(year: 2022, month: 1, day: 1),
  musicians: ([Independence High School Pit Orchestra]),
)

==== Festivals and Competitions
#festival(
  score: "Outstanding",
  festival: "Texas Federation of Music Clubs",
  category: "Musically Advanced Class II",
  date: datetime(year: 2023, month: 5, day: 1),
  pieces: "Rachmaninov Polichinelle op. 3 no. 4",
)
#festival(
  score: "Outstanding",
  festival: "National Federation of Music Clubs",
  category: "Musically Advanced Class II",
  date: datetime(year: 2023, month: 3, day: 1),
  pieces: "Rachmaninov Polichinelle op. 3 no. 4, Beethoven Tempest Sonata mvmt. 3",
)
#festival(
  score: "1",
  festival: "University Interscholastic League - Solo and Ensemble",
  category: "1",
  date: datetime(year: 2023, month: 1, day: 1),
  pieces: "Beethoven Tempest Sonata mvmt. 3",
)
#festival(
  score: "Outstanding",
  festival: "Texas Federation of Music Clubs",
  category: "Very Difficult Class 2",
  date: datetime(year: 2022, month: 5, day: 1),
  pieces: "Rachmaninoff Prelude c# minor op 3. no 2",
)
#festival(
  score: "Outstanding",
  festival: "National Federation of Music Clubs",
  category: "Very Difficult Class 2",
  date: datetime(year: 2022, month: 3, day: 1),
  pieces: "Rachmaninoff Prelude c# minor op 3. no 2, Bach Invention a minor BWV 784",
)
#festival(
  score: "1",
  festival: "University Interscholastic League - Solo and Ensemble",
  category: "2",
  date: datetime(year: 2022, month: 1, day: 1),
  pieces: "Bach Invention a minor BWV 784",
)
#festival(
  score: "Outstanding",
  festival: "Texas Federation of Music Clubs",
  category: "Difficult Class 2",
  date: datetime(year: 2021, month: 5, day: 1),
  pieces: "Roubos Rapsodia Española",
)
#festival(
  score: "Outstanding",
  festival: "National Federation of Music Clubs",
  category: "Difficult Class 2",
  date: datetime(year: 2021, month: 3, day: 1),
  pieces: "Roubos Rapsodia Española, Beethoven Bagatelle op. 119 no. 1",
)
]}
