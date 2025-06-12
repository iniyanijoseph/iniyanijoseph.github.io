// Make multiple versions?

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
  location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  personal-site: personal-site,
  accent-color: "#000000",
  font: "New Computer Modern",
  paper: "us-letter",
  author-position: center,
  personal-info-position: left,
)
#set text(size : 8.7pt)
== Education

#edu(
  institution: "The University of Texas at Dallas",
  location: "Richardson, TX",
  dates: dates-helper(start-date: "Aug 2023", end-date: "Aug 2025"),
  degree: "Bachelor of Science, Computer Science",
)
- Cumulative GPA: 3.99\/4 | Dean's List, Academic Excellence Scholarship

== Work Experience

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
- Perform yearly Christmas cantata

== Publications
#project(
  name: "PropType: Everyday Props as Typing Surfaces in Augmented Reality",
  dates: "ACM CHI 2025 Honorable Mention"
)
- _Hyunjae Gil, Ashish Pratap, Iniyan Joseph, Jin-Ryong Kim_

#project(
  name: "Survey of Discrete Fair Division",
  dates: dates-helper(start-date: "Aug 2024", end-date: "Dec 2024"),
)
- _Iniyan Joseph_

== Projects

#project(
  name: "Gus the Goose",
  dates: dates-helper(start-date: "Jan 2025", end-date: "Present"),
)
- Authoring picture book written to teach Discrete Mathematics for children.

#project(
  name: "TurboMarkdown",
  dates: dates-helper(start-date: "Aug 2024", end-date: "Dec 2024"),
)
- Created website to easily compile Markdown Files into pdfs with custom coloring.

#project(
  name: "Simple Shell",
  dates: dates-helper(start-date: "Jan 2024", end-date: "May 2024"),
)
- Wrote simple Bash shell application using C with support for piping.

#project(
  name: "Nebula Labs' API",
  dates: dates-helper(start-date: "Aug 2023", end-date: "Dec 2023"),
)
- Developed scrapers for UTD Nebula Labs' API for aggregation of professor profile information.

#project(
  name: "Sensory Profile Calculator",
  dates: "Jun 2023"
)
- Designed UI for Sensory Profile Assessment for sensory tendencies among neurodivergent students.

#project(
  name: "Project Kaos",
  dates: dates-helper(start-date: "Aug 2022", end-date: "May 2023"),
)
- Designed UI for Role Playing Game using Unreal Engine 5.  

== Extracurriculars & Certifications

#extracurriculars(activity: "TCS Research - Advised by Emily Fox", dates: "Aug 2024 - Present")
- Research algorithms for Symmetric Submodular Optimization.

#extracurriculars(activity: "HCI Research - Advised by Jin-Ryong Kim", dates: "Sep 2023 - Sep 2024")
- Coauthor two papers on efficient text entry in virtual and augmented reality.

#extracurriculars(activity: "UTD Algorithms Club", dates: "May 2024 - Aug 2025")
- Teach topics in Computational Geometry, Fair Division, and Combinatorial Optimization.

#extracurriculars(activity: "UTD Codeburners", dates: "Aug 2023 - Aug 2025")
- Participate in and host competitive programming competitions.

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

#extracurriculars(activity: "Piano", dates: "")
- Compete in several music festivals and competitions, recieving Texas Federation of Music Clubs Gold Cup.
== Skills
- *Projects:* Python, Java, C/C++, Lua, Go, Bash, Typst, Latex, HTML/CSS, Nim, Nix, Lisp, Prolog
- *Technologies:* Tensorflow, Unity, Godot, Unreal Engine 5, Git, Github, NixOS, Linux
- *Languages:* English, Tamil, Esperanto
