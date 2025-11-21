#import "@preview/bullseye:0.1.0": *
#import "base.typ":* 
#import "cv_template.typ":* 
#import "fields.typ":* 

#show: cv.with(author: "Iniyan Joseph", )

#let day1 = datetime(year: 2008, month: 1, day: 1)
#let day2 = datetime(year: 2010, month: 1, day: 1)

== Education
#edu(
  start: day1,
  end: datetime(year:2025, month:8, day: 23),
  degree: "B.S. in Computer Science",
  university: "University of Texas at Dallas",
  details: "Graduated Summa Cum Laude (3.987/4.00)",
)


== Research
#other(start: datetime(year:2024, month:9, day: 1), end: "Present", name: "Advised by Emily Fox", description: "")

#other(start: datetime(year:2023, month:9, day: 1), end: datetime(year:2024, month:9, day: 23), name: "Advised by Jin-Ryong Kim", description: "")

=== Publications
#bibliography("publications.bib", title: none, full: true)

== Employment
#job(
  start: day1,
  end: day2,
  role: "Teacher",
  location: "KD College Prep"
)

#job(
  start: day1,
  end: day2,
  role: "Software Engineer",
  location: "ReviveXR"
)

#job(
  start: day1,
  end: day2,
  role: "Substitute Teacher",
  location: "Frisco Independent School District"
)

#job(
  start: day1,
  end: day2,
  role: "Grader - Discrete Math for Computing",
  location: "University of Texas at Dallas"
)

#job(
  start: day1,
  end: day2,
  role: "Pianist",
  location: "Cedar Creek Lake United Methodist Church"
)

== Awards & Honors
#award(start: datetime(year:2023, month:8, day: 1), end: datetime(year:2025, month:8, day: 23), name: "Academic Excellence Scholarship", description: "University of Texas at Dallas")

#award(start: datetime(year:2023, month:8, day: 1), end: datetime(year:2025, month:8, day: 23), name: "Dean's List", description: "University of Texas at Dallas, (Fall 2023, Spring 2024, Spring 2025, Summer 2025)")

#award(date: datetime(year:2023, month:5, day: 1), name: "Gold Cup", description: "Texas Federation of Music Clubs")

== Other Activities
#other(start: datetime(year:2024, month:5, day: 1), end: datetime(year:2025, month:8, day: 23), name: "UTD Algorithms Club", description: "President")


#other(start: datetime(year:2023, month:8, day: 1), end: datetime(year:2025, month:8, day: 23), name: "UTD Codeburners", description: "")


#other(start: datetime(year:2023, month:8, day: 1), end: datetime(year:2024, month:3, day: 23), name: "Nebula Labs", description: "")

#other(start: datetime(year:2009, month:5, day: 1), end: "Present", name: "Piano", description: "")

