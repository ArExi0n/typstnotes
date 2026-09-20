#set document(title: "Lecture 02 Notes — Contradiction and Induction")
#set page(
  paper: "us-letter",
  margin: (x: 1.1in, y: 1in),
  fill: rgb("#121212"),
  header: [
    #set text(size: 9pt, fill: luma(180))
    #grid(columns: (1fr, 1fr),
    [6.1200J · Spring 2024],
    align(right)[Lecture 02: Contradiction and Induction]
  )
  #line(length: 100%, stroke: 0.4pt + luma(120))
],
footer: [
  #set text(size: 9pt, fill: luma(180))
  #line(length: 100%, stroke: 0.4pt + luma(120))
  #align(center)[#context[counter(page).display("1")]]
]
)
#set text(font: "New Computer Modern", size: 11pt, fill: luma(230))
#set par(justify: true, leading: 0.7em, spacing: 1em)

#let accent   = rgb("#8ab4f8")
#let note-bg  = rgb("#1a2233")
#let warn-bg  = rgb("#2a2215")
#let ok-bg    = rgb("#142514")
#let red-bg   = rgb("#2a1515")
#let red-acc  = rgb("#f28b82")
#let box-rule = 0.5pt + luma(80)

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
  stroke: (left: 3pt + rgb("#fdd663"), rest: box-rule),
  fill: warn-bg, radius: (right: 4pt), below: 0.9em,
)[
  #text(weight: "bold", size: 10pt, fill: rgb("#fdd663"))[Note]
  #v(3pt)
  #body
]

#let keybox(body) = block(
  width: 100%, inset: (x: 12pt, y: 9pt),
  stroke: (left: 3pt + rgb("#81c995"), rest: box-rule),
  fill: ok-bg, radius: (right: 4pt), below: 0.9em,
)[
  #text(weight: "bold", size: 10pt, fill: rgb("#81c995"))[Key Takeaway]
  #v(3pt)
  #body
]

#let warnbox(body) = block(
  width: 100%, inset: (x: 12pt, y: 9pt),
  stroke: (left: 3pt + red-acc, rest: box-rule),
  fill: red-bg, radius: (right: 4pt), below: 0.9em,
)[
  #text(weight: "bold", size: 10pt, fill: red-acc)[Common Mistake]
  #v(3pt)
  #body
]

#let proofbox(title, body) = block(
  width: 100%, inset: (x: 12pt, y: 9pt),
  stroke: box-rule, fill: luma(30),
  radius: 4pt, below: 0.9em,
)[
  #text(weight: "bold", size: 10pt)[#title]
  #v(4pt)
  #body
]

#show heading.where(level: 1): it => {
  v(1.4em)
  block[
    #text(size: 14pt, weight: "bold", fill: accent)[#it.body]
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
  #text(size: 20pt, weight: "bold")[Lecture 02 — Study Notes]
  #v(4pt)
  #text(size: 13pt, fill: luma(200))[Contradiction and Induction]
  #v(4pt)
  #text(size: 10pt, fill: luma(170))[MIT 6.1200J / 18.062J · Spring 2024]
]
#v(1.4em)
#line(length: 100%, stroke: 1pt + luma(100))
#v(1em)

= Logical Deduction

This is the *third and most important* component of a proof. It deals with
the _structure_ of the argument — how each step connects to the next.

#defbox("Definition — Inference Rule")[
  An *inference rule* is a rule for combining true propositions to form
  other true propositions.

  An inference rule is the machine that drives every step of a proof forward.
]

== Key Inference Rules

Every rule below can be verified with a truth table.

#block(inset: (x: 12pt, y: 9pt), stroke: box-rule, radius: 4pt)[
  *Modus Ponens* — "the mode of putting" \
  If $P => Q$ is true, and $P$ is true, then $Q$ must be true.

  $ frac(P => Q \; \; \; P, Q) $

  Written equivalently as: $((P => Q)$ and $P) => Q$, or $P => Q, P tack.r Q$.
]

#v(0.5em)

#block(inset: (x: 12pt, y: 9pt), stroke: box-rule, radius: 4pt)[
  *Modus Tollens* — "the mode of taking" \
  $((P => Q)$ and not $Q) =>$ not $P$

  If the conclusion is false, the hypothesis must also be false.
  This is just the contrapositive applied as an inference rule.
]

