#import "@preview/ctheorems:1.1.3":* 
#import "@preview/lovelace:0.3.0": *
#show: thmrules.with(qed-symbol: $square$)
#import emoji:*

#let theorem = thmbox("theorem", "Theorem")
#let lemma = thmbox("lemma", "Lemma")
#let conjecture = thmplain("conjecture", "Conjecture")
#let corollary = thmplain("corollary",  "Corollary", base: "theorem",  titlefmt: strong)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")
#show link: underline

#definition[
  If $X, Y, subset.eq V$, then 
  $f(X union Y) + f(X sect Y) <= f(X) + f(Y)$
]

Unfortunately, naively adapting Karger's algorithm (i.e. by selecting vertices uniformly at random and merging them) does not give a reasonable probability of success for correctly selecting a specific subset.

Let $A$ be the set minimizing the symmetric submodular function $f : 2^V -> RR$. Let $abs(A) = a$. Since we do not know $a$ or have any reason to suspect a specific cardinality of a beyond restricting $a<= n/2$ (because of symmetry). 

#pseudocode-list(booktabs: true, title: [#smallcaps[Modified Karger]$(V, f)$])[
+ *if* $abs(V) = 1$:
  + *return* $V$

+ $A^i = V$

+ Select vertices $v_1, v_2 in V$ uniformly at random
+ $V' <- V without {v_2}$
+ $f'(A) <- cases(
    f (A union v_2) "if" v_2 in A "// Note that this must be recursively expanded",
    f (A) "if" v_2 in.not A
)$
+ #smallcaps[Modified Karger]$(V', f')$
]

The probability of selecting an element which is in $A$ is $binom(n-1, a-1)\/ binom(n, a) = a/n$, since we must select $a-1$ other elements for the optimal set out of $n-1$ elements. Taking this repeatedly, we get
$ a/n times (a-1)/(n-1) times ... times 1/(n-a+1) = (a!(n-a)!) / n!  $

In the best case (when $a = 1$), the probability of correctly selecting a subset is $1/n$, but in the worst case (when $a = n/2$) we get, $binom((floor(n/2))!^2, n!)= 1/binom(n, floor(n/2))$, the inverse of the $floor(n/2)$nd central binomial coefficient. This is in turn equal to $(floor(n/2)+1)/C_(floor(n/2))$, where $C_n$ is the $n$th Catalan number. In other words, we find that the probability of success using this method can be exponentially small for some values of $a$. (although our time complexity remains only $O(n)$, since unlike graphs we can contract much faster)

Amplification?
The probability of failure is $1-(1-(1/binom(n, floor(n/2)))^N) <= 1- e^(- c N/binom(n, floor(n/2))ln n)$

Using amplification $N$ times, we find that to get a high probability of success, we need $N = c binom(n, floor(n/2))ln n$, which is clearly exponential in $n$.

The problem we find is that we do not have enough information in each contraction, and are forced to blindly guess, while for hypergraphs we can choose the edge proportional to how many edges it can contract at once.

xhis is the same process as here: #link("https://jeffe.cs.illinois.edu/teaching/algorithms/notes/08-mincut.pdf")

#face.sad

