import subprocess
import os

personalstatement = {"dallas", "irvine", "purdue", "stanford"}

schools = {
    "uiuc" : "In graduate study, I hope to focus on algorithms. At the University of Illinois Urbana-Champaign, I am especially interested in working with Professors Ruta Mehta and Emily Fox. Professor Fox's work on graph optimization is very interesting to me, and I am  also interested on continuing to work with her to study symmetric submodular functions and other optimization problems. I am also interested in working on Fair Division with Professor Mehta and to learn more about economics and computation. I am excited by the broader directions in optimization techniques and the structure of optimization problems, and by their applications to connectivity, online algorithms, and geometric optimization. I would be eager to contribute to this research community and explore new extensions of these problems.", 
    "duke" : "In graduate study, I hope to focus on algorithms. At Duke, I am especially interested in working with Professor Debmalya Panigrahi and find his work on cuts and connectivity, like \"All-Pairs Max-Flow is no Harder than Single-Pair Max-Flow: Gomory-Hu Trees in Almost-Linear Time\" (FOCS 2023) particularly interesting, and am interested in researching flow algorithms in structures beyond graphs. I am also excited by the broader directions in optimization techniques and the structure of optimization problems, and by their applications to connectivity and online algorithms. I would be eager to contribute to this research community and explore new extensions of these problems.",
    "purdue" : "In graduate study, I hope to focus on algorithms. At Purdue, I am especially interested in working with Professors Kent Quanrud and Alex Psomas. I am interested in working with Professor Quanrud's work on graph sparsification and submodular function partitioning. I am also interested in working on Fair Division and online algorithms with Professor Psomas, and hope to research the structure of envy-freeness. I am also excited by the broader directions in optimization techniques and the structure of optimization problems, and by their applications to connectivity, online algorithms, and geometric optimization. I would be eager to contribute to this research community and explore new extensions of these problems.",
    "utah" : "In graduate study, I hope to focus on algorithms. At the University of Utah, I am especially interested in working with Professor Aditya Bhaskara on metric embeddings, and hope to research approximation algorithms for such problems. I am also excited by the broader directions in optimization techniques and the structure of optimization problems, and by their applications to connectivity and online algorithms. I would be eager to contribute to this research community and explore new extensions of these problems.",
    "dallas" : "In graduate study, I hope to focus on algorithms. At The University of Texas at Dallas, I am especially interested in working with Professor Benjamin Raichel. on algorithms for metric embeddings. I am especially interested in works such as in his paper \"Viewing the Rings of a Tree: Minimum Distortion Embeddings into Trees\". I am also excited by the broader directions in optimization techniques and the structure of optimization problems, and by their applications to connectivity and online algorithms. I would be eager to contribute to this research community and explore new extensions of these problems.",
    "irvine" : "In graduate study, I hope to focus on algorithms. At UC Irvine, I am especially interested in working with Professor Vijay Vazirani on problems in Fair Division and research the structure of envy-freeness and matching markets. I am also excited by the broader directions in optimization techniques and the structure of optimization problems, and by their applications to connectivity and online algorithms. I would be eager to contribute to this research community and explore new extensions of these problems.",
    "uwmadison" : "In graduate study, I hope to focus on combinatorial optimization algorithms. At UW-Madison, I am especially interested in working with Professor Alberto Del Pia. . I am also excited by the broader directions in optimization techniques and the structure of optimization problems, and by their applications to connectivity and online algorithms. I would be eager to contribute to this research community and explore new extensions of these problems.",
    "waterloo" : "In graduate study, I hope to focus on combinatorial optimization algorithms. At Waterloo, I am especially interested in working with Professors Joseph Cheriyan on graph connectivity and Peter Nelson on matroids. I hope that studying these problems will help me explore other aspects of combinatorial optimization problems, and to design algorithms for other structures. understand better their applications to connectivity and online algorithms. I am also excited by the broader directions in optimization techniques and the structure of optimization problems, and by their applications to connectivity and online algorithms. I would be eager to contribute to this research community and explore new extensions of these problems.",
    "nyu" : "In graduate study, I hope to focus on algorithms. At New York University, I am especially interested in working with Professor Aaron Bernstein. I am excited to work on shortest paths and maximum flow, and am particularly interested in his paper, \"Maximum Flow by Augmenting Paths in $n^(2+o(1))$ Time\". As a PhD student, I hope to explore the relationship between such problems and their extensions to more general structures. I am also excited by the broader directions in optimization techniques and the structure of optimization problems, and by their applications to connectivity and online algorithms. I would be eager to contribute to this research community and explore new extensions of these problems.",
    "washington" : "In graduate study, I hope to focus on algorithms. At University of Washington-Seattle, I am especially interested in working with Professors Shayan Gharan and Anna Karlin. . I am also excited by the broader directions in optimization techniques and the structure of optimization problems, and by their applications to connectivity and online algorithms. I would be eager to contribute to this research community and explore new extensions of these problems.",
    "stanford" : "In graduate study, I hope to focus on algorithms. At Stanford, I am especially interested in working with Professor Aviad Rubenstein. I am also excited by the broader directions in optimization techniques and the structure of optimization problems, and by their applications to connectivity and online algorithms. I would be eager to contribute to this research community and explore new extensions of these problems."
}
for (school, text) in schools.items():
    out = ""
    with open("prefix", "r") as prefix:
        with open("suffix", "r") as suffix:
            out += prefix.read()
            out += "\n"
            out += text
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

