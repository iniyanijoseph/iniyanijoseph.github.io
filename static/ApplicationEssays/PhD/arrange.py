import subprocess
import os

personalstatement = {"dallas", "irvine", "purdue", "stanford"}

schools = {
    "uiuc" : "At the University of Illinois Urbana-Champaign, I am excited to work with Professor Ruta Mehta on fair division and online algorithms, and Professor Fox on graph optimization.", 
    
    "duke" : "At Duke, I am excited to working with Professor Debmalya Panigrahi on graph optimization.",
    
    "purdue" : "At Purdue, I am interested in working with Professors Kent Quanrud and Alex Psomas. Professor Quanrud's work on graph optimization aligns with my interests. I am also interested in working with Professor Psomas on fair division and online algorithms.",
       
    "utah" : "At the University of Utah, I am interested in working with Professors Aditya Bhaskara and Haitao Wang. Professor Bhaskara's work on approximation algorithms aligns with my interests. I am also interested in working with Professor Wang on geometric optimization algorithms.",
    
    "dallas" : "At The University of Texas at Dallas, I am excited to work with Professor Benjamin Raichel on geometric optimization algorithms. I am eager to research algorithms for metric embeddings and other optimization problems.",
        
    "irvine" : "At UC Irvine, I am interested in working with Professor Vijay Vazirani. His work on matchings aligns with my interests and with my prior work in fair division, and I am eager to research fair division and other related optimization problems.",

    "waterloo" : "At Waterloo, I am excited to work with Professors Joseph Cheriyan and Peter Nelson, on graph connectivity and matroids, and is aligned with my interest in combinatorial optimization.",
    
    "nyu" : "At New York University, I am excited to work with Professor Aaron Bernstein on graph optimization. His work aligns with my interests and my work in minimum cuts.",
    
    "washington" : "At the University of Washington, I am interested in working with Professor Anna Karlin. Her work on economics and optimization is closely aligned with my interests and my prior work in fair division.",

    "uwmadison" : "At UW-Madison, I am excited to work with Professor Alberto Del Pia on combinatorial optimization.",
    
    "stanford" : "At Stanford, I am excited to work with Professor Aviad Rubenstein. His work on game theory and complexity aligns with my interests and my prior work in fair division."
}

schoolsuffix = " I am excited by the broader directions in optimization techniques and the structure of optimization problems and am eager to contribute to this research community and explore new extensions of these problems."

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

    output_path = f"GeneratedDocuments/{school}/sop.typ"
    if not os.path.exists(output_path ):
        os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, "w+") as file:
        file.write(out)
    subprocess.run(["typst", "c", output_path])

    if school in personalstatement:
        path = f"GeneratedDocuments/{school}/personalhistory.typ"
        with open("personalhistory.typ", "r") as personalhistory:
            with open(path, "w+") as file:
                file.write(personalhistory.read())
        subprocess.run(["typst", "c", path])

