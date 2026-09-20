
#set document(title: "Lecture 01 Notes — Predicates, Sets, and Proofs")
#set page(
  paper: "us-letter",
  margin: (x: 1.1in, y: 1in),
  header: [
    #set text(size: 9pt, fill: luma(130))
    #grid(columns: (1fr,1fr),
      [6.1200J · Spring 2024],
      align(right)[Lecture 01: Predicates, Sets, and Proofs]
    )
    #line(length: 100%, stroke: 0.4pt + luma(200))
  ],
  footer: [
    #set text(size: 9pt, fill: luma(130))
    #line(length: 100%, stroke: 0.4pt + luma(200))
    #align(center)[#context counter(page).display("1")]
  ]
)

#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.7em, spacing: 1em)
#let accent   = rgb("#1a56db")
#let note-bg  = rgb("#f0f4ff")
#let warn-bg  = rgb("#fff8e1")
#let ok-bg    = rgb("#f0fff4")
#let box-rule = 0.5pt + luma(200)

#let defbox(title, body) = block(
  width: 100%, inset: (x: 12pt, y: 9pt),
  stroke: (left: 3pt + accent, rest: box-rule),
  fill: note-bg, radius: (right: 4pt),
  below: 0.9em,
)[
  #text(weight: "bold", fill: accent, size: 10pt)[#title]
  #v(3pt)
  #body
]

#let notebox(body) = block(
  width: 100%, inset: (x: 12pt, y: 9pt),
  stroke: (left: 3pt + rgb("#f59e0b"), rest: box-rule),
  fill: warn-bg, radius: (right: 4pt),
  below: 0.9em,
)[
  #text(weight: "bold", size: 10pt, fill: rgb("#b45309"))[⚠ Note]
  #v(3pt)
  #body
]

#let keybox(body) = block(
  width: 100%, inset: (x: 12pt, y: 9pt),
  stroke: (left: 3pt + rgb("#16a34a"), rest: box-rule),
  fill: ok-bg, radius: (right: 4pt),
  below: 0.9em,
)[
  #text(weight: "bold", size: 10pt, fill: rgb("#15803d"))[✓ Key Takeaway]
  #v(3pt)
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
  #text(size: 20pt, weight: "bold")[Lecture 01 — Study Notes]
  #v(4pt)
  #text(size: 13pt, fill: luma(80))[Predicates, Sets, and Proofs]
  #v(4pt)
  #text(size: 10pt, fill: luma(140))[MIT 6.1200J / 18.062J · Spring 2024]
]
#v(1.4em)
#line(length: 100%, stroke: 1pt + luma(180))
#v(1em)

= What is a Proof?

In everyday life the word "proof" means different things: a physics
experiment, a legal verdict, a majority opinion, or even "the professor
said so." None of these are mathematical proofs.

#defbox("Definition — Mathematical Proof")[
  A *mathematical proof* is a *verification* of a *proposition* by a
  chain of *logical deductions* from a base set of *axioms*.

  Three moving parts:
  #list(
    [*proposition* — the statement being proved],
    [*logical deductions* — each step follows necessarily from the last],
    [*axioms* — the agreed-upon starting truths],
  )
]

#keybox[
  A proof is not about convincing; it is about *necessity*. If the
  axioms are accepted and every deduction is valid, the conclusion
  *cannot* be false.
]

= Propositions and Predicates

#defbox("Definition — Proposition")[
  A *proposition* is a statement that is unambiguously either *True* or
  *False*. It has no free variables.
]

#defbox("Definition — Predicate")[
  A *predicate* is a proposition whose truth value *depends on one or
  more variables*. It becomes a proposition once those variables are
  fixed.
]

== Examples

#grid(columns: (auto, 1fr), gutter: 8pt,
  text(fill: rgb("#16a34a"), weight: "bold")[True],  [$2 + 3 = 5$],
  text(fill: rgb("#dc2626"), weight: "bold")[False], [$2 + 3 = 6$],
  text(fill: luma(100))[?], [$forall n in NN. space n^2 + n + 41 "is prime"$],
)

#v(0.5em)

The third example is a *predicate* (contains the variable $n$) wrapped
in a universal quantifier — so it is also a proposition. Is it true?

