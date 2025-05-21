#import "@preview/basic-resume:0.2.8": *

// Put your personal information here, replacing mine
#let name = "Iniyan Joseph"
#let location = "McKinney, TX"
#let email = "iniyanijoseph@gmail.com"
#let github = "github.com/iniyanijoseph"
#let linkedin = "linkedin.com/in/iniyanijoseph"
#let phone = "+1 (510) 936-4409"
#let personal-site = "iniyanijoseph.github.io"

#show: resume.with(
  author: name,
  // All the lines below are optional. 
  // For example, if you want to to hide your phone number:
  // feel free to comment those lines out and they will not show.
  location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#000000",
  font: "New Computer Modern",
  paper: "us-letter",
  author-position: left,
  personal-info-position: left,
)

/*
* Lines that start with == are formatted into section headings
* You can use the specific formatting functions if needed
* The following formatting functions are listed below
* #edu(dates: "", degree: "", gpa: "", institution: "", location: "")
* #work(company: "", dates: "", location: "", title: "")
* #project(dates: "", name: "", role: "", url: "")
* #extracurriculars(activity: "", dates: "")
* There are also the following generic functions that don't apply any formatting
* #generic-two-by-two(top-left: "", top-right: "", bottom-left: "", bottom-right: "")
* #generic-one-by-two(left: "", right: "")
*/
== Education

#edu(
  institution: "The University of Texas at Dallas",
  location: "Richardson, TX",
  dates: dates-helper(start-date: "Aug 2023", end-date: "Aug 2025"),
  degree: "Bachelor's of Science, Computer Science",
)
- Cumulative GPA: 3.99\/4 | Dean's List, Academic Excellence Scholarship
// - Relevant Coursework: Data Structures, Program Development, Microprocessors, Abstract Algebra I: Groups and Rings, Linear Algebra, Discrete Mathematics, Multivariable & Single Variable Calculus, Principles and Practice of Comp Sci

== Experience

#work(
  title: "Grader",
  location: "Richardson, TX",
  company: "The University of Texas at Dallas",
  dates: dates-helper(start-date: "Jan 2025", end-date: "May 2025"),
)
- Grade homework for Discrete Mathematics for Computing (CS 2305)

#work(
  title: "Pianist",
  location: "Kemp, Texas",
  company: "Cedar Creek Lake United Methodist Church",
  dates: dates-helper(start-date: "Dec 2022", end-date: "Present"),
)
- Perform yearly christmas cantata

== Publications
#project(
  name: "PropType: Everyday Props as Typing Surfaces in Augmented Reality",
  dates: "ACM Computer Human Interaction 2025"
)
- _Hyunjae Gil, Ashish Pratap, Iniyan Joseph, Jin-Ryong Kim_

#project(
  name: "Survey of Discrete Fair Division",
  dates: dates-helper(start-date: "Aug 2024", end-date: "Dec 2024"),
  // url: "Advised by Emily Fox"
)
- _Iniyan Joseph_

== Projects

#project(
  name: "Gus the Goose",
  dates: dates-helper(start-date: "Jan 2025", end-date: "Present"),
)
- Authoring picture book written to teach Discrete Mathematics for children

#project(
  name: "TurboMarkdown",
  dates: dates-helper(start-date: "Aug 2024", end-date: "Dec 2024"),
)
- Created website to easily compile Markdown Files into Latex

#project(
  name: "Simple Shell",
  dates: dates-helper(start-date: "Jan 2024", end-date: "May 2024"),
)
- Wrote simple BASH Shell Application using C

#project(
  name: "Nebula Labs API",
  dates: dates-helper(start-date: "Aug 2023", end-date: "Dec 2023"),
)
- Developed scrapers for UTD Nebula Labs API

#project(
  name: "Sensory Profile Calculator",
  dates: "Jun 2023"
)
- Designed UI for Sensory Profile Assessment for sensory tendencies among neurodivergent students

#project(
  name: "Project Kaos",
  dates: dates-helper(start-date: "Aug 2022", end-date: "May 2023"),
)
- Lead team of 15 people using Scrum methodology
- Developed UI for Role Playing Game using Unreal Engine 5

== Extracurriculars & Certifications

#extracurriculars(activity: "TCS Research - Advised by Emily Fox", dates: "Aug 2024 - Present")

#extracurriculars(activity: "HCI Research - Advised by Jin-Ryong Kim", dates: "Sep 2023 - Sep 2024")

#extracurriculars(activity: "UTD Algorithms Club", dates: "May 2024 - Aug 2025")

#extracurriculars(activity: "UTD Codeburners", dates: "Aug 2023 - Aug 2025")

#certificates(
  name: "HSP - Social and Behavioral",
  issuer: "CITI",
  date: "Jan 2024",
)

#certificates(
  name: "HSP - Responsible Conduct of Research for Engineers",
  issuer: "CITI",
  date: "Jan 2024",
)