#v(0.5em)

#block(inset: (x: 12pt, y: 9pt), stroke: box-rule, radius: 4pt)[
  *Hypothetical Syllogism* (chain rule) \
  $((P => Q)$ and $(Q => R)) => (P => R)$

  Implications chain: if $P$ leads to $Q$, and $Q$ leads to $R$, then $P$ leads to $R$.
]

#v(0.5em)

#block(inset: (x: 12pt, y: 9pt), stroke: box-rule, radius: 4pt)[
  *Proof by Contradiction Rule* \
  $(($not $P) => "false") => P$

  If assuming NOT $P$ leads to a contradiction, then $P$ must be true.
  This is the formal basis for the entire contradiction technique.
]

== Proof Standards for This Class

#table(
  columns: (auto, 1fr),
  stroke: none, inset: (x: 8pt, y: 5pt),
  fill: (c,r) => if r == 0 { luma(50) } else if calc.odd(r) { luma(35) } else { luma(22) },
  [*Rule*], [*What it means*],
  [Clear steps],    [Every step must follow logically from the previous],
  [Cite prior work],[State which already-proved propositions you are using],
  [No leaps],       [Do not skip steps or assume the reader "sees it"],
  [No intimidation],["$P$ is obvious" or "Clearly $Q$" is not a proof],
  [No circular],    ["I already knew $P$, so it's an axiom" is invalid when asked to prove $P$],
)

#notebox[
  You do NOT need to cite an inference rule at every step, and you do NOT
  need to specify precisely which axioms you use — basic math from before
  this class is fair game. The key is logical clarity, not formalism overload.
]

= Fundamental Proof Techniques

== Proving Existence

To prove $exists x in S space P(x)$, find *one concrete example* that works.

#proofbox("Template: Existence Proof")[
  _Proof._ We'll show that $x = [italic("specific value")]$ works.
  Indeed, for this choice of $x$, $P(x)$ is true because $[italic("reasons")]$. $square$
]

*Example:* Prove $exists n in NN space n >= 10$ and isPrime$(n)$.

_Proof._ $n = 17$ works: 17 is prime and $17 >= 10$. $square$

#keybox[
  For existence proofs, one valid example is a *complete* proof.
  You do not need to find all examples, just one.
]

== Proving Universality

To prove $forall x in S space P(x)$, you cannot just check examples.
Instead: introduce a *generic, arbitrary* element $x in S$ — one about
which you make *no special assumptions* — and prove $P(x)$ holds for it.

#proofbox("Template: Universal Proof")[
  _Proof._ Assume $x$ is an arbitrary element of $S$.
  Then $P(x)$ is true because $[italic("reasons")]$. $square$
]

*Example:* Prove $forall x in RR space x^2 - 6x > -10$.

_Proof._ Let $x$ be an arbitrary real number. Then:
$ x^2 - 6x + 9 = (x-3)^2 >= 0 $
$ therefore x^2 - 6x = (x-3)^2 - 9 >= -9 > -10 quad square $

#notebox[
  The word *arbitrary* is key. It means: "I pick $x$ knowing only that
  $x in S$." Any proof that works for an arbitrary $x$ works for every $x$.
]

== Proof of an Implication: Direct Method

To prove $P => Q$: *assume $P$ is true*, then *derive $Q$*.

#proofbox("Template: Direct Proof")[
  _Proof._ Assume $P$ is true. Then $Q$ is also true because
  $[italic("reasons")]$. $square$
]

*Example:* If $n$ is a multiple of 10, then $n$ is a multiple of 2.

_Proof._ Assume $n = 10k$ for some integer $k$. Then $n = 2(5k)$,
so $n$ is 2 times the integer $5k$, i.e. a multiple of 2. $square$

== Proof of an Implication: Contrapositive Method

$P => Q$ is *logically equivalent* to (not $Q$) $=>$ (not $P$).
When the contrapositive is easier to prove directly, use it.

#proofbox("Template: Contrapositive Proof")[
  _Proof._ We prove the contrapositive. Assume not $Q$ is true.
  Then not $P$ is true because $[italic("reasons")]$. $square$
]

