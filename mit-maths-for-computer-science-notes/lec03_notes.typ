#set document(title: "Lecture 03 Notes — Casework and Strong Induction")
#set page(
  paper: "us-letter",
  margin: (x: 1.1in, y: 1in),
  header: [
    #set text(size: 9pt, fill: luma(130))
    #grid(columns: (1fr, 1fr),
      [6.1200J · Spring 2024],
      align(right)[Lecture 03: Casework and Strong Induction]
    )
    #line(length: 100%, stroke: 0.4pt + luma(200))
  ],
  footer: [
    #set text(size: 9pt, fill: luma(130))
    #line(length: 100%, stroke: 0.4pt + luma(200))
    #align(center)[#counter(page).display("1")]
  ]
)
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.7em, spacing: 1em)

#let accent  = rgb("#1a56db")
#let note-bg = rgb("#f0f4ff")
#let warn-bg = rgb("#fff8e1")
#let ok-bg   = rgb("#f0fff4")
#let red-bg  = rgb("#fff5f5")
#let red-acc = rgb("#b91c1c")
#let box-rule = 0.5pt + luma(200)

#let defbox(title, body) = block(
  width: 100%, inset: (x: 12pt, y: 9pt),
  stroke: (left: 3pt + accent, rest: box-rule),
  fill: note-bg, radius: (right: 4pt), below: 0.9em,
)[
  #text(weight: "bold", fill: accent, size: 10pt)[#title]
  #v(3pt)
  #body
]

#let notebox(body) = block(
  width: 100%, inset: (x: 12pt, y: 9pt),
  stroke: (left: 3pt + rgb("#f59e0b"), rest: box-rule),
  fill: warn-bg, radius: (right: 4pt), below: 0.9em,
)[
  #text(weight: "bold", size: 10pt, fill: rgb("#b45309"))[⚠ Note]
  #v(3pt)
  #body
]

#let keybox(body) = block(
  width: 100%, inset: (x: 12pt, y: 9pt),
  stroke: (left: 3pt + rgb("#16a34a"), rest: box-rule),
  fill: ok-bg, radius: (right: 4pt), below: 0.9em,
)[
  #text(weight: "bold", size: 10pt, fill: rgb("#15803d"))[✓ Key Takeaway]
  #v(3pt)
  #body
]

#let warnbox(body) = block(
  width: 100%, inset: (x: 12pt, y: 9pt),
  stroke: (left: 3pt + red-acc, rest: box-rule),
  fill: red-bg, radius: (right: 4pt), below: 0.9em,
)[
  #text(weight: "bold", size: 10pt, fill: red-acc)[✗ Common Mistake]
  #v(3pt)
  #body
]

#let proofbox(title, body) = block(
  width: 100%, inset: (x: 12pt, y: 9pt),
  stroke: box-rule, fill: luma(252),
  radius: 4pt, below: 0.9em,
)[
  #text(weight: "bold", size: 10pt)[#title]
  #v(4pt)
  #body
]

#show heading.where(level: 1): it => {
  v(1.4em)
  block[
    #text(size: 14pt, weight: "bold", fill: accent)[§ #it.body]
    #v(1pt)
    #line(length: 100%, stroke: 0.5pt + accent)
  ]
  v(0.5em)
}
#show heading.where(level: 2): it => {
  v(0.9em)
  text(size: 12pt, weight: "bold")[#it.body]
  v(0.3em)
}
#show heading.where(level: 3): it => {
  v(0.6em)
  text(size: 11pt, weight: "bold", style: "italic")[#it.body]
  v(0.2em)
}

#v(1em)
#align(center)[
  #text(size: 20pt, weight: "bold")[Lecture 03 — Study Notes]
  #v(4pt)
  #text(size: 13pt, fill: luma(80))[Casework and Strong Induction]
  #v(4pt)
  #text(size: 10pt, fill: luma(140))[MIT 6.1200J / 18.062J · Spring 2024]
]
#v(1.4em)
#line(length: 100%, stroke: 1pt + luma(180))
#v(1em)

= Proof Techniques — Running Summary

Before introducing the new techniques, here is every method covered so far.

