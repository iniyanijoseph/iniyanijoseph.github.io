= Understanding Hop Reduction

In the single source shortest paths problem (SSSP), given a directed graph G = (V, E), a length function $ell : E -> RR$, and a source vertex $s$, you need to find either the distance from $s$ to every other vertex, or a negative cycle. Let the length of the shortest $s, t$ path be $d(s, t)$. 

The idea behind Ford's algorithm is to maintain the length of the shortest path between $s$ and $t$ using at most $k$ edges. We call this distance $d_k (s, t)$. In Ford's algorithm, for vertices $v in V\\{s}$, $d_0 (s, t) = infinity $. In round $t$ for vertices $u, v$, if $d_t (s, u) + ell(u, v) < d_(t-1) (s, v)$, then set $d_t(s, v) = d_t (s, u) + ell(u, v)$. This operation is called relaxation, and perform $n-1$ rounds (since the length of the shortest path is at most $n-1$ if no negative cycles exist. The correctness of this algorithm can be shown easily using induction. This takes $O(m n)$ time.

Implicitly, this relies on the fact that any $(u, v)$ subpath within the shortest $(s, t)$ path is also minimum (cut-and-paste argument). Because $d(s, v) >= min_(u in V) d(u, v)$, one can compute a function $phi:v-> RR$ which induces edge lengths $ell_phi (u, v) = phi(u)+ell(u, v) - phi(v)$ and distance function $d_phi (u, v)$. If $ell_phi (u ,v) >= 0$, then we call the edge $(u, v)$ _neutralized_. For this distance function, $d_phi (s, t) = phi(s) + d(s, t) - phi(t)$. If $phi$ induces no new negative edges, it is called _valid_.

Johnson observed that setting $phi(v)=min_(u in V) d(u, v)$ neutralizes all edges. Note here that $d(v, v) = 0$, so $phi(v)$ must be $<= 0$.Assume for contradiction that an edge $u, v$ is not neutralized. This implies that $ell_phi (u, v) = phi(u) + ell(u, v) - phi(v) < 0$. Rearranging, we get $phi(u) + ell(u, v) < phi(v)$, however this contradicts that $phi(v)$ is the shortest path, since the shortest path from some vertex to $u$ plus the edge $(u, v)$ is less than $phi(v)$. Note that $v$ is not used in this path if there are no negative cycles in the graph.

Now, the SSSP problem can be simplified. Rather than compute all paths from $s$ to $v$ for fixed $s$, we can instead compute the shortest path from any vertex to $v$.

If a vertex $x$ can be reached using a negative length path, we call it negatively reachable, and $phi(x) = 0$. Similarly, if vertex $x$ is not negatively reachable, we call it negatively unreachable. One case where this is trivially true is if $forall(e in E) ell(e) >= 0$. In this case, running Dijkstra's algorithm is enough to compute all edge lengths.

In general, we can think of the graph as sets of negatively reachable vertices connected by positive paths through negatively unreachable vertices. Since the negatively unreachable vertices have $phi = 0$, we only need to find and neutralize negatively reachable vertices. By doing so, we neutralize a vertex faster than $tilde O (m)$.

In the shortest path, there can be at most $n-1$ negative edges if there are no negative cycles. 

To do this, we compute a set of valid potentials, then Dijkstra's algorithm once on the reweighted edges.

From this point on, the recent improvements of Bellman-Ford focus on finding valid potentials efficiently.

== LLRZ 

On a high level, this algorithm works by first sparsifying the graph such that shortest paths are preserved with high probability and then recursively removing the number of negative weight edges along shortest paths. To do this, the algorithm starts at a negative vertex $v$ and computes Dijkstra's in both direction to find all negative weight paths, where the only negative vertex reached is $v$. What is more important for the runtime is that $abs(abs(V_r^"in") - abs(V_r^"out")) <= 1$. This achieves $O(n^2.5)$

Here, we can do something similar to hopefully remove the $sqrt(n)$ factor. It also helps reveal some of the structure of negative weight shortest paths with real edges.

+ Compute 1-hop negative reach from all negative vertices.
  +For a negative vertex $u$, this returns the distance to a vertex within the one-hop negative reach called $v$ with value $d^- (u, v) < 0$
+ Make a vertex $u'$ and create an edge $(u', v)$ for all $v$ in the one-hop negative reach, and an edge $(u, u')$
+ Let $w(u, u') = min_v d(u, v)$. Then set all edges $(u', v)$ to $d(u', v) - w(u, u')$. This creates a directed tree which overlaps.
#text(red)[Stitching this together needs to be done more carefully to preserve the other shortest paths while still shrinking the graph by $O(n)$]

The time complexity of doing this is $O(abs(U)$ Dijkstra computations. With each Dijkstra computation, the graph shrinks by $O(n)$, so you get $sum_(i=0)^abs(U) (n+m-n i)log(n)$

Now, collect all vertices not covered by a tree and contract them into a single vertex. All negative cycles will alternate between negative and positive regions. The depth of any negative region is at most $log(n)$. 