#line(length: 100%)
/*
Things to prove: We can only start getting $-$ve increases when adding new elements after we have the maximum of the function in our set. The 2nd definition of submodularity implies that the change in $f(S union {x}) >= f(T union {x})$ for $S subset.eq T$, meaning that if adding a new element $x$ to $A$ causes $f(A)$ to decrease, it cannot increase again. Is there some structure in where in the middle the maximum must be? 

- This would imply that the size of the minimal subset is smaller, which would let us eliminate large subsets

#line(length: 100%)

Things to think about: We have been dealing exclusively with disjoint sets so far. If we take the value of nondisjoint sets, what observations can we make about the elements contained in the interinterion? This could elicit the approach of contracting elements if it is contained in the interinterion between two of such sets.

Take two sets $X, Y subset.eq V$

Observation: 
#lemma[$X union Y = A and S inter T != emptyset -> f(X union Y) = f(A) <= f(X inter Y)$. 
  #proof[
  This follows from the optimality if $A$. If $f(X inter Y) < f(A)$, then, since $X inter Y$ is nonempty, $X inter Y$ would be the new optimal solution, contradicting the optimality of A.
  ]
]

#lemma[$X inter Y = A and S union T != V -> f(X inter Y) = f(A) <= f(X union Y)$. 
  #proof[
  This follows from the optimality if $A$. If $f(X union Y) >= f(A)$, then, since $X union Y subset V$, $X union Y$ would be the new optimal solution, contradicting the optimality of $A$.
  ]
]

#conjecture[
  $X union Y subset A -> f(X union Y) >= f(X inter Y)$
  #proof[Assume for contradiction that $X union Y subset A -> f(X union Y) < f(X inter Y)$. Consider a unweighted hypergraph where $X$ and $Y$ are disjoint subsets of the optimal solution $A$. There are many hyperedges going from $X$ and $Y$ to $A\\(X union Y)$ (since $X union Y subset A$, no hyperedges may go to $V\\A$). The number of hyperedges going from $f(X union Y)$ to $A\\(X union Y) >= f(A)$. By the assumption that the sets are disjoint, $f(X inter Y) = emptyset$, and so $f(X inter Y) < f(X union Y)$, which is a contradiction. 

Also we can look at the contrapositive

$f(X union Y) < f(X inter Y) -> X union Y subset.eq.not A$ 
  ]
Although I need to make sure as well that this holds for sets $X, Y$ with nontrivial interinterions. If they aren't disjoint.
]

This is immediately useful, since we can now start looking at pairs of sets and immediately know if they are subsets of the optimal solution when combined.  

#conjecture[
  $X inter Y subset A and (X union Y subset V) -> f(X inter Y) <= f(X union Y)$

  If $X union Y$ are both proper subsets of $A$, then the previous lemma applies and we are done. If they are not both subsets of $A$.

  If the union of them is nontrivial, then $f(A) <= f(X union Y) <= $ $dots$
]

- Thoughts: Maybe you could add what you learn via interinterions to an incrementally constructed optimal solution or something while contracting the subsets together. 

#lemma[You can contract together $m$ vertices together in $O (m alpha(n))$ using a `DSU`. ]

#line(length: 100%)

Something something Knesser hypergraph.

This would work as a start if you know that the interinterion can only be so much between two sets, but I don't see how it would be useful otherwise, since you don't have any guarantees on value. $dots$

#line(length: 100%)

Maybe you could choose a subset $S$ at random. If you can see if $A inter S != emptyset$, or at the very least that it is better to take a subset of $S$ than another subset of $V \\ S$, then you could a) shrink the size of the problem instance, and b) Take $A$ as a 

In the symmetric function, if $S subset A$, is there a subset $T in (V \\ A)$ such that $f(S) = f(T)$? I don't see why that has to be the case necessarily

== Messing around with Equation Stuffs

$ f(A) <= f(X inter Y) <= f(X) + f(Y) - f(X union Y) $
If the sets are disjoint, and that $f(X) <= f(Y)$
Let $Z = (V \\ Y) \\ X$
$ f(A) <= f(X union Y) <= f(X) + f(Y) <= 2f(Y) = 2f(V \\ Y) <= 2f(X union Z) <= 2f(X) + 2f(Z) $. 

If they aren't disjoint, then this still holds (if $f(X)$ is positive $forall_(X subset V)$. We can also remove the interinterion to get. 
$ f(X union Y) <= 2f(X) + 2f(Z) - f(X inter Y) $

$X inter Y$ is disjoint from $Z$ (by construction)

#conjecture[
  For $f'(X) = k f(X)$ for some constant $k$ is still submodular.
]


From the beginning, if the inequality is correct, then you can repeatedly do the merging to find the optimal one since you can know immediately if the two should be together or not without additional computation. 
 
You could do it faster by choosing larger subsets, and if we are lucky then we could select like that

What does inclusion/exclusion look like for submodular set functions?
#line(length: 100%)
*/

Try to form a group where you select each element with probability
$1/(f(C union {x}) - f{x}) $

//If $f(x)$ is small, it seems like it would be less likely to be in A, since your downward changes are more limited, and we want a subset which has the largest decreasing changes.
But what if you had a set which "stemmed" from a smaller set that had the same pattern of decreases.

Is it true that the optimal solution $ min(f(V)) <= f(A) <= min(f(V)) * n$

#line(length: 100%)

Symmetric submodularity is closed under union. For elements of size 1, it is trivial

In other words, that we want to show that

Assumptions:
$ f(X) = f(V \\ X) $
$ f(Y) = f(V \\ Y) $
$ f(X union {e}) = f(V \\ (X union {e})) $
$ f(Y union {e}) = f(V \\ (Y union {e})) $