#block(inset: (x: 12pt, y: 9pt), stroke: box-rule, radius: 4pt)[
#table(
  columns: (auto, auto, auto),
  stroke: none,
  inset: (x: 10pt, y: 5pt),
  fill: (col, row) => if row == 0 { luma(235) } else { white },
  [*$n$*], [*$n^2+n+41$*], [*Prime?*],
  [$0$], [$41$], [✓],
  [$1$], [$43$], [✓],
  [$2$], [$47$], [✓],
  [$dots$], [$dots$], [$dots$],
  [$39$], [$1601$], [✓],
  [$41$], [$43 times 41$], [✗ — *fails here*],
)
]

#notebox[
  *Proof by Example is NOT a proof.* Checking finitely many cases —
  even millions — never proves a universal statement.
  $n = 41$ kills the proposition above.
]

== Quantifier Notation

#table(
  columns: (auto, 1fr),
  stroke: none, inset: (x: 8pt, y: 5pt),
  fill: (c,r) => if r == 0 { luma(235) } else { white },
  [*Symbol*], [*Meaning*],
  [$forall$],  ["for all" — universal quantifier],
  [$exists$],  ["there exists" — existential quantifier],
  [$in$],      [element of a set],
  [$NN$],      [natural numbers $= {0,1,2,dots}$],
  [$ZZ$],      [integers $= {dots,-1,0,1,dots}$],
  [$ZZ^+$],    [positive integers $= {1,2,3,dots}$],
)

== Devious Propositions

Some propositions remain unresolved for centuries:

#block(inset: (x: 12pt, y: 9pt), stroke: box-rule, radius: 4pt)[
*Euler's Sum of Powers Conjecture* (1769):
$a^4+b^4+c^4=d^4$ has no positive integer solution. \
→ *False.* Disproved by Elkies in 1988:
$95800^4 + 217519^4 + 414560^4 = 422481^4$.

*Goldbach's Conjecture*: Every even integer $> 2$ is the sum of two
primes. \ → *Unknown.* Verified for enormous ranges; no proof exists.

*Elliptic curves*: $313(x^3+y^3)=z^3$ has no positive integer solution.
Counterexample has $>1000$ digits. Elliptic curves underpin modern
cryptography — the ability to factor large numbers would compromise
most secured systems.
]

= Combining Propositions — Boolean Operators

Given propositions $A$ and $B$ we build new ones:

#grid(columns: (1fr, 1fr), gutter: 12pt,

block(inset: (x: 10pt, y: 8pt), stroke: box-rule, radius: 4pt)[
#table(
  columns: (auto, auto),
  stroke: none, inset: (x: 10pt, y: 4pt),
  fill: (c,r) => if r == 0 { luma(235) } else { white },
  [*$A$*], [*$not A$*],
  [T], [F],
  [F], [T],
)
],

block(inset: (x: 10pt, y: 8pt), stroke: box-rule, radius: 4pt)[
#table(
  columns: (auto,auto,auto,auto),
  stroke: none, inset: (x: 8pt, y: 4pt),
  fill: (c,r) => if r == 0 { luma(235) } else { white },
  [*$A$*],[*$B$*],[*$A and B$*],[*$A or B$*],
  [T],[T],[T],[T],
  [T],[F],[F],[T],
  [F],[T],[F],[T],
  [F],[F],[F],[F],
)
],
)

== Operators Explained

- *$A and B$* (AND / conjunction) — both must be true.
- *$A or B$* (OR / disjunction) — at least one is true. This is
  *inclusive* or: it is fine if both are true.
- *$not A$* (NOT / negation) — flips truth value.

#notebox[
  *English "or" ≠ mathematical $or$.*

  - "Chicken *or* pasta" at a wedding → exclusive or (xor): exactly one.
  - "Coffee *or* tea" → neither is also allowed (nand).
  - "Cream *or* sugar" → all four combinations valid — this is
    mathematical $or$.

  When in doubt, trust the truth table, not the English word.
]

= Implication

#defbox("Definition — Implication  $A => B$")[
  Read as "if $A$ then $B$", or "$A$ implies $B$".
  #v(6pt)
  #table(
    columns: (auto,auto,auto),
    stroke: none, inset: (x: 10pt, y: 4pt),
    fill: (c,r) => if r == 0 { luma(235) } else { white },
    [*$A$*],[*$B$*],[*$A => B$*],
    [T],[T],[T],
    [T],[F],[F],
    [F],[T],[T],
    [F],[F],[T],
  )
]

