import subprocess
import os

personalstatement = {"dallas", "irvine", "purdue", "stanford"}

schools = {
    "uiuc" : "In graduate study, I intend to focus on algorithms. At the University of Illinois Urbana-Champaign, I am especially interested in working with Professors Ruta Mehta and Emily Fox. Professor Fox's work on graph optimization aligns with my interests. I am also interested in working with Professor Mehta on fair division and online algorithms.", 
    
    "duke" : "In graduate study, I intend to focus on algorithms. At Duke, I am especially interested in working with Professor Debmalya Panigrahi. His work on graph optimization particularly interests me, and I am eager to research algorithms for cuts and flows.",
    
    "purdue" : "In graduate study, I intend to focus on algorithms. At Purdue, I am especially interested in working with Professors Kent Quanrud and Alex Psomas. Professor Quanrud's work on graph optimization aligns with my interests. I am also interested in working with Professor Psomas on fair division and online algorithms.",
       
    "utah" : "In graduate study, I intend to focus on algorithms. At the University of Utah, I am especially interested in working with Professors Aditya Bhaskara and Haitao Wang. Professor Bhaskara's work on approximation algorithms aligns with my interests. I am also interested in working with Professor Wang on geometric optimization algorithms.",
    
    "dallas" : "In graduate study, I intend to focus on algorithms. At The University of Texas at Dallas, I am especially interested in working with Professor Benjamin Raichel. His work on geometric optimization algorithms particularly interests me, and I am eager to research algorithms for metric embeddings and other optimization problems.",
        
    "irvine" : "In graduate study, I intend to focus on algorithms. At UC Irvine, I am especially interested in working with Professor Vijay Vazirani. His work on matchings aligns with my interests, and I am eager to research fair division and other related optimization problems.",

    "waterloo" : "In graduate study, I intend to focus on combinatorial optimization. At Waterloo, I am especially interested in working with Professors Joseph Cheriyan and Peter Nelson, whose work on graph connectivity and matroids respectively is closely aligned with my interests.",
    
    "nyu" : "In graduate study, I intend to focus on algorithms. At New York University, I am especially interested in working with Professor Aaron Bernstein. His work on graph optimization particularly interests me, and I am eager to research maximum flows and other optimization problems.",
    
    "washington" : "In graduate study, I intend to focus on algorithms. At the University of Washington, I am especially interested in working with Professor Anna Karlin. Her work on economics and optimization is closely aligned with my interests, and I am eager to research markets and auctions.",

    "uwmadison" : "In graduate study, I intend to focus on algorithms. At UW-Madison, I am especially interested in working with Professor Alberto Del Pia. His work on combinatorial optimization aligns with my interests.",
    
    "stanford" : "In graduate study, I intend to focus on algorithms. At Stanford, I am especially interested in working with Professor Aviad Rubenstein. His work on game theory and complexity aligns with my interests."
}

schoolsuffix = " I am excited by the broader directions in optimization techniques and the structure of optimization problems, and by their applications to networks, economics, online algorithms, and geometry. I would be eager to contribute to this research community and explore new extensions of these problems."

for (school, text) in schools.items():
    out = ""
    with open("prefix", "r") as prefix:
        with open("suffix", "r") as suffix:
            out += prefix.read()
            out += "\n"
            out += text + schoolsuffix
            out += "\n\n"
            out += suffix.read()
            print(prefix.read())

    output_path = f"Generated Documents/{school}/sop.typ"
    if not os.path.exists(output_path ):
        os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, "w+") as file:
        file.write(out)
    subprocess.run(["typst", "c", output_path])

    if school in personalstatement:
        path = f"Generated Documents/{school}/personalhistory.typ"
        with open("personalhistory.typ", "r") as personalhistory:
            with open(path, "w+") as file:
                file.write(personalhistory.read())
        subprocess.run(["typst", "c", path])

