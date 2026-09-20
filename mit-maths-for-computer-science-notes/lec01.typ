#set document(title: "6.1200J Lecture 01: Predicates, Sets, and Proofs")
#set page(paper: "us-letter", margin: (x: 1.2in, y: 1in))
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: none)

#show heading.where(level: 1): it => {
  v(1em)
  text(size: 13pt, weight: "bold", it.body)
  v(0.4em)
}

#show heading.where(level: 2): it => {
  v(0.8em)
  text(size: 11pt, weight: "bold", it.body)
  v(0.3em)
}

#grid(
  columns: (1fr, 1fr),
  [6.1200J/18.062J Mathematics for Computer Science \ Tuesday 6th February, 2024],
  align(right)[Massachusetts Institute of Technology, Spring 2024 \ Z. Abel, B. Chapman, E. Demaine \ #text(size:9pt)[revised Saturday 10th February, 2024]]
)

#line(length: 100%, stroke: 0.5pt)
#v(0.3em)

#align(center, text(size: 14pt, weight: "bold")[Lecture 01: Predicates, Sets, and Proofs])
#v(1em)

= 1 Administrivia

Please see Course Information handout!

- Lectures Tu/Th
- Rec W/F, attendance taken (10%), focus on solving problems in groups
- WU before every rec: instant feedback, unlimited tries until deadline, please do before rec.
- Psets due Mondays, released Tuesdays
- Collab policy
  - Solve psets in small groups
  - List collaborators per problem, or _Collab: None_
  - Write solutions on your own: don't look at other solutions (from friends, internet, OR chat gpt), don't reference communal notes while composing your own proof, and don't show your solutions to others
  - Why? P vs NP fallacy: understanding someone else's proof is easier than piecing together your own argument from scratch. When we say "in your own words", we want to see how you piece together the proof yourself.
- Late psets: briefly, late psets allowed for half credit until last day of classes! In truth, $n$ hours late will get $100 - n$ percent of earned points, unless $n >= 50$, in which case you'll get 50% of earned points. So don't worry about being a few hours late, it's nbd.
- Will talk more about late psets next time.

= 2 Proofs

*Q:* What is a proof?

*A:* A method of ascertaining the truth

Examples:

- Experiment / observation (physics)
- Sampling (statistics)
- Legal (judge / jury)
- Public opinion
- Business (authority)
- School (Professor says so!)
- Religion (Word of God)
- Inner Conviction
- "Why not?"

In mathematics:

#block(inset: (left: 1em), stroke: (left: 2pt + gray))[
*Definition 1.* A mathematical proof is a *verification* of a *proposition* by a chain of *logical deductions* from a base set of *axioms*.
]

Over the next two lectures, we will delve into predicate logic (also called first-order logic), break down this definition, and see what each of these three bolded components means.

= 3 Propositions

#block(inset: (left: 1em), stroke: (left: 2pt + gray))[
*Definition 2.* A *proposition* is a statement that is either True or False.

*Definition 3.* A *predicate* is a proposition whose truth depends on variables.
]

Examples:

#block(inset: (left: 1em))[
*Proposition 1* (True). $2 + 3 = 5$

*Proposition 2* (False). $2 + 3 = 6$

*Proposition 3.* $forall n in NN. space n^2 + n + 41$ is prime
]

Some non-examples:

- Hello.
- Who are you?
- "This statement is false." (Self-referential statements don't always make sense — not handled in this class.)

Some notation:

- $forall$ ("for all"): universal quantifier, followed by the predicate "$n^2 + n + 41$ is prime"
- $in$ ("in"): element of a set
- $NN$ ("the natural numbers"): the set of non-negative integers $0, 1, 2, dots$

To see if Proposition 3 is true or false, we need to know whether the predicate is true for every choice of $n$. Let's check:

#align(center)[
#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  [*$n$*], [*$n^2 + n + 41$*], [*Prime?*],
  [$0$],  [$41$],   [True],
  [$1$],  [$43$],   [True],
  [$2$],  [$47$],   [True],
  [$3$],  [$53$],   [True],
  [$4$],  [$61$],   [True],
  [$5$],  [$71$],   [True],
  [$dots$], [$dots$], [$dots$],
  [$20$], [$461$],  [True],
  [$dots$], [$dots$], [$dots$],
  [$39$], [$1601$], [True],
)
]

It's true for the first 40 examples, so probably true right? In some fields, this would be convincing: Engineering, Physics, CS (simulations often used in lieu of proof). But if $n = 41$, then $n^2 + n + 41 = 43 times 41$. In mathematics, we call this a "Proof by Example", which is *NOT* a valid proof!