$ f(X) = f(V\\X) and f(Y) = f(V\\Y) <-> f (X union Y) = f (V \\ {X union Y}) $

---

$ f(X union Y) <= f(X) + f(Y) - f(X inter Y) $
$ f(X union Y union {e}) <= f(X) + f(Y) + f ({e})- f(X inter Y) $
$ f(V\\X) + f(V\\Y) - f(X inter Y) >= f(V\\(X inter Y)) $
$$

Suppose $abs(V) >= 2$ and let $a in V$. We must show that $sum f(a) + f(b) - f({a, b}) >= 2 f(a)$
For V=2, $f(b)=f(a)$ and $f({a, b}) = 2f(a)$, so the statement holds for the basis. 

Assume that for $abs(V)=n$, the statement holds. Then we want to show for 
 $ abs(V)=n+1$, that $ sum f(a) + f(b) - f({a, b}) >= 2 f(a) $ 

Take some arbitrary $c in V\\{a}$
 
$ = n f(a) + (sum_(b in V\\{a, c}) f(b) - sum_(b in V\\{a, c}) f({a, b})) - f({a, c}) + f({a}) + f({c}) $
$ >= 2f(a) - f({a, c}) + f({a}) + f({c}) $ $ >= 2f(a) $ since by the definition, $f({a, c}) + f({a}) + f({c})$ is positive

// #pagebreak()

// I was wondering: If you took out an element $a in V$, then you could turn $V' = V\\{a}$ into two sets $X, Y$. $forall x in X$, $f({x}) = f(V'\\{x})$, and $forall y in Y$, $f({y}) != f(V'\\{y})$.

// For hypergraphs, $Y$ is the set of vertices where there is aj hyperedge containing $y in Y$ and $a$, so that when $a$ is removed, those hyperedges are removed as well, which makes it asymmetric. For $x in X$, there are a few cases: there is no such hyperedge with $x in X$ to $a$, the remaining graph is evenly covered by $a$, such as in wheel graphs and their extension to hypergraph (more probably, idk). Although there are multiple cases for $X$, it is only the asymmetric part that reflects the size of the edges it modifies, or otherwise it does not matter which side the vertex. 

// //If $Y$ is empty, then the solution is simply $a$? No, because of the wheel counterexample above. 

// // $Y = emptyset -> forall_(x in X) f(x) = f(V\\{x, a})$.
// // $ f(V\\{x, a}) $
// // $ <= f(V\\{x} inter V\\{a}) $ 
// // $ <= f(V \\ {x}) + f(V \\ {a}) - f(V\\{x, a}) $ $ = f(x) + f(a) - f(V\\{x, a}) $
// // $  $

// For $x, y in X$, is $f(x) + f(y) >= f({x, y})$? If so, then could you just treat |Y| as the $|e|$ term in #box[#image("image-1.png", width:54%)] for $z_n (a)$?

// $f(a) + f(b) = f({a, b})$ if they are disjoint. The $X_a = {b|f(a) + f(b) = f({a, b})}$. $abs(X_a)$ is the number of incident vertices of $a$. A high incidence vertex should be contracted later since it is either part of a large hyperedge (which we don't want to contract), or lots of small edges, which means that its not immediately clear what is the best one to contract.

// What happens for a normal graph if you select vertices for contraction proportional to its degree?

// $f(a)/abs(X_a) <= (2 f(a))/(sum_(b in V\\a) f(a) + f(b) - f({a, b})) times 1/ (max_(a in V)(abs(X_a))) <= (2 f(a))/(sum_(b in V\\a) f(a) + f(b) - f({a, b}))$ is like the expected weight of a hyperedge leaving it. In the optimal solution, the expected weight of the each side is minimized? If you take a vertex $a$ with high expected weight, then for a pair $(a, b)$, they are less likely to cross the cut if 
// + $X_a$ is low, which means that the largest hyperedge connected to it has low rank (and thus a is connected to few things. If the largest hyperedge connected to it has low rank but $X_a$ is connected to many things, is it likely to be crossing the cut? Probably not since each hyperedge is not very likely to be crossing the cut)
// + $f(a)$ is high

// If you select one with high probability for that expected value, then you can look at $b in X_a$, and if we select the one in $X_a$ with the same probability, then  

// $ E[a] = f(a)/abs(X_a) $
// //Something about Lovasz extension?
// $ P[a] = (sum_(b in V\\a) f(a) + f(b) - f({a, b}))/(f(a) dot abs(X_a))"?smth? this is sort of like the weight of the hyperedge as a probability?"dots $ 

