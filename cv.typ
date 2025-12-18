#import "@preview/bullseye:0.1.0": *
#import "src/template/cv_template.typ": *
#import "src/template/fields.typ": *

#show: cv.with(author: "Iniyan Joseph", aboutme: "Hi, I'm Iniyan. I recently recieved my undergraduate degree in Computer Science from The University of Texas at Dallas, and am a Teacher at KD College Prep. I am currently applying to PhD programs in Theoretical Computer Science focusing on Algorithms, and am advised by Professor Emily K. Fox at the University of Illinois, Urbana-Champaign.", icon: "favicon.ico", photo: "photo.png", website: "https://iniyanijoseph.github.io", email: "iniyanijoseph@gmail.com")

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
#bibliography("publications/publications.bib", title: none, full: true)

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
  start: dt(2023, 8),
  end: dt(2025, 8),
  name: "Academic Excellence Scholarship",
  description: "University of Texas at Dallas",
)

#award(
  start: dt(2023, 8),
  end: dt(2025, 8),
  name: "Dean's List",
  description: "University of Texas at Dallas, (Fall 2023, Spring 2024, Spring 2025, Summer 2025)",
)

#award(date: dt(2023, 5), name: "Gold Cup", description: "Texas Federation of Music Clubs")

#context {
  if target() == "html" [
    == Projects
    #other(
      date: dt(2025, 7),
      name: "Typst Personal Website",
      details: [
        Typically, maintaining both a CV and a personal website requires double-entry of information. This process is prone to error, and time consuming.

        With the release of Version 13.0, Typst introduced a powerful new feature: HTML Exports. This functionality makes it possible to use the same Typst File to generate both the HTML required for a website and a CV from the exact same document!

        Although html exports are still under incomplete and under active development, the community has created several helpful examples and packages, namely #link("https://typst.app/universe/package/bullseye")[bullseye], for managing behavior for each compile target, and #link("https://tufted.vsheg.com/")[tufted], which provided much of the inspiration and guidance for this project.

        Using these idea, I created #link("https://iniyanijoseph.github.io/")[the website you are currently reading], and #link("cv.pdf")[my CV] (with the help of some CSS and JS for styling).

        The source can be found here: #link("https://github.com/iniyanijoseph/iniyanijoseph.github.io/")
      ],
    )

    #other(
      date: dt(2025, 7),
      name: "NixOS Configuration/Dotfiles",
      details: [
        NixOS is a tool for declarative software package management. It provides several benefits, like easy management of packages, dependency management, reproducability, etc.

        I recently switched from Debian (those dotfiles can also be found on my website) to NixOS.

        My files are heavily inspired by Frost-Phoenix's: #link("https://github.com/Frost-Phoenix/nixos-config/tree/main").

        The system is configured via Hyprland, Waybar, Swaync, etc.
        #link("https://github.com/iniyanijoseph/nixos-config")
      ],
    )

    #other(
      date: dt(2025, 5),
      name: "Typst Homework Template",
      details: [
        This template lets me write homework solutions very quickly using Typst. This has a few useful features:

        First, it allows you to do things more like Markdown by using the a raw using "table" as the language

        Second, you can both use the default numbering for headings provided by Typst, or you can prefix a heading using "number)" and it will replace the default heading.

        Third, you can write algorithms using the algorithms language
          \`\`\`algorithm
          + while true
            + if a is true
              + break
            + else
              + break
          \`\`\`

        Fourth, you can use write theorems quickly using the theorem, lemma, and corollary raw blocks. The first line of the language is the theorem statement, all other lines are the proof. 

        Fifth, you can draw Graphiz diagrams with the graphiz raw block.

        Sixth, you can compile Latex code written in the tex raw block. This can be convenient.

        Finally, you can use +-, ==>, <==, and |- as shortcuts in math mode.

        #link("projects/hwtemplate/template.typ")
      ],
    )

    #other(
      date: dt(2025, 1),
      name: "Gus the Goose",
      details: [
        He declared that the future lies in the hand of the schoolmaster...He desired that society should labor without relaxation at the elevation of the moral and intellectual level, at coining science, at putting ideas into circulation, at increasing the mind in youthful persons. - Les Miserables

        I wrote a #link("projects/gus/main.pdf")[little rhyme] to explain discrete math concepts to children about a Goose named Gus:
      ],
    )

    #other(
      date: dt(2024, 9),
      name: "Candy Wrapper Comets Stop Motion Animation",
      description: "",
      details: image("projects/cometfilm/main.gif"),
    )

    #other(
      date: dt(2024, 7),
      name: "Debian Configuration/Dotfiles",
      description: "",
      details: [I have been using Linux for the past several years. When I switched to a new computer, I decided to use Debian, and to gain some exposure to #link("https://jie-fang.github.io/blog/basics-of-ricing")[ricing]. While setting everything up, I created a setup script for my dotfiles (mostly combining and riffing some other themes I found online). My dotfiles are publicly available here. This project taught me alot about how linux actually worked, how users were managed, how and where applications stored/read data, and how my window manager operated.

        #link("https://github.com/iniyanijoseph/Debian-Gruvbox")[Dotfiles]
      ],
    )

    #other(
      date: dt(2024, 3),
      name: "Sensory Profile Assessment",
      description: "",
      details: [#link("https://en.wikipedia.org/wiki/Occupational_therapy")[Occupational Therapists] in school-based practice often uses several assessments to measure student's various sensory tendencies, skills, and preferences. These assessments are quite tedious to compute by hand. This project provides a UI to take these assessments, and evaluates these results, finally providing a CSV of the assessment results.
        #link("https://github.com/iniyanijoseph/Sensory-Profile-Calculator")[Source Code]
      ],
    )

    #other(
      date: dt(2023, 9),
      name: "Fish Stop Motion Animation",
      description: "",
      details: image("projects/fishfilm/main.gif"),
    )

    #other(
      date: dt(2023, 5),
      name: "Project Kaos",
      description: "Scrum Master",
      details: link("https://sites.google.com/k12.friscoisd.org/projectkaos/dev-team"),
    )
  ]
}

== Other Activities
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

#other(
  start: dt(2023, 8),
  end: dt(2024, 3),
  name: "Nebula Labs",
  description: "",
)

#context {
  if target() == "html" [
    === Piano
    #other(start: dt(2009, 5), end: "Present", name: "Piano")

    ==== Performance
    #performance(
      name: "Joy Has Dawned",
      location: "Cedar Creek Lake United Methodist Church",
      date: dt(2024, 12),
      musicians: "Seth Thomas, Iniyan Joseph",
      details: "z0EX8l6ZWnk",
    )
    #performance(
      name: "Fall 2024 Recital",
      location: "Cedar Creek Lake United Methodist Church",
      date: dt(2024, 10),
      musicians: "Seth Thomas, Iniyan Joseph",
      details: "tY56WEPD9R0",
    )
    #performance(
      name: "A Christmas for All Time",
      location: "Cedar Creek Lake United Methodist Church",
      date: dt(2023, 12),
      musicians: "Seth Thomas, Iniyan Joseph",
      details: "0odLKW9OCaA",
    )
    #performance(
      name: "Senior Recital",
      location: "McKinney Bible Church",
      date: dt(2023, 8),
      musicians: "Iniyan Joseph",
      details: "T3SfiNYB4DA",
    )
    #performance(
      name: "Senior Recital",
      location: "Cedar Creek Lake United Methodist Church",
      date: dt(2023, 7),
      musicians: "Iniyan Joseph",
      details: "Sk_h7YYb2-I",
    )
    #performance(
      name: "Addams Family Musical",
      location: "Independence High School",
      date: dt(2023, 1),
      musicians: "Independence High School Pit Orchestra",
    )
    #performance(
      name: "Let There be Christmas",
      location: "Cedar Creek Lake United Methodist Church",
      date: dt(2022, 12),
      musicians: "Seth Thomas, Iniyan Joseph",
      details: "f2X2m_pDQNw",
    )
    #performance(
      name: "Tuck Everlasting",
      location: "Independence High School",
      date: dt(2022, 1),
      musicians: "Independence High School Pit Orchestra",
    )

    ==== Festivals and Competitions
    #festival(
      score: "Outstanding",
      name: "Texas Federation of Music Clubs",
      category: "Musically Advanced Class II",
      date: dt(2023, 5),
      details: "Rachmaninov Polichinelle op. 3 no. 4",
    )
    #festival(
      score: "Outstanding",
      name: "National Federation of Music Clubs",
      category: "Musically Advanced Class II",
      date: dt(2023, 3),
      details: "Rachmaninov Polichinelle op. 3 no. 4, Beethoven Tempest Sonata mvmt. 3",
    )
    #festival(
      score: "1",
      name: "University Interscholastic League - Solo and Ensemble",
      category: "1",
      date: dt(2023, 1),
      details: "Beethoven Tempest Sonata mvmt. 3",
    )
    #festival(
      score: "Outstanding",
      name: "Texas Federation of Music Clubs",
      category: "Very Difficult Class 2",
      date: dt(2022, 5),
      details: "Rachmaninoff Prelude c# minor op 3. no 2",
    )
    #festival(
      score: "Outstanding",
      name: "National Federation of Music Clubs",
      category: "Very Difficult Class 2",
      date: dt(2022, 3),
      details: "Rachmaninoff Prelude c# minor op 3. no 2, Bach Invention a minor BWV 784",
    )
    #festival(
      score: "1",
      name: "University Interscholastic League - Solo and Ensemble",
      category: "2",
      date: dt(2022, 1),
      details: "Bach Invention a minor BWV 784",
    )
    #festival(
      score: "Outstanding",
      name: "Texas Federation of Music Clubs",
      category: "Difficult Class 2",
      date: dt(2021, 5),
      details: "Roubos Rapsodia Española",
    )
    #festival(
      score: "Outstanding",
      name: "National Federation of Music Clubs",
      category: "Difficult Class 2",
      date: dt(2021, 3),
      details: "Roubos Rapsodia Española, Beethoven Bagatelle op. 119 no. 1",
    )
  ] else [
    #other(start: dt(2009, 5), end: "Present", name: "Piano")
  ]
}
