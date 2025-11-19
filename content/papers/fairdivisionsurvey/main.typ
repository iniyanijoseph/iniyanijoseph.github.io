#import "@preview/unequivocal-ams:0.1.2":  theorem, proof, ams-article
#import "@preview/ctheorems:1.1.3": *
#import "@preview/lovelace:0.3.0": *

#show: ams-article.with(
  title: [Fair Division Survey],
  authors: (
    (
      name: "Iniyan Joseph",
      department: [Erik Jonsson School of Engineering and Computer Science],
      organization: [University of Texas at Dallas],
      location: [Richardson, TX],
      email: "IIJ210000@utdallas.edu",
      url: "iniyanijoseph.github.io"
    ),
  ),
  bibliography: bibliography("refs.bib"),
)

#show "thm-qed-symbol" : $square$
#let proof = thmproof("proof", "Proof")
#let openproblem = thmbox("Open Problem", "Open Problem", breakable:true)
#let NNN = $cal(N)$;
#let MMM = $cal(M)$;

#show figure: set block(breakable: true)

#footnote(numbering: it => "")[
  #par(justify: true, first-line-indent: 1em)[
    _This paper was written in fulfillment of the requirements of Independent Study CS 4V95.009 for the fall semester of 2024_
  ]
]


= Introduction
Fair division is a problem with roots in the Bible and in Greek mythology. When Abraham and Lot must divide the land of Canaan fairly among themselves, one divides the land into two parts (which they perceive to be equally valuable), and the other chooses their favorite piece. This problem has proven to be useful in practice. It has been used for international dispute resolution @brams2019disputeresolution, distribution of food for food banks, and estate divisions @aleksandrov2015onlinefairdivisionanalysing@mertzanidis2024automatingfooddroppower@UnreasonableFairnessOfMNW. This was formalized by @steinhaus1948problem for both divisible continuous and indivisible discrete goods. Since then, several promising results have been published in both settings, with the existence of a bounded-time envy-free cake cutting procedure being resolved by @aziz2017discreteboundedenvyfreecake. However, the fair allocation of a finite set of indivisible goods to individuals "fairly" remains a fundamental open question within computer science and economics. Indeed, many interpretations of fairness exist. In this paper, we survey some common notions of fairness, their computability, and open questions within the field of Fair Division. We also present a small result connecting two notions of fairness (MNW and EQX).

= Preliminaries
Let $NNN$ be a set of agents with $abs(NNN) = n$ and $MMM$ be a set of goods with $abs(MMM) = m$. Each agent $i in NNN$ possesses a valuation function $v_i : 2^cal(MMM) -> RR_(>=0)$, representing their value of each bundle of goods within $S subset.eq MMM$. It is assumed that for each agent $i in NNN$ that $v_i (emptyset) = 0$. For simplicity, we write $v_i ({g})$ as $v_i (g)$ for individual items $g in MMM$. The valuation function is usually taken to be additive, meaning that an agent's value of a $S$ is equal to the sum of the agent's values of the individual goods. Formally, $v_i (S) = sum_(g in S) v_i (g)$. For more general contexts, the valuation function is taken as monotone, i.e., that $v_i (S) <= v_i (T)$ for all $S subset.eq T subset.eq MMM$. In this survey, we focus on the additive context, however several of the results hold for monotone valuations as well.

An allocation $X$ is a partition $MMM$ into $n$ disjoint sets and assign each partition to an agent $i in NNN$. The subset of $MMM$ assigned to agent $i$ (called $i$'s bundle) is denoted $X_i$, and each agent $i$'s valuation of their own bundle is $i$'s "utility". The goal of fair division is to take a tuple $(NNN, MMM, chevron.l v_1, ..., v_n chevron.r)$ and to compute a "fair" allocation efficiently. To this end, there are several notions of fairness. Computing fair allocations efficiently is not always known to be possible, or is hard, so the valuation functions are restricted. We primarily focus on two settings, that of identical valuations where $forall_(i in NNN) v_i = v$, and binary valuations where $v_i ({g}) in {0, 1}$.  In these contexts, several notions become easier to compute.

= Envy
Arguably, the gold standard of fair division is envy freeness (EF), where no agent would like another's bundle more than their own. Formally, $forall_(i, j in NNN) v_i (X_i) >= v_i (X_j)$. If this is not the case, (i.e. $v_i (X_i) < v_i (X_j)$), $i$ is said to "envy" "$j$". It is clear that for discrete goods, this does not always exist, as seen in the following counterexample:

#proof[
  Take two agents 1 and 2 and one positively valued good. Without loss of generality, allocate the good to agent 1. Agent 2 envies agent 1, as $v_2 (X_2) = 0$ and $v_2 (X_1) > 0$.
]

Worse still, computing if an arbitrary instance admits an EF allocation is NP-complete @lipton2004approximately.

Thus, when allocating a finite set of goods, EF is relaxed to envy-freeness up to X (EFX) by allowing the removal of an arbitrary good from another agent's bundle such that $forall_(i, j in NNN) v_i (X_i) >= v_i (X_j without {g})$ for all $g in X_j$.