#block(inset: (x: 12pt, y: 8pt), stroke: box-rule, radius: 4pt)[
#table(
  columns: (auto, auto, 1fr),
  stroke: none, inset: (x: 8pt, y: 5pt),
  fill: (c,r) => if r == 0 { luma(235) } else if calc.odd(r) { luma(250) } else { white },
  [*Technique*],       [*Theorem shape*],          [*What you actually do*],
  [Example],           [$exists x. P(x)$],          [Exhibit a specific $x^*$; verify $P(x^*)$],
  [Instantiation],     [$forall x. P(x)$],          [Introduce arbitrary $x$; prove $P(x)$],
  [Direct],            [$P => Q$],                  [Assume $P$; derive $Q$],
  [Contrapositive],    [$P => Q$],                  [Assume $not Q$; derive $not P$],
  [Contradiction],     [$P$],                       [Assume $not P$; derive $Q and not Q$],
  [Induction],         [$forall n in NN. P(n)$],    [Base case $P(0)$ + step $P(n) => P(n+1)$],
  [*Cases* (new)],     [any $P$],                   [Split into exhaustive cases; prove $P$ in each],
  [*Strong induction*],[  $forall n in NN. P(n)$],  [Base case + step assumes all $P(0)..P(n)$],
)
]

= Proof by Cases

#defbox("Core Idea — Case Analysis")[
  For any proposition $C$, the statement $C or not C$ is a *tautology* — it is
  always true regardless of what $C$ says.

  Therefore:
  $ P equiv ("True" => P) equiv ((C or not C) => P) equiv (C => P) and (not C => P) $

  *To prove $P$, it suffices to prove it under every possible case of $C$.*
  As long as the cases are *exhaustive* (cover all possibilities) and each
  case individually implies $P$, the proof is complete.
]

== Two-Case Template

#proofbox("Template: Proof by Cases (2 cases)")[
  _Theorem:_ $P$ is true.

  _Proof._ Proof by cases on the truth value of $C$.

  - *Case 1* ($C$ is true): [show $P$ using $C$]. ✓
  - *Case 2* ($C$ is false): [show $P$ using $not C$]. ✓

  Since $C or not C$ is a tautology, these cases are exhaustive.
  $P$ holds in all cases, so $P$ is true. $square$
]

== Worked Example: A Tautology About Implication

*Theorem.* $S := (A => B) or (B => C)$ is a tautology.

Why is this true? It feels surprising. If $B$ is in the "middle", either the left
implication is forcing something into $B$, or $B$ is forcing something out — one of
those must work. Cases on $B$ make it precise:

#proofbox("Proof")[
  *Case 1* ($B$ is true): $A => B$ is true (conclusion is true). So $S$ is true. ✓

  *Case 2* ($B$ is false): $B => C$ is true (hypothesis is false). So $S$ is true. ✓

  These cases are exhaustive ($B$ is either true or false), so $S$ is always true. $square$
]

#keybox[
  The right variable to case-split on is the one that *simplifies the most*.
  Here, splitting on $B$ (not $A$ or $C$) immediately resolves both implications.
]

== Ramsey Theory: 3 Friends or 3 Strangers

This is a deeper example using *nested cases* (cases within cases).

*Setup:* 6 people; each pair is either friends or strangers (no partial friendship).
Friendship is symmetric.

*Theorem.* Among any 6 people there always exist either 3 mutual friends or 3 mutual
strangers.

#proofbox("Proof — Nested Cases")[
  Pick any person $p$. The other 5 people are each friends or strangers with $p$.

  *Case 1* — $p$ has $>= 3$ friends: pick three of them, call them $q, r, s$.

  #block(inset: (left: 1.5em))[
  *Sub-case 1a* — some pair among $q,r,s$ are friends:
  that pair + $p$ = 3 mutual friends. ✓

  *Sub-case 1b* — no pair among $q,r,s$ are friends:
  $q, r, s$ themselves = 3 mutual strangers. ✓
  ]

  *Case 2* — $p$ has $< 3$ friends, i.e. $>= 3$ strangers:
  Identical argument with "friends" and "strangers" swapped. ✓

  All cases covered; the claim holds. $square$
]

#notebox[
  *Why 6 people and not 5?* With 5 people a counterexample exists (a 5-cycle of
  friendship has no 3 mutual friends or strangers). The theorem is tight.

  This result establishes $R(3,3) <= 6$. Combined with the 5-person counterexample,
  $R(3,3) = 6$ exactly.
]

== Ramsey Numbers

The proof above belongs to *Ramsey Theory*, which studies how large a structure
must be before a certain pattern is guaranteed to appear.

$R(f, s)$ = minimum number of people to guarantee $f$ mutual friends *or* $s$ mutual
strangers.

#block(inset: (x: 12pt, y: 8pt), stroke: box-rule, radius: 4pt)[
#table(
  columns: (auto, auto, auto),
  stroke: none, inset: (x: 10pt, y: 5pt),
  fill: (c,r) => if r == 0 { luma(235) } else { white },
  [*Value*],      [*Known?*],   [*Status*],
  [$R(3,3) = 6$], [Exactly],   [Proved],
  [$R(4,4) = 18$],[Exactly],   [Proved],
  [$R(5,5)$],     [$43..48$],  [Bounds known, exact value unknown],
)
]