== Why is "False implies True" = True?

Intuition: "On Wednesdays we wear pink."

- Wednesday + wearing pink → rule satisfied. ✓
- Wednesday + *not* wearing pink → rule violated. ✗
- *Not* Wednesday + wearing pink → rule not triggered, no violation. ✓
- *Not* Wednesday + *not* wearing pink → rule not triggered. ✓

The rule is only *violated* when the hypothesis is true but the
conclusion is false.

== Four Related Forms

#table(
  columns: (auto, auto, auto),
  stroke: none, inset: (x: 8pt, y: 5pt),
  fill: (c,r) => if r == 0 { luma(235) } else { white },
  [*Form*], [*Statement*], [*Equivalent to original?*],
  [Original],      [$A => B$],               [—],
  [Contrapositive],[$not B => not A$],        [*Yes* — always equivalent],
  [Converse],      [$B => A$],                [*No* — independent],
  [Inverse],       [$not A => not B$],        [No (same as converse)],
)

#notebox[
  A common logical error is treating the *converse* as equivalent to
  the original. "$x < 3 => x < 4$" does NOT reverse to
  "$x < 4 => x < 3$".
]

== If and Only If (iff)

$A "iff" B$ means $A$ and $B$ are either both true or both false.
It is defined as $(A => B) and (B => A)$ — implication in both
directions.

#table(
  columns: (auto,auto,auto),
  stroke: none, inset: (x: 10pt, y: 4pt),
  fill: (c,r) => if r == 0 { luma(235) } else { white },
  [*$A$*],[*$B$*],[*$A "iff" B$*],
  [T],[T],[T],
  [T],[F],[F],
  [F],[T],[F],
  [F],[F],[T],
)

= Sets

#defbox("Definition — Set")[
  A *set* is an unordered collection of distinct objects
  (called *elements*).

  - No duplicates: ${1,2,2,3} = {1,2,3}$.
  - Order irrelevant: ${1,2,3} = {3,1,2}$.
  - Elements can themselves be sets.
]

== Notation

#table(
  columns: (auto, 1fr),
  stroke: none, inset: (x: 8pt, y: 5pt),
  fill: (c,r) => if r == 0 { luma(235) } else { white },
  [*Symbol*], [*Meaning*],
  [$emptyset$ or ${}$], [empty set — zero elements],
  [$6 in A$],           [6 is an element of $A$],
  [$x in.not A$],       [$x$ is not an element of $A$],
  [$S subset.eq T$],    [every element of $S$ is also in $T$ (subset)],
  [$A inter B$],         [intersection — elements in both $A$ and $B$],
  [$A union B$],        [union — elements in $A$ or $B$ (or both)],
  [$A without B$],      [difference — elements of $A$ not in $B$],
)

== Set-Builder Notation

#block(inset: (x: 12pt, y: 8pt), stroke: box-rule, radius: 4pt)[
$ {n in NN mid "isPrime"(n)} = {2, 3, 5, 7, 11, dots} $

Read: "the set of all $n$ in $NN$ such that $n$ is prime."
A colon ($:$) may appear instead of $|$ — both are standard.
]

== Sets vs. Ordered Tuples

#grid(columns: (1fr,1fr), gutter: 12pt,
block(inset: (x:10pt,y:8pt), stroke: box-rule, radius: 4pt)[
  *Set* $A = {6,1,2,0}$
  - Unordered
  - No duplicates
  - Supports $union, inter, without$
],
block(inset: (x:10pt,y:8pt), stroke: box-rule, radius: 4pt)[
  *Tuple* $X = (6,1,2,0)$
  - Ordered
  - Duplicates allowed: $(1,1,2)$
  - No union/intersection
],
)

= Axioms

#defbox("Definition — Axiom")[
  An *axiom* is a proposition assumed to be true without proof. It is
  the foundation on which all theorems in a system are built.
]

Every proof rests on axioms. The rule is not "make no assumptions" but
"*state* your assumptions explicitly."

== Different Axioms → Different Geometries