For two agents, EFX can be computed using a variation of the "cut-and-choose" procedure. The first agent divides $MMM$ into two bundles, $X_1$ and $X_2$ such that they value each of them as near to $1/2$ as possible.  Then, the second agents chooses the bundle which gives her higher utility, breaking ties arbitrarily. The second agent clearly does not envy the first, as they received the bundle with the highest valuation in their eyes. If the first agent prefers the bundle they received, we are done. Otherwise, the first agent cannot envy the second after the removal of a good, as otherwise this bring the valuation of the bundles closer to $1/2$, which would contradict that the first agent selected as near to $1/2$ as they could initially. For three agents, @EFXExistsFor3 showed that EFX can be computed as well in pseudo-polynomial time. @EFXSimplificationsAndImprovements later gave a simpler algorithm for this using casework to iteratively improve the allocation.

Thus, we come to our first open question.

#openproblem[
  Do EFX allocations always exist? If so, can they be computed efficiently?
]

The leximin solution is one which maximizes the minimum utility, then maximizing the second least utility, and so on. The leximin++ is the leximin solution, which, after maximizing the value of the bundle with minimum utility, maximizes size of the bundle. Then, maximizes the size of the second least agent's utility subject to maximizing the size of the second bundle and so on.

#theorem[For identical additive valuations, an EFX allocation can be computed by taking the leximin++ maximal allocation. @plaut2020almost
   #proof[
      For contradiction, let $X$ be a leximin++ allocation which is not EFX $v(X_i) < v(X_j)$ for $i < j$. This means that there is a pair of agents with $i < j$, where $v(X_i) < v(X_j \\ {g})$ for some $g in X_j$. This means that the minimum utility of the bundle can be increased by giving that good $g$ to $X_i$, contradicting that $X$ is a leximin++ allocation.
   ]
]

Although computing EFX for general additive valuations remains an open problem, several relaxations of EFX have been proposed which are easier to compute.

One natural easy-to-compute notion relaxation of EFX is EF1.  Rather than allowing the removal of an arbitrary good, this is relaxed so that there must exist a good which can each be removed in order to resolve envy. In other words, $forall_(i, j in NNN) v_i (X_i) >= v_i (X_j \\ {g})$ for a good $g in X_j$. This notion was first formally defined by @BudishCombinatorialAssignment. Note that this is equivalent to removing the good which $i$ values the most in $j$'s bundle to enforce envy-freeness $forall_(i, j in NNN) v_i (X_i) >= v_i (X_j \\ {g^*})$, with $g^* = arg max_(g in X_j)  v_i (g)$. For general valuations, EF1 can be computed efficiently using simple polynomial time algorithms.

One such well-known algorithm is the round robin algorithm, presented below: Informally, the algorithm iterate through agents in a fixed order, giving them their most valued good at each step (breaking ties arbitrarily) until no goods remain.
//#box()[
#align(center)[
  #pseudocode-list(booktabs: true, title: [Round-Robin])[
  - *Input:* $(NNN, MMM, v)$
  - *Output:* An EF1 allocation X

  + $P <- MMM$
  + $X = <emptyset, ... , emptyset>$
  + i := 1
  + *while* |P| > 0
    + $X_i <- X_i union {arg max_(g in P) v_i (g)}$ \# Give $i$ their favorite good.
    + $i <- (i + 1 mod n) + 1$

  + $MMM <- P$
  ]
]
//]

#theorem[@UnreasonableFairnessOfMNW Round-Robin produces an EF1 allocation
  #proof[
    Take two agents $i$ and $j$. After the execution of fixed-order round-robin. First, we note that an agent $i$ cannot envy only value another agent $j$ with ($i <= j$). This is trivial for $j=i$, so let us take $j > i$. Here, in each iteration of the loop, $j$ chooses their favorite good after $i$. Thus, $i$ believes they received a weakly more valuable good than $j$. Thus, we get $v_i (X_i) >= v_i (X_j)$

    Note that in each iteration of the loop, for $i > j$, $i$ receives weakly more than what $j$ will receive in the following iteration of the loop according to $i$. We then only need to consider the first iteration of the loop, as envy cannot come from later in the execution of the algorithm. Since $i$ may value $X_j$ for $j < i$ by the item allocated in the first iteration of the loop, then the removal of the item will remove $i$'s envy of $X_j$. Thus, the allocation is EF1.
  ]
]