== General $k$-Case Template

When there are more than two cases, the tautology is $C_1 or C_2 or dots.c or C_k$.

#proofbox("Template: k Cases")[
  _Proof._ Proof by cases.

  - *Case 1* ($C_1$): $P$ holds because ... ✓
  - *Case 2* ($C_2$): $P$ holds because ... ✓
  - $dots.c$
  - *Case $k$* ($C_k$): $P$ holds because ... ✓

  These $k$ cases are exhaustive because $C_1 or dots.c or C_k$ is a tautology
  [explain why]. Therefore $P$ is true. $square$
]

*Famous instance — Four Color Theorem:* any planar map can be 4-colored with no two
adjacent regions sharing a color. The 1976 Appel–Haken proof reduced the problem to
1834 cases all verified by computer (later simplified to 633 cases in 1996, and formally
verified in Coq in 2005). This was the first major theorem proved with computer
assistance — and was controversial for that reason.

= Strong Induction

== Motivation: The Limitation of Regular Induction

In ordinary induction the inductive step gives you *only $P(n)$* to work with when
proving $P(n+1)$. Sometimes $P(n+1)$ naturally depends on earlier values — say
$P(n-1)$ or $P(n/2)$ — and the regular hypothesis is too narrow.

#defbox("Theorem — Strong Induction")[
  Let $P(n)$ be a predicate on $NN$. If:

  + *Base case:* $P(0)$ is true.
  + *Strong inductive step:* For all $n in NN$,
    $ P(0) and P(1) and dots.c and P(n) => P(n+1) $

  Then $forall n in NN, P(n)$.

  The inductive step may assume *every* $P(m)$ for $m <= n$, not just $P(n)$.
]

== Is Strong Induction Actually Stronger?

No. Strong induction and regular induction are *logically equivalent*. Anything
provable by one is provable by the other.

Intuitively: if $P(n) => P(n+1)$, then certainly
$P(0) and dots.c and P(n) => P(n+1)$ (a weaker hypothesis still implies the same
conclusion). So the strong step subsumes the regular step.

Going the other way: you can prove strong induction *from* the regular induction axiom
by defining a new predicate $Q(n) := P(0) and dots.c and P(n)$ and inducting on $Q$.

#keybox[
  Use *strong* induction when the proof of $P(n+1)$ needs $P(m)$ for some
  $m < n$ (not just $m = n$). The template is otherwise identical.
]

== Template

#proofbox("Template: Proof by Strong Induction")[
  _Proof._ Let $P(n)$ be [predicate]. We prove $forall n in NN, P(n)$ by strong
  induction.

  *Base case* ($n = 0$): [verify $P(0)$ directly]. ✓

  *Strong inductive step*: Let $n in NN$ and assume $P(m)$ is true for all $m <= n$
  (strong induction hypothesis). We show $P(n+1)$.

  [argument using $P(m)$ for various $m <= n$]

  Therefore $P(n+1)$ holds. By strong induction, $forall n, P(n)$. $square$
]

== Example 1: Block-Splitting Game

*Setup:* Start with a stack of $n$ blocks. Repeatedly split any stack into two
non-empty stacks; score the *product* of their sizes. Game ends when all stacks
have size 1.

*Surprising fact:* No matter how you split, the total score is always the same.

*Theorem.* Any strategy starting from $n$ blocks scores exactly $display(frac(n(n-1), 2))$ points.

Verify on $n = 8$: greedy strategy scores $7+6+5+4+3+2+1 = 28 = 8 dot 7 / 2$. ✓

#proofbox("Proof by Strong Induction")[
  Let $P(n)$: any strategy on $n$ blocks scores $n(n-1)/2$. Prove for all $n >= 1$.

  *Base case* ($n = 1$): no moves possible, score = 0 = $1(0)/2$. ✓

  *Strong step*: Assume $P(m)$ for all $1 <= m <= n$. Start with $n+1$ blocks.

  First split: pile $n+1$ into $m_1$ and $m_2$ (both $>= 1$, sum $= n+1$).
  Score from this split: $m_1 dot m_2$.

  Each sub-pile is then split independently. Since $m_1, m_2 <= n$, the strong IH
  applies:
  $
  F(n+1) = m_1 m_2 + frac(m_1(m_1-1), 2) + frac(m_2(m_2-1), 2)
  $

  Simplify using $m_1 + m_2 = n+1$:
  $
  &= frac(2m_1 m_2 + m_1^2 - m_1 + m_2^2 - m_2, 2) \
  &= frac((m_1+m_2)^2 - (m_1+m_2), 2) \
  &= frac((n+1)n, 2) quad square
  $
]