// $ P[b|a] = P[a sect b]/P[a] = P[a sect b] dot (f(a)dot abs(X_a))/ (sum_(b in V\\a) f(a) + f(b) - f({a, b})) $

// $P[a sect b]$ 

// Total size of hyperedges = $sum_(a in V) f(a)$, so expected hyperedge size is $(sum_(a in V) f(a))/n$
// $ (abs(X_a) dot n)/(sum_(b in V) f(b)) $

// Keeping track of how many hyperedges a vertex is in as you go
// //$ P[b | a] = abs(X_a)/n dot (2f(b))/(sum_(b in V\\a) f(a) + f(b) - f({a, b})) $

// //$ E[b | a] = E[a] $

// //$ P[a inter b] = P[b|a]times P[a] = P[a|b] times P[b] $
// //$ = abs(X_a)/n dot f(a)/abs(X_a) = abs(X_b)/n dot f(b)/abs(X_b) $
// which is almost like the weight of the edge / n for graphs, which is the probability you need, but actually does this match hypergraphs? And also this is a little behind because the value is too big possibly depending on $f(a)$

// You can compute the $X_a$ and $V\\X_a$ in $Theta(n^2)$ as a precomputation. 

// Can you check $abs(X_a union X_b) $ efficiently? Inclusion/exclusion $abs(X_a union X_b) = abs(X_a) + abs(X_b) - abs(X_a sect X_b)$ (i.e modular)

// // If the size of the symmetric part is large, then you can contract with probability $z_n (e)$ for $e = abs(Y)$, since thats how many things it touches. If it is closed under union, then you could just do 
// // $P[e] = (2 f(a)) / (sum_(a, b in A\\a) f(a) + f(b) - f({a, b})) (1-z_n (a))$

// //You could also grab an upper bound for unions via Jensen's inequality? 

// In graphs, selecting a vertex and looking at its 


// ---
// Start by selecting a vertex with probability proportional to the average connected weight. 

// This is "fixed" in the contract set. Then look at the vertices incident to a $X_a$ and contract. Contract the new one with probability $sum f(v)$ is the total of the ranks of hyperedges, since its the degree of every vertex. 

// $(f(a) + f(b) + f(c) - f(a union b) - f(b union c) - f(b union a)  + f(a union b union c) )/(sum_(v in V) f(v))$. This gives the number of hyperedges containing $a, b, c$. It gives 0 for empty set, double counts the two-edges, (is that ok? i think so because it is better to contract two edges faster. Also, it can only be off by at most 1), and single counts every other hyperedge. Lets call this value $c(a)$. If you contract proportional to this, then this has some nice proporties. It contracts highly if the edge is small, and worse if the edge is big. Once we decide to contract, we can just treat the collapsed part as a single vertex and keep going.


// Do you have to keep recomputing $X_i$ directly when you contract? In a hypergraph you know that the things contained in the 
// $b in.not X_a, a in.not X_b =>  f(a) + f(b) = f(a union b)$ 
// The probability of contracting at the end tells us maybe how close it is to this? If probability is 0 since $f(a) + f(b) - f(a union b) = 0$

// // For hypergraphs, $X_a sect X_b = emptyset$, since if $X_a sect X_b = Z != emptyset$, that implies that there is an element for which there is a hyperedge connecting $X_a$ to $z in Z$ and $X_b$ to $z$ for some $z$. This means that by taking the union of the sets. This may not be true because you would just add the edge weights to get the new hyperedge

// $X_a <= 2f(a)$?
// #pseudocode-list(booktabs: true, title: [#smallcaps[Algo]$(V, f)$])[
// + Compute $X_a$ for all $a in V$ \/\/ $Theta (n^2)$
// + *while* $abs(V) > 2$ \/\/ This runs $ Theta (n)$
//   + $S = emptyset$
//   + $S <- arg max_(v in V) f(v)/abs(X_v)$ \/\/$Theta (n)$
//   + *for* $v in V\\S $ \/\/$Theta (n)$
//     + With probability $(f(S) + f(v) - f(S union {v}))/(2 times f(v)) $ \/\/ The number of hyperedges containing them, double counting 2-edges times
//   + $v_S := $ The contracted vertex created by contracting $S$
//   + $V = V \\ {S} union v_S$
//   + Recompute $X_v_S$ \/\/$Theta(n)$
// ]