Another common algorithm for computing an EF1 is Envy-Cycle Elimination. Define the envy-graph $G$, with $V = N$ and a directed edge between agents, $i -> j$ iff $v_i (X_i) < v_i (X_j))$. The algorithm works as follows. Find an arbitrary unenvied agent $i$ and give them their most valued good. If no such agent exists, then there must be a cycle $C = chevron.l c_i, c_(i+1), ..., c_(i-1), c_i chevron.r$ where $c_j$ envies $c_(j+1)$ (as otherwise there would have to exist a sink, as it would be a DAG). To remove or "eliminate" this cycle (then for agent $c_j$, give them the bundle  of agent $c_(j+1)$). Until an unenvied agent is found, repeatedly remove directed cycles. Then, give the agent their most favorite unallocated good.
//#box()[
#align(center)[
  #pseudocode-list(booktabs:true, title: [Envy-Cycle Elimination])[
    - *Input:* $(NNN, MMM, v)$
    -  *Output:* An EF1 and $1/2$-EFX allocation $X$
    + $X = chevron.l emptyset, ... , emptyset chevron.r$
    + *for* $i = 1, ..., n$
      + $X_i <- emptyset$
    + *for* $ell = 1...m$
      + *while* $exists.not$ unenvied agent \# Perform envy-cycle elimination
        + Find an envy cycle $C =chevron.l c_i, c_(i+1), ..., c_(i-1), c_i chevron.r$
        + $C_i <- C_(i + 1)$

      + *let* $i$ be an unenvied agent \# Find an unenvied agent $i$
      + *let* $g^* in arg max_(g in MMM) v_i (g)$ \# Give $i$ their favorite good.
      + $A_i <- A_i union {g^*}$
      + $M <- M \\ {g^*}$
  ]
]
//

#theorem[@lipton2004approximately Envy-Cycle Elimination produces an EF1 allocation
  #proof[
    Before the algorithm begins, the allocation is trivially EF (and EFX), as no good has been allocated and thus all bundles are valued at 0 by all agents. In each iteration of the loop, the algorithm allocates goods only to unenvied agents This implies that an agent may only envy another by a single good. This then implies that the algorithm is EF1 after each iteration of the loop, as the removal of a good $g in X_j$ causing envy for any $i$ who envies $j$ will resolve envy.
  ]
]

=== $alpha$-EFX

Another relation of EFX is $alpha$-EFX, where $forall_(i, j in NNN) v_i (X_i) >= alpha times v_i (X_j \\ {g})$ for $alpha in (0, 1]$.

#openproblem[What is the greatest $alpha$ for which an $alpha$-EFX allocation exists?]

It is important to note that if the best possible $alpha = 1$, then EFX allocations can always exist, but otherwise, this question becomes meaningful as well.

@plaut2020almost first attempt to compute approximate-EFX allocations by slightly modifying the Envy-Cycle elimination algorithm to compute $1/2$-EFX.
@chan2019maximinawareallocationsindivisiblegoods show that Envy-Cycle Elimination by itself can compute a $1/2$-EFX allocation, if ties are broken between unenvied agents in favor of those with empty bundles.

#theorem[@chan2019maximinawareallocationsindivisiblegoods Envy-Cycle Elimination produces an $1/2$-EFX allocation
  #proof[
    Take two distinct agents, $i, j in NNN$. Assume that $v_i (X_i) >= 1/2 times v_i (X_j \\ {g})$ for all $g in X_j$. This statement holds trivially for $|X_j| = 1$, so assume that $|X_j| = 2$.

   Let $g^*$ be the good last allocated to $j$ Since ties are broken in favor of empty bundles when picking an agent to allocate to, $X_i != emptyset$, as otherwise $g^*$ would have been allocated to $i$ rather than $j$. Because $|X_i| >= 1$, there must have been a round before $g^*$ during which $i$ was able to pick an item. Although $X_i$ might be swapped with other agents' bundles, $v_i (X_i)$ is non-decreasing. Therefore $v_i (X_i) >= v_i (g^*)$. Additionally, by the design of the algorithm, $v_i (X_i) >= v_i (X_j \\ {g})$. Together, these imply that

   $ 2 times v_i (X_i) >= v_i (X_j) >= v_i (X_j \\ {g}), forall g in X_j $

  Thus, the allocation is $1/2$-EFX.
 ]
]

@AmanatidisBeating12EFX improve this to a $Phi-1$-EFX allocation. Most recently, @amanatidis2024pushingfrontierapproximateefx compute a $2/3$-EFX allocation for general valuations.

= Pareto Optimality

Take two allocations $A$ and $B$. $A$ is said to "Pareto Dominate" $B$ iff $v_i (A_i) >= v_i  (B_i)$ for all $i in NNN$, and for at least one agent, $v_i (A_i) > v_i(B_i)$. This induces a partial ordering on the set of all feasible allocations. The maximal element(s) are said to be "Pareto Optimal".

#theorem[@plaut2020almost PO and EFX do not coincide for all fair division instances if zero marginal utility is allowed.
  #proof[
    #align(center)[
      #table(columns: (auto, auto, auto, auto),
        table.header(
        [], [*a*], [*b*], [*c*],
        [agent $1$], $2$, $1$, $0$,
        [agent $2$], $2$, $0$, $1$
        ),
      )
    ]

    $v_1 (c) = 0$ and $v_2 (c) > 0$ for a PO allocation, $c$ must be given to agent $2$. Similarly, $b$ must be allocated to agent $1$ as $v_1 (b) > 0$ and $v_2 (b) = 0$.

    Assume without loss of generality $a$ is allocated to agent $1$. Then $v_2 (X_1 \\ {b}) = 2 >= v_2 (X_2) = 1$.
  ]
]

Like Pareto dominating allocations, Lorenz dominating allocations induce a partial ordering over the set of allocations. Here, take two vectors of utilities which have been sorted $A$ and $B$. $A$ is said to "Lorenz dominate" B iff for every $k in [n], sum_(i=1)^k (A_i) >= sum_(i=1)^k (B_i)$ @babaioff2021fair.