Some propositions in number theory are even more devious.

#block(inset: (left: 1em))[
*Proposition 4* (False). $a^4 + b^4 + c^4 = d^4$ has no positive integer solution.
- Conjectured by Euler in 1769
- Ultimately disproved by Noam Elkies
- Solution: $a = 95800, space b = 217519, space c = 414560, space d = 422481$


*Proposition 5* (True). $exists a, b, c, d in ZZ^+. space a^4 + b^4 + c^4 = d^4$

*Proposition 6* (False). $313(x^3 + y^3) = z^3$ has no positive integer solution.

- Smallest counterexample has over 1000 digits
- Why care...?
  - about $313(x^3 + y^3) = z^3$?
  - about 1000-digit numbers?
- In fact, this is an example of an _elliptic curve_. Elliptic curves are crucial to the understanding of how to factor large numbers. The ability to factor large numbers would give you access to most computer systems on the planet...

*Proposition 7* (Goldbach's Conjecture). Every even number greater than 2 is the sum of two primes.

- T or F? Unknown!
- True for every even number ever checked...
- Generally believed
- Seems pretty hard, listed as one of the great unsolved mysteries on the front page of the Boston Globe in the mid 90s.
]

= 4 Combining Propositions

It's useful to construct new propositions by combining existing ones. For example,

- $A$ *and* $B$, aka $A and B$, means "both $A$ and $B$ are true"
- $A$ *or* $B$, aka $A or B$, means "at least one of $A$ or $B$ is true". (Note: this is inclusive or, meaning it's also fine for $A$ and $B$ to both be true.)
- *not* $A$, aka $overline(A)$, aka $not A$, means "$A$ is false"

We can represent these as truth tables:

#grid(
  columns: (auto, auto),
  gutter: 2em,
  align(center)[
    #table(
      columns: (auto, auto),
      stroke: 0.5pt,
      [*$A$*], [*not $A$*],
      [T], [F],
      [F], [T],
    )
  ],
  align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      stroke: 0.5pt,
      [*$A$*], [*$B$*], [*$A$ and $B$*], [*$A$ or $B$*],
      [T], [T], [T], [T],
      [T], [F], [F], [T],
      [F], [T], [F], [T],
      [F], [F], [F], [F],
    )
  ]
)

Cautionary tale: math terms are precise, but English words often change meaning depending on context, and the two share a lot of terms. Even worse, we communicate math using English! When written in formulas, _or_, etc., will always refer to the truth tables above. But in everyday language:

- Waiter at a wedding says that the dinner options were "chicken or pasta", and that word _or_ is meant to communicate some set of allowable responses. In this case, you can say "chicken", or "pasta", but not "both" or "neither", since they've already seen all the RSVP cards. This isn't how we defined _or_, it's _exclusive or_, denoted _xor_.
- Waiter then says you can have "coffee or tea", and this time, you can say "just coffee", "just tea", or "neither", but not "both", since you only get one mug and they're not about to mix the two at a fancy party! This again isn't _or_, it's _not and_, sometimes called _nand_.
- For your coffee, the waiter has "cream or sugar". This time, all 4 options are valid!

Three uses of the English word "or", none of them actually meant _or_.

= 5 Implication

One more important boolean operator: $A$ implies $B$, also denoted $A -> B$ or $A => B$. Should be read "$A$ implies $B$", aka "if $A$ then $B$".

#align(center)[
#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  [*$A$*], [*$B$*], [*$A$ implies $B$*],
  [T], [T], [T],
  [T], [F], [F],
  [F], [T], [T],
  [F], [F], [T],
)
]

The F implies T case might be less clear, so let's make it more concrete: "On Wednesdays we wear pink", aka, "if wednesday, wear pink", aka, "wednesday implies pink". Now F implies T being true makes sense: wearing pink on thursday doesn't violate the rule.

*Note:* $A$ implies $B$ is equivalent to its contrapositive, $(not B)$ implies $(not A)$, but *not* its converse $B$ implies $A$.

Some examples:

- You might be familiar with `<3`, the pre-emoji "heart" aka "I love you". I've also seen `<4` as an intensifier, "I really love you". But the latter is weaker! $x < 3$ implies $x < 4$, but not vice versa, so $x < 3$ is the stronger (i.e., more informative) statement.
- Descartes: "I think therefore I am." This asserts $T$, but also $T => A$. Internet meme: "I do not think therefore I do not am." This asserts $not T$ but also $not T => not A$. The implications are not equivalent! It's the inverse, which is equivalent to the converse, but not equivalent to the original. If my shoe exists but doesn't think, Descartes would be fine with that, but the meme wouldn't. Should it be "I do not am therefore I do not think"?