The *parallel postulate* has three mutually contradictory versions:

#table(
  columns: (auto, 1fr, auto),
  stroke: none, inset: (x: 8pt, y: 5pt),
  fill: (c,r) => if r == 0 { luma(235) } else { white },
  [*Axiom*], [*Statement*], [*Geometry*],
  [2], [Exactly one parallel line through $p$],     [Euclidean],
  [3], [No parallel line through $p$],               [Spherical / Elliptic],
  [4], [Infinitely many parallel lines through $p$], [Hyperbolic],
)

All three are internally consistent. None is "more correct" — they
describe different geometric worlds.

== Desirable Properties of an Axiom System

#defbox("Definition — Consistency")[
  A set of axioms is *consistent* if no proposition can be *both* proved
  and disproved within the system.
]

#defbox("Definition — Completeness")[
  A set of axioms is *complete* if every proposition can be *either*
  proved or disproved within the system.
]

Both properties are obviously desirable. Russell and Whitehead spent
decades trying to build a complete and consistent foundation for
arithmetic in their _Principia Mathematica_.

== Gödel's Incompleteness Theorem

#block(
  width: 100%, inset: (x: 12pt, y: 9pt),
  stroke: (left: 3pt + rgb("#dc2626"), rest: box-rule),
  fill: rgb("#fff5f5"), radius: (right: 4pt),
  below: 0.9em,
)[
  #text(weight: "bold", fill: rgb("#b91c1c"), size: 10pt)[Theorem (Gödel, 1930s)]
  #v(3pt)
  *No* set of axioms is both *complete* and *consistent*.
]

Consequences:

- If you insist on consistency (you must), then there will always be
  true statements that are *unprovable* within your system.
- Goldbach's Conjecture might be one such statement — true, yet
  forever beyond proof.
- This result *shocked* the mathematical community and effectively ended
  the Russell–Whitehead programme.

#keybox[
  Consistency is non-negotiable: a system where $P$ and $not P$ are
  both provable is useless — you could prove anything.
  Completeness is the price we pay.
]

= Quick Reference — Symbol Glossary

#block(inset: (x: 12pt, y: 8pt), stroke: box-rule, radius: 4pt)[
#table(
  columns: (auto, auto, 1fr),
  stroke: none, inset: (x: 8pt, y: 4pt),
  fill: (c,r) => if r == 0 { luma(235) } else if calc.odd(r) { luma(250) } else { white },
  [*Symbol*],[*Name*],[*Meaning*],
  [$and$],       [AND],              [both true],
  [$or$],        [OR],               [at least one true (inclusive)],
  [$not$],       [NOT],              [negation],
  [$=>$],        [implies],          [if … then …],
  [$"iff"$],       [iff],              [if and only if],
  [$forall$],    [for all],          [universal quantifier],
  [$exists$],    [there exists],     [existential quantifier],
  [$in$],        [element of],       [$x in S$ means $x$ belongs to set $S$],
  [$in.not$],    [not element of],   [—],
  [$subset.eq$], [subset],           [$S subset.eq T$: every element of $S$ is in $T$],
  [$inter$],      [intersection],     [elements common to both sets],
  [$union$],     [union],            [all elements from either set],
  [$without$],   [set difference],   [$A without B$: elements in $A$ but not $B$],
  [$emptyset$],  [empty set],        [set with no elements],
  [$NN$],        [naturals],         [${ 0,1,2,dots }$],
  [$ZZ$],        [integers],         [${ dots,-1,0,1,dots }$],
  [$ZZ^+$],      [positive integers],[${ 1,2,3,dots }$],
)
]

= Common Mistakes to Avoid

#list(
  [*Proof by example* — checking cases, even millions, does not prove
   a universal statement.],

  [*Confusing implication with causation* — $A => B$ says nothing about
   $A$ causing $B$, only about their truth values.],

  [*Treating the converse as equivalent* — $A => B$ and $B => A$ are
   independent. Only the *contrapositive* $not B => not A$ is
   equivalent to $A => B$.],

  [*Using inclusive or when you mean exclusive or* — mathematical $or$
   allows both; everyday English "or" often doesn't.],

  [*Assuming completeness* — Gödel guarantees there are truths that
   no axiomatic system can prove. Some open conjectures may fall here.],
)