*Example:* For integer $n$: ($n^2$ is even) $=>$ ($n$ is even).

_Proof._ Prove contrapositive: ($n$ is odd) $=>$ ($n^2$ is odd). \
Assume $n = 2k+1$. Then:
$ n^2 = (2k+1)^2 = 4k^2 + 4k + 1 = 2(2k^2+2k)+1 $
which is odd. $square$

#keybox[
  *When to use contrapositive:* when the original "assume $P$, derive $Q$"
  direction is hard to see, but "assume not $Q$, derive not $P$" is natural.
  Both prove the same thing.
]

= Proof by Contradiction

#defbox("Definition — Proof by Contradiction")[
  To prove $P$, assume not $P$ (the *opposite* of what you want to prove),
  and derive a *logical impossibility* — a statement that is always false
  (a *contradiction*). Since the only thing you assumed was not $P$, the
  assumption must be wrong, so $P$ must be true.

  Formally: prove (not $P$) $=>$ false. By the inference rule, this gives $P$.
]

Also called an *indirect proof*.

== The Classic Example: $sqrt(2)$ is Irrational

*Theorem.* $sqrt(2) in.not QQ$ (i.e. $sqrt(2)$ is irrational).

#proofbox("Proof by Contradiction")[
  *Step 1 — Assume the opposite.* \
  Suppose $sqrt(2) in QQ$. Then we can write $sqrt(2) = a/b$ where
  $a, b in ZZ$ and $gcd(a,b) = 1$ (fraction in lowest terms).

  *Step 2 — Derive consequences.* \
  $ a/b = sqrt(2) quad => quad a = b sqrt(2) quad => quad a^2 = 2b^2 $

  So $a^2$ is even. By our lemma (even square $=>$ even root), $a$ itself is even.
  Write $a = 2c$ for some integer $c$.

  *Step 3 — Push further.* \
  $ a^2 = 2b^2 quad => quad (2c)^2 = 2b^2 quad => quad 4c^2 = 2b^2 quad => quad 2c^2 = b^2 $

  So $b^2$ is even, meaning $b$ is also even.

  *Step 4 — Contradiction.* \
  Both $a$ and $b$ are even, meaning they share a factor of 2. But we
  assumed $gcd(a, b) = 1$. *Contradiction* ($=><=$ or $bot$). $square$
]

#keybox[
  The structure is always the same:
  + Assume NOT $P$
  + Do valid algebra/logic from that assumption
  + Arrive at something that is *provably false*
  + Conclude $P$ must be true

  The contradiction does the work — you don't need to "find" truth directly.
]

#notebox[
  A useful lemma used above (and worth remembering):
  *If $n^2$ is even, then $n$ is even.* \
  Proof via contrapositive: if $n$ is odd, $n^2$ is odd (shown in §2.4).
]

= Proof Outlining

Before writing a proof, *outline its structure first*. The form of the
theorem mechanically tells you what your proof needs to contain — even
before you understand the specific mathematical content.

#warnbox[
  The most common mistake: diving into *how* to prove something before
  figuring out *what* you actually need to prove. Outlining prevents this.
]

== Mechanical Decomposition Rules

#table(
  columns: (auto, 1fr),
  stroke: none, inset: (x: 8pt, y: 6pt),
  fill: (c,r) => if r == 0 { luma(50) } else if calc.odd(r) { luma(35) } else { luma(22) },
  [*Theorem form*],           [*What your proof must contain*],
  [$forall n in S space P(n)$],
  [Introduce arbitrary $n in S$, then prove $P(n)$],
  [$exists n in S space P(n)$],
  [Find a specific $n$ and verify $P(n)$],
  [$P => Q$],
  [Assume $P$, derive $Q$  — or prove contrapositive],
  [$P <=> Q$],
  [Two sub-proofs: $(P => Q)$ and $(Q => P)$],
  [not $P$],
  [Consider contradiction: assume $P$, derive false],
)

== Example Outline (with Nonsense Terms)

Theorem: "For every integer $n$, $n$ is #underline[fooish] iff $n+1$ is #underline[barsome]."