= MMS

A Maximin-Share Fair allocation is one maximizing the "worst-off" agent according to each $i in NNN$. In other words, all agents $i in NNN$, $v_i (X_i) >= mu_i^n (MMM) = max_(X in Pi_n (MMM)) min_(X_j in X) v_i (X_j) $.

Unfortunately MMS may not always exist, @WhenDoesTheMaximinShareExistProcaccia, although it exists with high probability in general. Additionally, MMS is hard to compute @woeginger1997polynomial. Thus, several recent papers try to approximate it so that $v_i (X_i) >= alpha times mu_i^n (MMM)$, with $alpha in (0, 1]$. This is known as an $alpha$-MMS allocation.

Oe common technique for producing $1/2$-MMS allocations is known as the bag-filling algorithm. First, the MMS values of all agents are normalized such that $mu_i^n = 1$ for all agents $i in NNN$. Maintain a "bag", and keep adding arbitrary goods until an agent $j$ values the bag at least $1/2$, breaking ties arbitrarily. Once such an agent is found, add all the goods in the bag to $X_j$ and remove them from $MMM$. When a single agent remains, give her the remaining unallocated goods.
//#box()[
#align(center)[
  #let bag = "BAG"
  #pseudocode-list(booktabs:true, title:[Bag-Filling])[
  - *Input:* $(NNN, MMM, v)$
  - *Output:* A $1/2$-MMS allocation X
  + $bag = nothing$
  + $X = chevron.l emptyset, ... , emptyset chevron.r$
  + *while* $exists i in NNN and g in MMM$ such that $v_i (g) >= 1/2$
    + $X_i <- {g}$ \# Give $i$ their favorite good.
    + $NNN <- NNN \\ {i}$
    + $MMM <- MMM \\ {g}$

  + *while* $|N| > 1$
    + *while* $exists.not i in NNN$ with $v_i (bag) < 1/2$
      + $g = $ arbitrary $g in MMM$
      + $bag = bag union {g}$
    + Take $i in NNN$ where $v_i (bag) >= 1/2$
    + $NNN <- NNN \\ {i}$
    + $MMM <- MMM \\ bag$
  + Let $i$ be the remaining agent in $NNN$
  + $X_i = MMM$
  ]
]
//]

#theorem[@GargApproximatingMMS Removing an agent and removing a single good from a problem instance produces results in a weakly greater MMS value. In other words, $mu_i^n (MMM) <= mu_i^n (MMM\\{g})$ for an arbitrary $g in MMM$.
  #proof[
    Before the removal of the agent and good, $v_i (X_i) >= "MMS"_i (n)$. Suppose w.l.o.g that $g in X_n$, and reallocate all other $g' in X_n$ to the other agents $1,..., n-1$. This is clearly an allocation $Pi_(n-1) (MMM \\ {g})$, denoted by $X' = (X'_1, ... X'_(n-1))$. Since each agent has weakly greater utility in the new allocation, $X'_i >= X_i >= mu_i^n (MMM)$.
  ]
]

#theorem[@GargApproximatingMMS The bag-filling algorithm produces a $1/2$-MMS allocation.
  #proof[
    In each round of the algorithm, the bag is allocated with an agent with value at least $1/2$ for the bag. Note that the value of the other agents for the given bag is smaller than 1. Since, before the last good is added to the bag, the value of the bag for all agents is smaller than $1/2$ and greater than $1/2$ for at least one agent after. Thus, when an agent takes away a bag in some round, the remaining $n-1$ agents have total value at least $n-1$ of the remaining bundle. This can be repeated until 1 agent remains, who will then receive their entire MMS value.
  ]
]

@ProcacciaFairEnough first showed the existence of $2/3$-MMS approximation algorithms. @GargApproximatingMMS present a simple algorithm for computing such allocations by modifying the bag-filling algorithm to use low, medium, and highly valued goods to compute a $2/3$-MMS allocation. Several works attempt to @garg2020improved compute $3/4 + O(f(n))$-MMS allocations, achieving up to an- $3/4 + min (1/36, 3/(16n-4)))$-MMS allocation @akrami2023simplification, but with no improvement on the constant approximation factor. Very recently, @akrami2024breaking improve this to a $3/4 + 3/3836$-MMS.

Despite the progress made in computing approximations, the approximation of MMS is incomplete. @FeigeMMSUpperBound showed a counterexample, showing that MMS allocations cannot always be approximated higher than $39/40$, even for 3 agents.

#openproblem[
  What is the highest possible $alpha$ for which $alpha$-MMS allocations exist?
]
#openproblem[
  Does a stronger approximation bound exist than $39/40$?
]

= Maximum Nash Welfare
Maximum Nash Welfare (MNW) is a more "global" notion of welfare. Namely, it considers the utility of each agent rather than agents' value over others'. This first maximizes the number of agents receiving positive utility, then maximizes the geometric mean of utilities. Let $Pi_k (S)$ represent the set of all partitions of a set S into k elements. The MNW allocation is given by $arg max_(X in Pi_k (MMM)) product_(i=1)^n v_i (X_i)$.