#notebox[
  *Why strong induction?* The first split creates piles of size $m_1$ and $m_2$,
  which could be *any* values from 1 to $n$. Regular induction only gives you
  $P(n)$; you need the full $P(m_1)$ and $P(m_2)$ for arbitrary $m_1, m_2 <= n$.
]

*What makes this elegant:* the score is *strategy-independent*. It doesn't matter
whether you split evenly, greedily, or randomly — the total is always $n(n-1)/2$.
The induction proof reveals *why*: each split's contribution telescopes perfectly.

== Example 2: Beats Ordering in Tournaments

*Setup:* $n$ players in a round-robin tournament (everyone plays everyone, no ties).
A *beats ordering* is a sequence $p_1, p_2, dots, p_n$ where $p_i$ beat $p_(i+1)$
for every consecutive pair.

*Claim.* A beats ordering always exists, for any tournament result.

#proofbox("Proof by Strong Induction")[
  $P(n)$: every $n$-player tournament has a beats ordering.

  *Base case* ($n = 0$): empty list is a valid beats ordering. ✓

  *Strong step*: Assume $P(m)$ for all $m <= n$. Given $n+1$ players.

  Pick any player $p'$. Partition the rest into:
  - $W$ = players who *beat* $p'$
  - $L$ = players who *lost to* $p'$

  Both $|W|, |L| <= n$, so the strong IH applies to each group.
  Generate a beats ordering for $W$: $p_1, dots, p_(|W|)$.
  Generate a beats ordering for $L$: $q_1, dots, q_(|L|)$.

  Claim: $p_1, dots, p_(|W|), p', q_1, dots, q_(|L|)$ is a beats ordering.

  Check every consecutive pair:
  - Within $W$-segment and $L$-segment: valid by the sub-orderings.
  - $p_(|W|)$ vs $p'$: $p_(|W|) in W$, so $p_(|W|)$ beat $p'$. ✓
  - $p'$ vs $q_1$: $q_1 in L$, so $p'$ beat $q_1$. ✓

  All pairs check out. By strong induction, $P(n)$ holds for all $n$. $square$
]

#keybox[
  *Why strong induction?* After splitting off $p'$, you are left with sets $W$ and
  $L$ of *arbitrary* sizes up to $n$. Regular induction only gives $P(n)$; you need
  $P(|W|)$ and $P(|L|)$ for whatever sizes those happen to be.

  *The construction is also an algorithm:* recursively sort winners, place $p'$,
  recursively sort losers. This is essentially *insertion sort*.
]

= Choosing Between Regular and Strong Induction

#block(inset: (x: 12pt, y: 8pt), stroke: box-rule, radius: 4pt)[
#table(
  columns: (1fr, 1fr),
  stroke: none, inset: (x: 10pt, y: 7pt),
  fill: (c,r) => if r == 0 { luma(235) } else { white },
  [*Use regular induction when...*], [*Use strong induction when...*],
  [The proof of $P(n+1)$ uses only $P(n)$],
  [The proof uses $P(m)$ for $m < n$ in general],
  [The recurrence is of the form $f(n+1) = g(f(n))$],
  [The recurrence splits into sub-problems of varying size],
  [E.g. sum formulas, simple sequences],
  [E.g. game arguments, recursive algorithms, any divide-and-conquer],
)
]

= Common Mistakes

#list(
  [*Non-exhaustive cases* — if your case split misses some scenarios, the proof
   has a gap. Always verify that the cases together cover every possibility.],

  [*Overlapping cases without care* — overlapping cases are fine as long as $P$
   holds in every case. But if your argument in Case 1 secretly relies on Case 2
   being false, you have a problem.],

  [*Circular case analysis* — in the Ramsey argument, the sub-cases within
   Case 1 must each be proved from scratch, not by assuming the other sub-case
   is handled.],

  [*Forgetting base case in strong induction* — the base case is still required.
   The strong IH gives you $P(0) and dots and P(n)$ in the step, but $P(0)$
   has to be established independently first.],

  [*Applying strong IH to $n+1$* — in the strong inductive step you may assume
   $P(m)$ for $m <= n$ only, never for $m = n+1$ (that is what you are trying
   to prove).],

  [*Confusing "strong is more powerful" with "strong is different"* — strong and
   regular induction prove exactly the same class of theorems. Choosing strong
   is a matter of *convenience*, not logical necessity.],
)