Notice: we have $forall n in ZZ$ and an iff. The outline writes itself:

#block(inset: (x: 12pt, y: 9pt), stroke: box-rule, radius: 4pt)[
  *Outline Step 1* — handle the $forall$: \
  Suppose $n$ is any integer; must prove $F(n) <=> B(n+1)$.

  *Outline Step 2* — handle the iff: \
  Must show $F(n) => B(n+1)$ and $B(n+1) => F(n)$.

  *Outline Step 3* — handle each implication: \
- To prove $F(n) => B(n+1)$: assume $F(n)$. [TODO: derive $B(n+1)$.]
- To prove $B(n+1) => F(n)$: assume $B(n+1)$. [TODO: derive $F(n)$.]
]

#keybox[
  You can build this entire skeleton without knowing what "fooish" or
  "barsome" mean. The *structure* of a proof is determined by the
  *logical form* of the statement, not its mathematical content.
]

= Proof by Induction

The most common and most powerful proof technique in computer science.
Used whenever you need to prove a statement holds for *all natural numbers*
(or all integers $>= k$, or all elements of a recursively defined set).

== The Induction Axiom

#defbox("Axiom — Mathematical Induction")[
  Let $P(n)$ be a predicate defined for $n in NN$.

  If both of the following hold:
- *Base case:* $P(0)$ is true
- *Inductive step:* $forall n in NN, P(n) => P(n+1)$

Then: $forall n in NN, P(n)$ is true.
]

== Why Induction Works — Intuition

Think of an infinite chain of dominoes:

#block(inset: (x: 12pt, y: 9pt), stroke: box-rule, radius: 4pt)[
  You know:
- The first domino falls (#text[base case]: $P(0)$)
- Each falling domino knocks over the next (#text[inductive step]: $P(n) => P(n+1)$)

Conclusion: *all* dominoes fall ($forall n, P(n)$).
]

Formally, from $P(0)$ and $P(0) => P(1)$, we get $P(1)$.
From $P(1)$ and $P(1) => P(2)$, we get $P(2)$. And so on forever.
The induction axiom packages this infinite chain into one finite statement.

== Standard Template

#proofbox("Template: Proof by Induction")[
  _Proof._ Let $P(n)$ be [state the predicate]. We prove $forall n in NN, P(n)$ by induction on $n$.

  *Base case* ($n = 0$): [verify $P(0)$ directly]. $square$

  *Inductive step*: Let $n in NN$ and assume $P(n)$ is true
  (this assumption is the *induction hypothesis*). We must show $P(n+1)$.

  [algebra/logic using the induction hypothesis]

  Therefore $P(n+1)$ holds. By induction, $P(n)$ is true for all $n in NN$. $square$
]

== Worked Example: Gauss Sum Formula

*Theorem.* $forall n in NN, space 1 + 2 + 3 + dots.c + n = display(frac(n(n+1), 2))$

#proofbox("Full Induction Proof")[
  Let $P(n)$ be: $1 + 2 + dots.c + n = n(n+1)/2$.

  *Base case* ($n = 0$): LHS $= 0$, RHS $= (0)(1)/2 = 0$. Equal. ✓

  *Inductive step*: Assume $P(n)$: $1+2+dots.c+n = n(n+1)/2$. Show $P(n+1)$:
  $1+2+dots.c+n+(n+1) = (n+1)(n+2)/2$.

  Starting from the LHS of $P(n+1)$:
  $ (1+2+dots.c+n)+(n+1) = frac(n(n+1),2) + (n+1) $
  (used IH on the parenthesised sum)
  $ = (n+1) dot (n/2 + 1) = (n+1) dot frac(n+2, 2) $

  This is exactly $(n+1)(n+2)/2$, which is the RHS of $P(n+1)$. ✓

  By induction, $P(n)$ holds for all $n in NN$. $square$
]

== Strengthening the Induction Hypothesis

Sometimes the predicate you set out to prove is *too weak* to induct on.
The inductive step can't go through because the hypothesis doesn't give
you enough to work with.

*Counterintuitive fix:* prove a *stronger* statement. A stronger $P(n)$ is
harder to establish in the base case, but gives you *more to assume* in
the inductive step — which often more than compensates.