In the notion of the geometric mean, under identical additive valuations, this is maximized when all agents with positive utilities have valuations which are as similar as possible (after maximizing the agents with positive utilities). This is quite useful, as MNW provides strong guarantees for other notions of fairness.

#theorem[@UnreasonableFairnessOfMNW  A MNW allocation is PO and EF1
  #proof[
    MNW implies PO, as a Pareto dominating allocation would have a higher product of utilities. It is left to show that MNW $=>$ EF1.

    Assume for contradiction that MNW $arrow.r.double.not$ EF1.
    This implies that there exists $i, j in NNN$ where $exists_(g in X_j) v_i (X_i) < v_i (X_j \\ {g})$.

    Proving EF1 is slightly more involved. Assume for contradiction that there exists two agents $i$ and $j$ such that $v_i < v_i(X_j \\ {g})$ for every $g in X_j$. We must show that there is another allocation $X'$ with Nash Welfare larger than that of $X$.

    Because $i$ envies $j$, there exists a $g^* = arg min_(g in X_j, v_i (g) > 0) {(v_j (g))/(v_i (g)) }$. Let $X'_k$ = $X_k$ for all $k != i, j$. Next, move the $g^*$ from $j$'s bundle to $i$'s. In other words, $X'_i = X_i union {g^*}$ and $X'_j = X_j without {g^*}$.

    We must show that $v_i (X'_i) times v_j (X'_j) > v_i (X_i) times v_j (X_j)$

    To begin, we know that $(v_j (g^*)) / (v_i (g^*)) <= (v_j (X_j)) / (v_i (X_j))$, which implies that

    $ (v_j (g^*)) / (v_j (X_j)) <= (v_i (g^*)) / (v_i (X_j)) < v_i (g^*) / (v_i (X_j) + v_i (g^*))$, since $i$ envies $j$ even after the removal of an item $g^*$ in $X_j$. Therefore,

    $ v_i (X'_i) times v_j (X'_j) = (v_i (X_j) + v_i (g^*)) times (v_j (X_j) - v_j (g^*)) $
    $ = (1 + (v_i (g^*)) / (v_i (X_i))) times  (1 - (v_j (g^*)) / (v_j (X_j))) times v_i (X_j) times v_i (X_i) times v_j (X_j) $
    which, from the previous inequality, $> (1 - (v_i (g^*))/(v_i (X_i) + v_i (g^*)) times ((v_i (X_i) + v_i (g^*))/(v_i (X_i))) times v_i (X_j) times v_i (X_i) times v_j (X_j)$
    $ v_i (X_i) times v_j (X_j)$
  ]
]

@UnreasonableFairnessOfMNW also showed that a MNW allocation is guaranteed to be $2/(1+sqrt(4n-3))$-MMS.

These guarantees however do not extend much further. @amanatidis2021MNWAndStories show that MNW does not give an EFX allocation in general, MNW is NP-hard even for identical additive valuations @roos2010complexity, although under binary and bi-valued (where $v_i (g) in {a, b}$) instances it can be computed in polynomial time @barman2018greedy. For 3-value instances, where $v_i (g) in {a, b, c}$, the problem of computing a MNW allocation is NP-complete @MNWAndOtherStoriesAboutEFX. Thus, due to its hardness to compute, we seek to guarantee these properties without computing them through MNW.

#openproblem[
  Can an EF1 and PO allocation be computed in polynomial time?
]

As computing MNW allocations is APX-hard, thus prior research has sought to approximate MNW allocations for its desiderata. Can an EF1 and PO allocation be computed in polynomial time? For bounded valuations, @barman2018finding develop a polynomial time algorithm, and in pseudo-polynomial time for general valuations.


#openproblem[
  What is the best possible $alpha$ for which $alpha$-MNW allocations exist?
]

= EQX
Another notion of fairness based on utilities is EQX. An equitable (EQ) allocation is one in which all agent utilities are roughly the same. $ v_i (X_i) > v_j (X_j)$, however like EFX, this
clearly does not exist. This motivates a similar relaxation, by allowing the removal of a good $g ∈ X_j$ . EQX is well studied in the literature for both goods and for chores, and
unlike EFX, is fairly easy to compute.

For identical valuations, EFX coincides with EQX, both of which can be computed efficiently. For strictly positive valuations, an EQX + PO allocation always exists, and an EQ1 + PO allocation can be found in pseudo-polynomial time @freeman2019equitable.

@barman2024nearly shows that for all chores or all goods, EQX exists even for monotone allocations, and can be computed in polynomial time, although this is not true for
arbitrary valuations (unless P=NP).

