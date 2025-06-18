 #import "@preview/basic-resume:0.2.8": *

#let name = "Iniyan Joseph"
#let location = "McKinney, TX"
#let email = "iniyanijoseph@gmail.com"
#let github = "github.com/iniyanijoseph"
#let linkedin = "linkedin.com/in/iniyanijoseph"
#let personal-site = "iniyanijoseph.github.io"

// Define document properties
#set document(title: "Cover Letter - Heard Museum Grant Writer Position")
#set page(
  paper: "us-letter",
  margin: (left: 0.75in, right: 0.75in, top: 0.75in, bottom: 0.75in),
)
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.65em)

// Header similar to resume style
#align(center)[
  #text(size: 24pt, weight: "bold")[#name]
]

#align(center)[
  #location · #email · #link("https://" + linkedin)[#linkedin] · #link("https://" + personal-site)[#personal-site]
]


Dear Hiring Team,

I am writing to express my strong interest in this role. As a Computer Science student at The University of Texas at Dallas with a 3.99 GPA and extensive programming experience across multiple languages and frameworks, I am excited about the opportunity to contribute to your engineering team and help build innovative software solutions. 

My technical expertise spans multiple programming languages including Python, Java, C/C++, and Go, with hands-on experience building everything from low-level systems to web applications. I developed a Simple Shell application in C with full piping support, demonstrating my understanding of system programming and Unix concepts. My work on TurboMarkdown involved creating a complete web application for Markdown-to-PDF compilation with custom styling, showcasing full-stack development skills and attention to user experience.

During my time with UTD Nebula Labs, I developed robust web scrapers for their API, handling professor profile aggregation at scale. This project taught me valuable lessons about data processing, API design, and building reliable systems that serve real users. My competitive programming background through UTD Codeburners has strengthened my algorithmic thinking and problem-solving abilities—skills that translate directly to writing efficient, scalable code.
While my research in HCI and Symmetric Submodular Optimization might seem purely academic, it has given me experience tackling complex technical challenges and collaborating on cutting-edge projects. My CHI 2025 publication involved significant software development for augmented reality interfaces, requiring both technical implementation and performance optimization. This research experience has taught me to approach engineering problems methodically and think critically about system architecture.
I'm drawn to software engineering because I love building solutions that make a real impact. Whether it's creating tools that help other developers (like TurboMarkdown) or contributing to systems that serve thousands of users, I'm motivated by the opportunity to write clean, efficient code that solves meaningful problems. 

I would welcome the opportunity to discuss how my programming skills, research experience, and passion for building great software can contribute to your engineering team. I'm available for technical interviews at your convenience and am excited to dive deeper into the technical challenges your team is solving.

Thank you for considering my application. I look forward to hearing from you.

Sincerely,

Iniyan Joseph