// What does shortest path look like in hypergraphs? Reasonably it seems like it should be the fewest number of hyperedges taken to get from one vertex to another. There are a few randomized algorithms to do SSSP. Can you extend those to hypergraphs? 
// The problem is a bit weird, but looking at *contractions*, you could make some improvements potentially. First observe that there is a path from $a->b a,b in V$ if there is a loop between each contracted element and itself. Note that repeatedly contracting the lowest-weight connected hyperedge and looking at loops is equivalent to DFS-ing along the hypergraph. Nah this doesn't work. The time complexity would be fine, but you break it when there is a hyperedge connected to vertices inside of the hyperedge we are contracting and to s. We don't know which one is connected. Still, it is surprising there is not really a fast algo for hypergraph shortest path.

// Or are there contraction algorithms for graphs?

// Anyways
// stuff from this weekend
// If I used a minheap. I take the smallest one from the minheap, do some contractions, and then put it back.

// It makes sense to take the smallest one, since $min_(S^* in S) f(S^*) >= f(C)$
// (equivalently $S subset.eq V or S subset.eq V\\C$)

// Now look at the optimal solution.
// _I think_ that for the optimal solution, the ratio of edges (compared to the rest of the graph is at most $1/n$). In other words, $(f(S) + f(x) - f(S union {x}))/(sum_(a, b) f(a) + f(b) - f({a, b}))$? Show by contradiction. If we have more than that much weight on the hyperedge, then it seems like you could find more weight somewhere else $dots$

// What if you looked at the ratio of weight coming out of the hyperedge attributed to that vertex - the union of those two vertices 
// $ f(s) $

// Is this enough? You could dampen it by some amount and that seems like it would help.

// Actually forget probabilitistc stuff. If you know the min cut, then look at the max heap with this as the comparison, and then just keep contracting if you can and then add it back to the heap until everything is either $1/n$ or there are only 2 left right (actually this is covered within the $1/n$ case)?
// This is wrong because you can take two heavy things that are on opposite sides of the min cut. 
// If you enforce connectedness, this becomes weird 

// I guess if you looked at a big one and then its neighbors and try to contract, then you know you didn't mess up the min cut right? those edges were definitely not part of the min cut.

// $f(a)/sum_i f(i) <= 1/n$

// $f(a)/(sum_i f(i)) times f(S) + $

// In a hypergraph, sum the weights of hyperedges:

// $f(a) / f(a)^2 + sum (f(a) + f(b) - f({a union b}))$
// $f(a) / f(a)^2 + n f(a) + sum f(b) - f({a union b})$
// If you sum up the weight of all the hyperedges, it is at most
// $f(a)^2$
// $n * f(a)$


// So you can't really use something to go vertex by vertex. If you go pair by pair, then you know that in a hypergraph, the probability of contracting a pair is the summed weight of the hyperedges containing that pair over the weight of all hyperedge pair weights. 

// You can't derandomize by just grabbing $> 1/n$ of the weight things, because then all unweighted graphs look the same

// If the weight of an edge between $u, v > 1/n$ $u, v in S$ in the min-cut. First observe that the weight of a cut containing $u v$ must be at least $1/n$ of the weight of the edges. Assume for contradiction that $u v$ is in the minimum cut. This implies that all other cuts have weight $>= 1/n$. This then implies that every vertex has at least $1/n$ weight coming out of it. Which contradicts this is $1/n$ of the weight of the graph. smth smth. Such an edges is always guaranteed to exist unless the edge weights are all equal (i.e. the graph is unweighted)

// This means that you can turn the graph into an undirected graph of fewer vertices in $O(m n)$
// also are you going to 
// If the graph is unweighted. There is vertices which are incident to the minimum cut. The vertices with high incidence are those which are more likely to be adjacent to an edge in the minimum cut. This is indeed why Karger's contraction works. If you select the adjacent vertex with the highest degree, then does this just work?
// ---

// We know given a hyperedge, we want to contract with probability proportional to $(w(e) abs(e))/n$. Extended to symmetric submodular functions, this is $sum_(v in e) f(v) - f(e)$. This should still be positive? But this is wrong, because what if a subset of these have weight leaving the set? That means that if those overlap, the weight leaving is also overcounted, which is bad. 