#theorem[$"MNW" => "EQX"$ under identical additive valuations.
  #proof[
    Assume for contradiction that MNW does not imply EQX under identical valuations. Start with an MNW allocation $X$. This means that there is an agent from which $v (X_i \\ {g}) > v (X_j)$. Otherwise, if $v (X_i) <= v (X_j)$ EQX holds trivially.

    If $v (X_i) > v (X_j)$, then it suffices to show that moving a good from $i$ to $j$ will result in a larger geometric mean.

    $ (v (X_j) + v(g)) (v (X_i) - v(g)) $
    $ = (v(X_j) v(X_i)) - (v(g) v(X_j)) + (v(g) v(X_i)) - v(g)^2 $
    $ = (v(X_j) v(X_i)) + v(g)(v(X_i) - v(X_j) - v(g)) $

    By the assumption,
    $ v (X_i \\ {g}) > v(X_j) $
    and since valuations are additive $v (X_i) > v(X_j)$, so $v (X_i) - v(X_j) > v(g)$. Thus we have derived a contradiction, as 
  $(v(X_j) v(X_i))$ is increased by moving the good $g$. 
  ]
]

= Between EFX and EF1
EFL (Envy-Freeness up to a Less Preferred Good) is meant to be “in-between” EFX and EF1. For agents $i$ and $j$, rather than allowing the removal of an arbitrary good from $X_j$,
it only allows the removal of goods $g$ which are less valuable to $i$ than $X_i$. In other words $v_I (X_i) >= v_j (X_j \\ {g})$ for $g in X_j$ and $v_i (g) < v_i (X_i)$. This can be computed in polynomial time using envy-cycle elimination.

== Randomness
Another line research focuses on randomness in fairness allocations.

=== EFR
@farhadi2021almost introduced the notion of envy-freeness up to a random good (EFR), where the expected envy of $i$ towards an agent $j$ can be eliminated. @farhadi2021almost also show that a $0.73$-EFR allocation can be computed in polynomial time. However, such a mechanism cannot be strategyproof and envy free even in expectation @basteck2023strategy.


= Improving the Maximin Share
== GMMS
EFX can be connected to to MMS through the stronger notion of (Groupwise MMS) GMMS.

@barman2018groupwise define an allocation as GMMS as if for all subsets of $NNN$ and their bundle, their allocation is also MMS. $v_i (X_i) >= "GMMS"_i = max_(S subset.eq NNN: i in S) mu_i^(|S|) (union_(j in S) X_j)$. It is clear that because MMS allocations do not exist, GMMS allocation allocations do not always exist.

== PMMS
PMMS is a slightly weaker form of GMMS, in which $|S| = 2$. In other words, for all $S subset.eq NNN$, $v_i (X_i) >= "PMMS"_i = max_(S subset.eq NNN: i in S) mu_i^(|S|) (union_(j in S) X_j)$.

A slightly easier notion is $alpha$-GMMS, where $v_i (X_i) >= alpha-"GMMS"_i$. @barman2018groupwise show that $1/2$-GMMS allocations always exist, and can be computed efficiently. @AmanatidisBeating12EFX show that improved this to a $2/(Phi+2)$ approximation. The currently highest approximation is to $4/7$-@chaudhury2021little.

A similar line of work has attempted to approximate PMMS, with the highest known approximation as an $approx$ 0.781-PMMS allocation @kurokawa2017fair.

#openproblem[
  What is the highest $alpha$ for which $alpha$-GMMS allocations exist?
]

GMMS connects MMS (and its related notions) to EF and its relaxations through the hierarchy:
$ "EF" => "GMMS" => "EFX" => "EFL" => "EF1" $

#theorem[@barman2018groupwise GMMS strictly generalizes MMS and PMMS.
  #proof[
    It is trivially true that $"GMMS" => "MMS"$ and that $"GMMS" => "PMMS"$, as MMS must hold for all subsets for $n$ for $2$ respectively by the definition of GMMS. For showing that $"MMS" arrow.double.not "GMMS"$, we provide the example given by @barman2018groupwise.

    Take an instance with $9$ agents and $8$ goods, where $MMM = {g_1, ..g_8}$. This means that $"MMS"_i = 0$, since some agents must receive nothing. $v_1 (g_1) = v_1 (g_2) = v_1 (g_3) = 5, v_1 (g_4) = v_1 (g_5) = 3$, and $v_1 (g_6)= v_1 (g_7) = v_1 (g_8) = 1$. For $z in {1, ..., 9}$ and all other agents $i, v_i (g_z) = 1$.

    Take an allocation $X_1 = {g_1}, X_2 = {g_2, g_4}, X_3 = {g_3, g_5}, X_4 = {g_6, g_7, g_8}$, with all other agents receiving $emptyset$. This is both MMS and PMMS, but is not GMMS.
  ]
]

= Other EFX Notions
== Epistemic EFX
@EpistemicEF proposed the notion of Epistemic Envy-Freeness where for each agent $i$, the allocation can be made envy-free for $i$ by redistributing $MMM \\ X_i$ among $NNN \\ i$. @CaragiannisEEFX propose the slightly weaker notion of Epistemic EFX, defined similarly, but only requiring that the allocation can be made envy-free up to $X$ for $i$. @akrami2024epistemicefxallocationsexist recently showed that EEFX allocations always exist and can be computed in polynomial time.

#openproblem[
  Do Epistemic Envy-Free allocations exist in general?
]

== Charity