*Note:* $A$ implies $B$ doesn't imply a causal relationship ("$A$ causes $B$") or any connection with time ("$A$ happened, which later caused $B$ to happen"). Instead, $A$ implies $B$ is defined by this truth table.

By the way, if the F implies T case were swapped to what we wanted earlier, it's what we call "if and only if", abbreviated $A$ iff $B$, which asserts that $A$ and $B$ are both true or both false. It's equivalent to $(A => B)$ and $(B => A)$, which is where it gets its name.

= 6 Brief Detour: Sets

A set is, roughly speaking, a collection of objects. Can be finite (e.g. $A = {6, 1, 2, 0}$), infinite (e.g., $NN = {0, 1, 2, dots}$, $ZZ = {dots, -2, -1, 0, 1, 2, dots}$), empty (the empty set is written as $emptyset$ or ${}$ — same thing), can contain other sets as elements ($B = {2, {3, 4}, emptyset}$), etc.

There is no such thing as duplicates (that would be a multiset), and the order of elements doesn't matter. So ${1, 2, 2, 3} = {2, 3, 1} = {3, 1, 2}$.

The set $A$ has 4 elements, and $B$ has 3. Written as $6 in A$. Is ${1, 2} in A$? (no) Is ${3, 4} in B$? (yes)

Sets can be subsets of each other: $S subset.eq T$ means all elements of $S$ are also elements of $T$. Is ${1, 2} subset.eq A$? (yes) Is ${0, 1, 2, 6} subset.eq A$? (yes)

Often useful to use predicates to specify a subset, e.g., ${n in NN | "isPrime"(n)} = {2, 3, 5, 7, 11, dots}$. This is called _set-builder notation_. Might also see this with a colon instead of $|$.

Also useful to be able to combine sets into other sets, e.g., intersection $A inter B = {2}$, union $A union B = {0, 1, 2, 6, {3, 4}, emptyset}$, difference $A - B = A without B = {0, 1, 6}$ (the set of elements in $A$ that are not elements of $B$).

By contrast, when order matters, we have ordered tuples, written with parentheses: $X = (6, 1, 2, 0)$ is not the same as $Y = (2, 1, 6, 0)$. Duplicates are also fine, e.g., $(6, 1, 2, 0, 0)$. Union, Intersection, etc., don't make much sense for ordered tuples.

= 7 Axioms

The second component of a proof is the set of axioms on which it is based.

#block(inset: (left: 1em), stroke: (left: 2pt + gray))[
*Definition 4.* An *axiom* is a proposition that is assumed to be True.
]

- You may have heard: "Don't make assumptions in math"
- You *must* make assumptions!
- The key is to state them up front.

Examples:

#block(inset: (left: 1em))[
*Axiom 1.* If $a = b$ and $b = c$, then $a = c$.

*Axiom 2.* Given a line $l$ and a point $p in.not l$, there is exactly one line through $p$ parallel to $l$.

*Axiom 3.* Given a line $l$ and a point $p in.not l$, there is no line through $p$ parallel to $l$.

*Axiom 4.* Given a line $l$ and a point $p in.not l$, there are infinitely many lines through $p$ parallel to $l$.
]

- These last three axioms are contradictory! Which is right?
- All are equally valid.
- Different axioms yield different proofs and theorems.
- Anyone who agrees with your axioms must accept theorems derived from them.
- Lines are just different objects in these three worlds...
- There is no "correct" set of axioms, but we would at least like:

#block(inset: (left: 1em), stroke: (left: 2pt + gray))[
*Definition 5.* A set of axioms is *consistent* if no proposition can be both proved and disproved.

*Definition 6.* A set of axioms is *complete* if every proposition can be either proved or disproved.
]

- Consistency and completeness are clearly desirable!
- Logicians Russell and Whitehead spent their entire careers trying to find a complete and consistent set of axioms for basic arithmetic.
- But:

#block(inset: (left: 1em), stroke: (left: 2pt + gray))[
*Theorem 8* (Gödel's Incompleteness Theorem). No set of axioms is both complete and consistent.
]

- Proved by Kurt Gödel in 1930s
- Shocked the field
- Bad day for Russell and Whitehead...
- Corollary: if you want consistency (necessary), then there are True statements that cannot be proved!
- Maybe: Goldbach's Conjecture is True, but there is no proof!
- Please let us know if we assign any of these as homework...