// We want the probability of contracting this hyperedge to be the same as the probability of contracting a series of pairs of hyperedges. 
// Additionally, we need to make sure we are actually contracting a pair which is a "hyperedge". 
// The product of contraction of pairs is the larger one. 
// Inductively, when we contract, we need to make sure that the weight between the two vertices is positive. Additionally, to do this, we should make sure the 

// #line()
// I don't know why, but I think that pairs is the way to go. Maybe beacuse of the fear of accidentally contracting a non-"hyperedge" pair.

// What if we apply the same idea? Pick a vertex uniformly at random, pick an adjacent vertex and contract with probability $1 - (f(u) + f(v) + f({u, v}))/n$. The probability of a pair crossing the cut is the probability $P[u in C, v in.not C] + P[u in.not C, v in C]$. The weight crossing the cut is $f(C)$. We could look at this as the sum of pairs crossing the cut. The probability of crossing the cut is proportional to the weight crossing the cut? In other words, $f(C)$ 

// #line()

// Can we safely form subsets in a laminar family?
// I can union two vertices if the weight connecting them is the same. But what about the fact I can't tell certain subsets apart?

// Also side note, what additional information do you get while you are using the computing that Gomory-Hu tree? Actually, this is interesting in general.

// TODO Review Symmetric Submodular Triangle Inequality. Also are we sure that the probability crossing the cut is $f(C)$? After all it has less structure than hyperedges. 

// $alpha(a, c) >= min{alpha(a, b), alpha(b, c)}$

// And actually this diretcly yields Qeuranne's algorithm, since we decide which pair should not be split, by eliminating the $binom(n, 2)-1$ options with a lesser cut value, then contract them. 

// Something with partitions and a randomized pivot. 

// Sort all of the pairs

// If we choose a pivot coressponding to the weight of the pairs, we know that everything which 
// ---
// I don't think creating hyperedges is the right way to go. It isn't really clear _where_ to contract. Certainly not in $o(n^2)$ time 
// ---

// For the sake of convenience,
// $delta_(a, b) = f(a) + f(b) - f({a, b})$, the difference between the weight of seperated vertices and unioned vertices.

// By the definition of submodularity $delta_(a, b) >= 0$
// Additionally, $delta_(a, b) <= max f(v) - min f(U) <= sum f(v) - min f(v)$.

// $f("OPT") >= sum_(u in.not "OPT") sum_(v in "OPT") delta_(u, v)$

// By submodularity, $delta_(u, v)/(sum f(v)) <= 1$.


// After all contractions (i.e. in a $2$-vertex system), $f(a) + f(b) = 2 "OPT"$. 

// $1 <= abs("OPT") <= n-1$, so $floor(n/2)^2 (sum f(v) - f("OPT"))$
// Crossing the cut, $delta_(u, v)/(sum f(v)) <= floor(n/2)^2$.

// #line()

// The number of pairs is $binom(n, 2)$
// The number of ways to choose $(n-1)$ pairs without replacement $binom(binom(n, 2), n-1)$
 
// ```tex
// sum_(i=2)^(n - 2) binomial(binomial(k, i) (binomial(n, 2) - k), n - 1 - i)/binomial(binomial(n, 2), n - 1)
// ```

Handshake Lemma for Symmetric Submodular Functions

$sum_(b in V \\ a) f(a) + f(b) - f({a, b}) >= 2 f(a)$ \/\/ Can be shown inductively

#line()

For hypergraphs

Let $cal(N)(a) = {b : b in V \\ a,  f(a) + f(b) - f({a, b}) > 0}$
Let $delta(a) = cal(N)(a)$

We are trying to contract a star. Select the center of the star $a$ with probability $(2 f(a))/(sum_(v in V) f(v) delta(a) (n))$

Then, contract vertex $b$ from $cal(N)(a)$ with probability $(f(a) + f(b) - f({a, b}))/(sum_(c in cal(N)(a)) f(a) + f(c) + f({a, c}))$

For the pairs $(a, b)$ crossing the cut with $a$ as the center of the star, $(f(a) + f(b) - f({a, b})) <= 2f("OPT")$, since the weight of any hyperedge crossing the cut is at most $f("OPT")$, and we double count 2-edges.

Also observe that $1/(sum_(v in V) f(v)) <= 1/(n f("OPT"))$.

By the handshake lemma, $1/(sum_(c in cal(N)(a)) f(a) + f(c) + f({a, c})) <= 1/(2 f(a))$

Putting it all together, the probabilty of contracting any edge (given that we chose $a$ as the center of the star) crossing the minimum cut is