=== The L-Tromino Example

*Setting:* A $2^n times 2^n$ grid. Can you tile it with L-shaped trominoes,
leaving exactly one center-most square uncovered?

#grid(columns: (1fr, 1fr), gutter: 12pt,
block(inset: (x: 10pt, y: 8pt), stroke: box-rule, radius: 4pt)[
  *Weak predicate $P(n)$:* \
  "Can tile $2^n times 2^n$ grid leaving one *center* square uncovered."

  Problem: when doing the inductive step, knowing you can tile a $2^n$ grid
  with the center missing doesn't directly help you tile the $2^(n+1)$ grid.
  The four sub-grids' "missing squares" are not the center of the big grid.
],
block(inset: (x: 10pt, y: 8pt), stroke: box-rule, radius: 4pt)[
  *Stronger predicate $Q(n)$:* \
  "Can tile $2^n times 2^n$ grid leaving *any one* square uncovered."

  $Q(n)$ is strictly stronger: it covers all possible missing positions.
  But in the inductive step, you can now place one tromino at the center
  of the $2^(n+1)$ grid and apply $Q(n)$ to each quadrant. The proof works!
],
)

#proofbox("Inductive Step Sketch for Q(n)")[
  Assume $Q(n)$. Given a $2^(n+1) times 2^(n+1)$ grid, suppose square $(i,j)$
  must be left uncovered. WLOG $(i,j)$ is in the top-left quadrant.

- Place one L-tromino at the center of the big grid, covering one square
from each of the three quadrants *not* containing $(i,j)$.
- Apply $Q(n)$ to the top-left quadrant (leaving $(i,j)$ uncovered).
- Apply $Q(n)$ to each of the other three quadrants (leaving the
tromino-covered square uncovered in each). ✓

Since $Q(n) => P(n)$ trivially, $forall n, P(n)$ follows. $square$
]

#keybox[
  *Takeaway:* When induction fails, try strengthening the hypothesis.

  More to assume in the inductive step can be worth more than less to prove
  in the base case. Finding the right IH is part skill, part intuition —
  it gets easier with practice.

  A bonus: stronger induction hypotheses often yield *constructive* proofs
  (they produce an algorithm, not just an existence result).
]

= Quick Reference — All Four Techniques

#block(inset: (x: 12pt, y: 8pt), stroke: box-rule, radius: 4pt)[
  #table(
    columns: (auto, auto, 1fr, auto),
    stroke: none, inset: (x: 8pt, y: 5pt),
    fill: (c,r) => if r == 0 { luma(50) } else if calc.odd(r) { luma(35) } else { luma(22) },
    [*Technique*],[*Prove*],[*Strategy*],[*Signal*],
    [Direct],        [$P => Q$],
    [Assume $P$, derive $Q$],
    [Clear forward path],
    [Contrapositive],[$P => Q$],
    [Assume not $Q$, derive not $P$],
    [Forward is murky],
    [Contradiction], [any $P$],
    [Assume not $P$, derive false],
    [Negation has useful structure],
    [Induction],     [$forall n in NN, P(n)$],
    [Base case + $P(n) => P(n+1)$],
    [Statement involves all of $NN$],
  )
]

= Common Mistakes

#list(
  [*Proof by example for universals* — one or a million examples never
  proves $forall n, P(n)$. Only induction or a generic-element argument works.],

  [*Confusing contrapositive with converse* — $(P => Q)$ is equivalent to
  (not $Q =>$ not $P$), NOT to $(Q => P)$. Using the converse proves nothing.],

  [*Circular contradiction* — reaching "not $P$" from "assume not $P$" is
  not a contradiction; you just restated your assumption.],

  [*Forgetting the base case in induction* — without it, the chain never
  starts. The inductive step alone proves nothing.],

  [*Using $P(n)$ in the inductive step before establishing it* — the
  induction hypothesis gives you $P(n)$; you must show $P(n+1)$, not
  just wave your hands at "$P(n+1)$ follows similarly".],

  [*Weak induction hypothesis* — if the step gets stuck, the IH may be too
  weak. Strengthen it (prove more) rather than looking for clever tricks.],
)
