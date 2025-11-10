// Make multiple versions?
   
#import "@preview/basic-resume:0.2.8": *

// Put your personal information here, replacing mine
#let name = "Iniyan Joseph"
#let location = "8500 Blacktail Trail McKinney, TX 75070" 
#let email = "iniyanijoseph@gmail.com"
#let github = "github.com/iniyanijoseph"
#let linkedin = "linkedin.com/in/iniyanijoseph"
#let phone = "+1 (510) 936-4409"
#let personal-site = "iniyanijoseph.github.io"
#show: resume.with(
  author: name,
  location: location,
  email: email,
  // github: github,
  // linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#000000",
  font: "New Computer Modern",
  paper: "us-letter",
  author-position: center,
  personal-info-position: center,
)
#set text(size : 11.5pt)

== Education
#edu(
  institution: "The University of Texas at Dallas",
  location: "Richardson, TX",
  dates: dates-helper(start-date: "Aug 2023", end-date: "Aug 2025"),
  degree: "Bachelor of Science, Computer Science",
)
- Cumulative GPA: 3.99\/4 | Summa Cum Laude

== Work Experience

#work(
  title: "Grader",
  location: "Richardson, TX",
  company: "The University of Texas at Dallas",
  dates: dates-helper(start-date: "Jan 2025", end-date: "May 2025"),
)

#work(
  title: "Substitute Teacher",
  location: "Frisco, TX",
  company: "Frisco Independent School District",
  dates: dates-helper(start-date: "Aug 2025", end-date: "Oct 2025"),
)

#work(
  title: "Software Engineer",
  location: "McKinney, TX",
  company: "ReviveXR",
  dates: dates-helper(start-date: "Jun 2025", end-date: "Dec 2025"),
)

#work(
  title: "Teacher",
  location: "Frisco, TX",
  company: "KD College Prep",
  dates: dates-helper(start-date: "Oct 2025", end-date: "Present"),
)

== Research
Algorithms and data structures; combinatorial optimization; graph algorithms; human-computer interaction

#project(
  name: "PropType: Everyday Props as Typing Surfaces in Augmented Reality",
  dates: "ACM CHI 2025 Honorable Mention, UIST 2026 Demo"
)
- _Hyunjae Gil, Ashish Pratap, Iniyan Joseph, Jin-Ryong Kim_

#project(
  name: "Survey of Discrete Fair Division",
  // dates: dates-helper(start-date: "Aug 2024", end-date: "Dec 2024"),
)
- _Iniyan Joseph_

#project(
  name: "Design Challenges of In-Air Thumb Typing on Head-Mounted Displays",
  dates: "Submitted"
)
- _Hyunjae Gil, Iniyan Joseph, Jin-Ryong Kim_

// == Projects

// #project(
//   name: "NixOS Rice",
//   dates: dates-helper(start-date: "Jan 2025", end-date: "Present"),
// )
// - Authoring picture book written to teach Discrete Mathematics for children.

// #project(
//   name: "Nebula Labs' API",
//   dates: dates-helper(start-date: "Aug 2023", end-date: "Dec 2023"),
// )
// - Developed scrapers for UTD Nebula Labs' API for aggregation of professor profile information.

== Awards & Honors
- *Dean's List* - Fall 2023, Spring 2024, Spring 2025, Summer 2025
- *Academic Excellence Scholarship* - Aug 2023 - Aug 2025

== Extracurriculars

#extracurriculars(activity: "Research - Advised by Emily Fox", dates: "Aug 2024 - Present")
// - Research algorithms for Symmetric Submodular Optimization.

#extracurriculars(activity: "Research - Advised by Jin-Ryong Kim", dates: "Sep 2023 - Sep 2024")
// - Coauthor two papers on efficient text entry in virtual and augmented reality.

#extracurriculars(activity: "President - UTD Algorithms Club", dates: "May 2024 - Aug 2025")
// - Teach topics in Computational Geometry, Fair Division, and Combinatorial Optimization.

#extracurriculars(activity: "UTD Codeburners (Competitive Programming)", dates: "Aug 2023 - Aug 2025")
- _Won South Central USA Bronze Medal_

#extracurriculars(activity: "Nebula Labs", dates: "Aug 2023 - Mar 2024")

// #certificates(
//   name: "HSP - Social and Behavioral",
//   issuer: "CITI",
//   date: "Jan 2024",
// )

// #certificates(
//   name: "HSP - Responsible Conduct of Research for Engineers",
//   issuer: "CITI",
//   date: "Jan 2024",
// )

// #extracurriculars(activity: "Piano", dates: "")
// - Compete in several music festivals and competitions, receiving Texas Federation of Music Clubs Gold Cup