$(2 f(a))/(sum_(v in V) f(v) delta(a) (n-1)) dot (f(a) + f(b) - f({a, b}))/(sum_(c in cal(N)(a)) f(a) + f(c) + f({a, c})) <= (2 f(a))/(n f("OPT") delta(a) (n)) dot (2 f("OPT"))/(2f(a)) = 2/(n delta(a) (n))$

The maximum number of vertices in $cal(N)(a)$ with the pair $(a, b)$ crossing the cut is at most $delta(a)$, so the probability of crossing the cut given we chose $a$ as the center of the star is at most $2/n(n)$. There are at most $n$ vertices in the minimum cut, so the probability of crossing the cut from a vertex in the minimum cut is $2/(n)$ 

Let $X_(a b) = cases( 1 "if" a"," b " are contracted in this round", 0 "otherwise")$

In one round, the expected number of pairs to contract is.
$EE[X_(a b)] = sum_a sum_b X_(a, b) Pr[X_(a, b)] = sum_a sum_b (2 f(a))/(sum_(v in V) f(v) delta(a) (n-1)) dot (f(a) + f(b) - f({a, b}))/(sum_(c in cal(N)(a)) f(a) + f(c) + f({a, c})) = sum_a (2 f(a))/(sum_(v in V) f(v) delta(a) (n-1)) sum_b (f(a) + f(b) - f({a, b}))/(sum_(c in cal(N)(a)) f(a) + f(c) + f({a, c})) = sum_a ( 2f(a))/(sum_v f(v) (delta(a)) n) = 2/(delta(a)(n)) >= 1/(binom(n, 2))$

So for the sake of making progress, I guess the expected number is fine after we have selected a center.
Now I get why you have to do things "proportional" and I also have a lot better intuition for hyperedges (not that that means anything neccessarily).
---

If you were to refuse to contract a pair $(x, y)$, every other vertex 

---

I suppose the point of all minimum cut algorithms is to look at the proportion of weight crossing the cut, regardless of size. With constant rank, then this is obviously the same no matter what, but otherwise I guess its more complicated

I want to say that contracting proportional to the expected weight of a pair, then the weight of a pair should work? But then you can cross the cut easily if that side of the cut is too light

// In the hypergraph k-cut paper, the probability of contracting a pair $a, b$ is $(sum_(e : a, b in e) (w(e)(n-abs(e))))/(n sum_u w(u))$.

The probability of contracting a hyperedge is proportional to $w(e)(n-abs(e))/n$, so the probability of contracting a hyperedge is $(w(e)(n-abs(e)))/(sum_u w(u)(n-abs(u)))$. The probability of contracting a pair is $(sum_(e : a, b in e) (w(e)(n-abs(e))))/(sum_u w(u)(n-abs(u)))$. 

There are exactly $(abs(e)(abs(e)-1))/2$ vertices to contract in every hyperedge, so each hyperedge contributes $w(e)(n-abs(e))((abs(e)(abs(e)-1))/2)$ to the numerator of the probability.

First, I guess it is important to note that $sum f(v) = sum_e w(e)abs(e)$. $abs(e) <= n$, so $sum_e w(e)abs(e) <= n sum_e w(e)$. This implies that
$1/(n sum_e w(e)) <= 1/(sum_e w(e)abs(e)) = 1/(sum_v f(v))$.

For the numerator, $sum_e w(e) <= f(a) + f(b) - f({a, b})$, since the 2-edges are double-counted.