Although the existence of EX allocations is open, it always exists for a subset of goods. For example, trivially, the removal of all goods yields an EFX allocation. The meaningful form of this is the idea of "charity", where a set of goods $P subset.eq MMM$ remain unallocated (i.e. “donated” to charity), and no agent should envy charity. @chaudhury2021little give a polynomial time algorithm which donates at most $n-1$ goods to charity. @berger2021almostfullefxexists improve this to donating $n-2$ goods, and give an algorithm which donates only 1 good in the case of 4 agents.

#openproblem[
  Does EFX exist while donating a sublinear number of goods to charity?
]

Note that if an EFX allocations with 0 goods may be donated to charity exists, this is simply an EFX allocation.

@akrami2022ef2x propose a similar notion called EFkX, in which the removal of 2 goods from another agents' bundle rather than just one (i.e. EF1X is the same as EFX). They show the existence of EF2X allocations for restricted additive valuations (where $v_i {g} in {0, v (g)}$). note that an EFX allocation with charity can be turned into an EF2X allocation by giving the $n-2$ goods to $n-2$ unique agents.

//\@chaudhary gives a polynomial time algorithm to compute a $1-epsilon$-EFX allocation with O() unallocated goods for $epsilon in (0, 0.5]$, and \@Akrami improves this further to O()

= Different Setting
== Online Fair Division

While in the traditional model of fair division, items are assumed to be standard, agents and/or goods may arrive in an online manner. @aleksandrov2020online survey online fair division in depth. Here, either agents, goods,or both arrive online at times $t = 1, 2, ..., T$. One approach to online fairness mechanisms is to asymptotically allocate goods such that envy the envy-per-good $"envy"_t/t$ tends to 0, where $"envy"_t$ is the maximum envy one agent has. @benade2018make show that randomly allocating goods removes the expected envy. More interestingly, it is impossible to do better than such a mechanism, which is optimal up
to a logarithmic factor. Online fair division however is not unilaterally easy to compute. @aleksandrov2019strategy show that an ex-ante envy free (i.e. envy-free in expectation) and PO allocation may not always exist.

#theorem[@aleksandrov2019strategy A simultaneously ex-ante envy-free and PO allocation does not always exist.
  #proof[
	#align(center)[
    #table(columns: (auto, auto, auto),
	    table.header(
	        [*Agent*], [$g_1$], [$g_2$],
	        [1], [1], [2],
           [2], [2], [1],
	      ),
	    )
	]
    By the definition of ex-ante envy-freeness, each agent must have equal probability of receiving each item (i.e. $12$), however to ensure ex-ante Pareto optimality, each agent must only be given their favorite item.
  ]
]

== Chores and Mixed Manna
When all goods are chores, i.e. $: 2^MMM -> RR_(<=0)$, the problem of fair division becomes much more difficult, and leads to several open problems. EFX for chores does not exist, and indeed is NP-complete @christoforidis2024pursuitefxchoresnonexistence. Should such an allocation exist, it is mutually exclusive from PO @barman2023fairchoredivisionbinary. It also cannot have a finite approximation. Still, under the restricted context of bi-valued and binary valuations, EF1 and PO allocations exist @ebadian2021fairly@barman2023fairchoredivisionbinary.

/*
Algorithms for Competitive Division of Chores - Compute an approximate fair allocation using rounding @branzei2019algorithms
*/

The division of goods $g in MMM$ with arbitrary valuations, where $v_i : 2^MMM -> RR$ have shown several barriers for computation. For EQX allocations, @barman2024nearly showed that EQX allocations are not guaranteed to exist, even under additive normalized valuations, and that determining if such an allocation exists is strongly NP-hard. /*Since EFX coincides with EQX for identical valuations, this means that EFX does not exist here either for arbitrary valuations.*/

== Incentives
Consider a setting with strategic agents. Here, an agent may misreport their valuations of goods in order to receive a better allocation. A _strategyproof_ allocation is one in which such misreporting is not beneficial for such an agent.

Strategyproof mechanisms may not always exist while fulfilling the desiderata. @caragiannis2009low show that in the context of strategic agents, an EFX allocation may not exist. @amanatidis2016truthful showed that no truthful mechanism could output an $alpha$-MMS allocation for $alpha > 2/m$. Indeed, overall truthful mechanisms @amanatidis2017truthful are incompatible allocations for general valuations.

For some restricted contexts, however, this can be done. Namely for binary valuations, computing an MNW and Lorenz-dominating allocation (and thus trivially a PO and EF1) allocation are strategyproof. @halpern2020fairdivisionbinaryvaluations@babaioff2021fair both develop algorithms to compute such allocations. They further show that under binary valuations, and even submodular valuations, a truthful mechanism exists to compute EFX allocations.

= Proportionality
One of the earliest notions of fairness it that of proportionality (PROP), where each good values their allocation at least $v_i (MMM/n)$. Clearly, like envy-freeness, it cannot be guaranteed in the case of discrete goods, so it is necessary to weaken it slightly by allowing the addition of goods. In proportionality up to 1 good (PROP1), there exists a good $g in MMM \\ X_i$ where $v_i (X_i union {g}) >= v_i (MMM/n)$. Similarly, in proportionality up to x (PROPx), all goods $g in MMM \\ X_i$ where $v_i (X_i union {g} >= v_i (MMM/n))$.

