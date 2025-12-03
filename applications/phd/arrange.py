import subprocess
import os

personalstatement = {"irvine", "purdue", "stanford"}

schools = {
    "cmu" : "At Carnegie Mellon University, I am excited to work with Professor Vincent Conitzer on social choice and to work with Professor Tuomas Sandholm on mechanism design. My prior paper surveying fair division has given me exposure to their research, and I am eager to deepen my understanding of their fields as a graduate student.", 

    "uiuc" : "At the University of Illinois Urbana-Champaign, I am excited to work with Professor Ruta Mehta on fair division and online algorithms, and to continue working with Professor Fox on graph optimization. I had the opportunity to meet and speak with Professor Mehta as part of the Grainger MERGE program, and have been working with Professor Fox for this past year. My prior work has given me direct exposure to their research, and I hope to deepen my understanding as a student.", 
    
    "duke" : "At Duke, I am excited to work with Professor Debmalya Panigrahi on graph optimization. My prior work in symmetric submodular function minimization has given me direct exposure to his research on hypergraph k-cut via randomized contractions, and I am eager to work with him in researching cuts and connectivity.",
    
    "purdue" : "At Purdue, I am excited to work with Professor Kent Quanrud on graph optimization, and with Professor Alex Psomas and Simina Branzei on fair division and online algorithms. My prior research in partitions of symmetric submodular functions and survey on fair division have given me a direct exposure to their research, and I am eager to deepen my understanding of their fields as a graduate student.",
       
    "utah" : "At the University of Utah, I am excited to work with Professor Haitao Wang on geometric optimization algorithms. I look forward to deepening my understanding of the field as a graduate student, and I believe that my prior research will make me a strong graduate student.",
    
    "dallas" : "At The University of Texas at Dallas, I am excited to work with Professor Benjamin Raichel on geometric optimization. I am eager to research algorithms for metric embeddings and other optimization problems, and to continue researching at the university. I believe that my prior research and work in theory will make me a strong graduate student.",
        
    "irvine" : "At UC Irvine, I am excited to work with Professor Vijay Vazirani. His work on matchings aligns with my interests and my prior work in fair division, and I am eager to research fair division and other related optimization problems.",
    
    "waterloo" : "At Waterloo, I am excited to work with Professors Joseph Cheriyan and Peter Nelson on graph connectivity and matroids. Their work is aligned with my undergraduate coursework and research in combinatorial optimization, and I am eager to deepen my understanding of the field.",
    
    "nyu" : "At New York University, I am excited to work with Professor Aaron Bernstein on graph optimization. His work on maximum flow and shortest paths aligns with my interests and broadly aligns with my prior work on minimum cuts and combinatorial optimization.",
    
    "washington" : "At the University of Washington, I am excited to work with Professor Anna Karlin. Her work on economics and optimization aligns closely with my interests and my prior work in fair division. I have had direct exposure to her research through my survey paper, and I hope to deepen my understanding as her student. I look forward to working with her, and to contribute to this research community.",
    
    "uwmadison" : "At UW-Madison, I am excited to work with Professor Alberto Del Pia on combinatorial optimization. I am fascinated by linear programming, and believe his interests in integer optimization are aligned with my prior coursework and research in this area. I look forward to learning more about combinatorial optimization, and to contribute to this research community.",
    
    "stanford" : "At Stanford, I am excited to work with Professor Aviad Rubenstein on game theory and complexity, and with Professor Aaron Sidford on combinatorial optimization. I believe that my prior work with fair division and matchings and research interests are closely aligned with theirs, and I am eager to deepen my understanding as a student."
}

schoolsuffix = ""# " I am excited by the broader directions algorithms and am eager to contribute to this research community."

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

    output_path = f"generated/{school}/sop.typ"
    if not os.path.exists(output_path ):
        os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, "w+") as file:
        file.write(out)
    subprocess.run(["typst", "c", output_path])

    if school in personalstatement:
        path = f"generated/{school}/personalhistory.typ"
        with open("personalhistory.typ", "r") as personalhistory:
            with open(path, "w+") as file:
                file.write(personalhistory.read())
        subprocess.run(["typst", "c", path])
    if school == "uiuc":
        path1 = f"generated/{school}/ps_1.typ"
        path2 = f"generated/{school}/ps_2.typ"
        with open("personalhistory.typ", "r") as personalhistory:
            text = personalhistory.readlines()

            with open(path1, "w+") as file:
                file.write(f"{text[0]}\n{text[1]}\n{text[3]}")
            with open(path2, "w+") as file:
                file.write(f"{text[0]}\n{text[1]}\n{text[5]}\n\n{text[7]}")
            subprocess.run(["typst", "c", path1])
            subprocess.run(["typst", "c", path2])