Since $sum_e (n-abs(e))$ is strictly greater than $1$ by definition, we need to approximate it by using $(delta(a)$ and $delta(b)$.
We know $union.big_(a in e) abs(e)$ and  $union.big_(a in e) abs(e)$. We can also compute (in linear time) $union.big_(a, b in e) abs(e)$

 The maximum number of hyperedges containing the pair is $min {2^(delta({a, b})), 2^(delta(a))}$

---

Emily says

Contract a star by

Choosing a vertex uniformly at random

Contract neighbors with probability $(f(a) + f(b) - f({a, b}))/(2 f(a))$


For graphs this is the same as contracting an edge uniformly at random

For hypergraphs this is $(sum_(a, b) (w(e)))/(2f(a) n)$

The probability of crossing the cut is

$sum_a ((sum_b f(a) + f(b) - f({a, b})))/(2 f(a)(n)) <= (2 f("OPT") delta(a))/(2 f("OPT")(n)) <= (delta(a))/n $

$(f(a) + f(b) - f({a, b}))/(2 f(a) n) <= (f(a) + f(b) - f({a, b}))/(2 f("OPT") n) <= (2 f("OPT"))/(2 f("OPT") n) <= 1/n $

How many pairs do you contract in expectation?

$>= 1$

We contract at least one thing because of the Handshake Lemma.

#linebreak()

What about for symmetric submodular functions?

This holds true if $sum_b f(a) + f(b) - f({a, b}) <= 2 f("OPT")$ for $a in "OPT", b in V\\"OPT"$

---

A thought, was is the relationship between $sum_a sum_b f(a) + f(b) - f({a, b})$ and $n sum_v f(v)$ nah that doesn't work for hypergraphs.

$-f(S) + sum_(s in S) f(s)$
---

We are trying to contract a star. Select the center of the star $a$ with probability $(2 f(a))/delta(a)$

Then, contract vertex $b$ from $cal(N)(a)$ with probability proportional to $sum_b (f(a) + f(b) - f({a, b}))/delta(b)$

Each pair is contracted with probability

Create a set $S = {a}$

With probability $2/n$, contract $S$ and repeat from a new vertex $a$. Otherwise, select $b$ proportional to $f(a) + f(b) - f({a, b})$ and repeat the coin flip procedure. 

Let $X_(a b)$ represent the probability of contracting a pair ${a, b}$ which crosses the cut


The probability of selecting a set $S$ which crosses the minimum cut is 

$ union.big Pr[X_(a b)] $
$ <= sum_(a in V) sum_(b in cal(N)(a)) Pr[X_(a b)] $
$ = sum_(a in V) sum_(b in cal(N)(a)) f(a)/(sum_(v in V) f(v)) dot 2/n dot (f(a) + f(b) - f({a, b}))/(sum_(c in cal(N)(a)) (f(a) + f(c) - f({a, c}))) $
$ =2/n sum_(a in V) f(a)/(sum_(v in V) f(v)) dot  sum_(b in cal(N)(a)) (f(a) + f(b) - f({a, b}))/(sum_(c in cal(N)(a)) (f(a) + f(c) - f({a, c}))) $
$ = 2/n sum_(a in V) f(a)/(sum_(v in V) f(v)) $
$ = 2/n $

Ok so the probability of contracting across the cut is the probability of contracting at any point. 

Thus the probability of breaking the cut in one round is
$ product_(i=3)^n (i-1)/i = 1/(binom(n, 2))$


The probability of contracting any pair is $ = 2/n$. Thus, in expectation, we will contract a pair on the $n/2$th iteration.

This is repeated for $n-2$ vertices, this gives so the algorithm takes $O(n^2)$ in expectation to contract all vertices.
 
#line()

Does this extend to symmetric submodular functions? 
Given vertices $V, abs(V)=n$ in a hypergraph:
For a contraction of a pair $(a, b) in V times V$ with probability $w(a, b)/(sum_(p in V) sum_(q in V)) times B(n)$, where $B(n)$ is a bias $0 < B(n) <= 1$, and $w(a, b) = f(a) + f(b) - f({a, b})$

Note on submodularity: 2-edges may be double counted, by the cut function, thus for each pair $(a, b)$ which crosses the minimum cut, $w(a, b) <= 2 f("OPT")$

At most $n^2/4$ pairs of vertices cross the minimum cut. Thus the summed probabilities of selecting across the minimum cut is:
$w(a, b)/(sum_(p in V) sum_(q in V)) w(p, q)) (n^2/4) * b <= 2f("OPT")/(n f("OPT")) (n^2/4) * b <= n/2 * b$

For the optimal $b$
$b = Omega(1/n)$
We expect to try to attempt to contract $1/b$ times 

We will stop when the size of the graph is $n/f(n)$, $f(n) = O(n)$. Thus we must contract $n-(n/f(n))$ vertices.

$b/2 * sum_(i=(n-n/f(n)))^n i = b/2 ((n)(n+1)/2)/((n/f(n))((n/f(n)+1)/2)) <= b/2 f^2(n)$. We want this to be $<= 1/n$

$O(min {1/b (n - n/f(n)), (n/f(n))^3})$ is the running time, where the second part is from running Queyranne's algorithm

For example, with $b=2/(n log^2(n))$ and $f=log(n)$, the probability of success is $1/n$, and the running time is $O(min{n^2 log^2(n), (n^3/log^3(n))})$