@conitzer2017fair showed that a PROP1 and PO allocation always exists and can be computed in polynomial time.

Still proportionality can be disappointing, as @aziz2020polynomial showed that even for simple cases, a PROPx allocation may not exist.

#theorem[A PROPx allocation may not always exist.
  #proof[
    Take 3 agents with identical valuations, and 5 goods. For all agents $i in NNN, v_i (g) = 3$ for $g in {g_1, ..., g_4}$ and $v_i (g_5) = 1$. No allocation admits a PROPx allocation.
  ]
]
An intermediary notion, PROPm has been shown to always exist and be computable in polynomial time. @baklanov2021propm defines the maximin good as $d(i) = max_(i' != i) min_(g in X_i) v_i (g)$ is the largest among the smallest goods in other agent's bundles. If adding this good's value to $i$'s utility is greater than or equal to $1/n$, i.e. $v_i (X_i) + d(i) >= 1/n$, then an allocation is PROPm.

= Fisher Markets
Although Nash Welfare is compelling, for its simultaneous EF1 + PO, it is also NP-hard to compute. One line of work attempting to simultaneous achieve fairness and efficiency tries to use the computation of market equilibria of fisher markets. This has also been used to compute approximate MNW, as mentioned previously. In the fisher market, goods are given prices $p = chevron.l p_1, ..., p_m chevron.r $, agents are given earnings $ell$, and monotone valuations, as defined above. These goods may be fractionally allocated with linear valuations, i.e. $v_i (X_i) = sum_(g in X_i) g times x_(i, g)$ where $x_(i, g)$ is the fraction of $g$ given to $i$.

A fisher market equilibrium is a fractional allocation in which
+ All goods $g in MMM$ allocated, i.e. that $sum_(i in NNN) x_(i, g) = 1$
+ For all agents $i in NNN, sum_(g in MMM) x_(i, g) times p_g = ell_i$
+ All agents only receive goods with maximum bang per buck, i.e. for all $i in NNN, g in MMM$, if $x_(i, g) > 0$, then $v_i (g/p_g) = "MBB"_i$

When $ell_i = 1$ for all agents $i$, this is called a Competitive Equilibrium for Equal Incomes (CEEI).

#openproblem[Can an exact CEEI be computed in polynomial time?]

Although this remains an open question, prior work seeks to compute an approximate $(1-epsilon)$-CEEI allocation. In such an allocation, agents may spend $ell_i (1 plus.minus epsilon)$ for some $epsilon in [0, 1]$.

Some work has been dedicated to computing approximations for CEEI. @boodaghians2022polynomial computes a $1-epsilon$-CEEI allocation with running time proportional to $1/epsilon$. @chaudhury2022existence gives an algorithm to compute a $(1-epsilon)$-CEEI in polynomial time for $epsilon = 1/(5n m)$.

A fractionally Pareto optimal allocation (fPO) is a fractional allocation which is not Pareto-dominated by another fractional allocation. It is clear that an fPO allocation is PO, but not necessarily vice versa.

CEEI is compelling in computing fPO. @mas1995microeconomic show that a CEEI is also fPO, and thus PO.

/*
= Santa Clause Problem
In the Santa Clause Problem the goal is to compute an allocation where the worst-off agent’s utility is maximized. Unlike the other notions of fairness in this survey, it developed independently from fair division. #text(red)[Although similar to MMS at first glance, it is based on a global notion of fairness like MNW CARDINAL MARA SETTING]. Computing such an allocation is also NP-hard @bezakova2005allocating@bouveret2005allocation, but is instead known within approximation algorithms. As an upper bound, the allocation cannot be computed by a factor better than $1/2$ @bezakova2005allocating show that . \@\@\@\@\@ Several works have sought to approximate the Santa Clause problem.

#theorem[$"MNW" => $ Santa Clause Problem Solution
  #proof[
    Assume for contradiction that there exists an allocation maximizing the geometric mean which does not maximize the utility of the worst-off agent. Observe that there must be an agent $i$ where $v_i (X_i)$.
  ]
]
*/

= Empirical Results
We can see the practical usefulness of these results from prior experimental results. For discrete fair division, @hosseini2023hideseekperceivedfairness collected a set of items, and computed an EF1 allocation among they agents. They then allowed agents to swap, and found that agents preferred to swap their bundles with other agents in $95%$ of allocations.

Another common approach to allowing measurement of goods is to give each agent some number of "points", and allow them to distribute the points among the goods based on their preference, which for can still maintain the fairness properties of MNW and EF1. In Spliddit, for 1000 points and 10 agents, an MNW (EF1 and PO) allocation is computed in less than 3 seconds @UnreasonableFairnessOfMNW@dupuis2009empirical.

= Discussion
In this survey, we discussed some of the most common notions of fairness. Although there are some further related notions of fairness, these are the most well-studied among the literature. We also showed that, under identical additive valuations, $"MNW" => "EQX"$.

Related to fair division, within economics and computation (EC), recent research has also studied computing market equilibria, beyond the Fisher Market. Other works in EC focus more on strategyproofness, studying voting and consensus procedures.
