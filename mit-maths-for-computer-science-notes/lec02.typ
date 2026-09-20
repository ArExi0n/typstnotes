#set page(height: auto)

#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.65em)

#set heading(numbering: "1.")

#show heading.where(level: 1): it => {
  v(1em)
  text(size: 16pt, weight: "bold")[#it]
  v(0.5em)
}
#show heading.where(level: 2): it => {
  v(0.5em)
  text(size: 14pt, weight: "bold")[#it.body]
  v(0.3em)
}

#grid(columns: (1fr, 1fr),
  [6.1200J/18.062J _Mathematics for Computer Science_ \
   Massachusetts Institute of Technology, Spring 2024 \
   Z. Abel, B. Chapman, E. Demaine],
  align(right)[Thursday 8#super[th] February, 2024 \
   #text(size: 9pt)[revised Saturday 10#super[th] February, 2024]]
)
#line(length: 100%, stroke: 0.5pt)
#v(0.5em)
#align(center, text(size: 18pt, weight: "bold")[Lecture 02: Contradiction and Induction])
#v(1.2em)

= Logical Deduction

Third component of a proof

Hardest but also most important component

Deals with the structure of the proof

*Definition 1.* _An_ inference rule _is a rule for combining true propositions to form other true propositions._

=== Examples:

Modus ponens (can be written many ways)

#block(inset: (left: 1.5em))[
- $((P => Q)$ and $P) => Q$
- $P => Q, P tack.r Q$
- $display(frac(P => Q \ P, Q))$

Modus tollens: $((P => Q)$ and not $Q) =>$ not $P$

$((P => Q)$ and $(Q => R)) => (P => R)$

$(($not $P) => "false") => P$
]

You can quickly check e.g. with a truth table that all of the above are sensible rules. As an example, for modus ponens, recall the truth table for $P => Q$:

#align(center)[
#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  inset: (x: 14pt, y: 5pt),
  [*$P$*], [*$Q$*], [*$P => Q$*],
  [$T$], [$T$], [$T$],
  [$T$], [$F$], [$F$],
  [$F$], [$T$], [$T$],
  [$F$], [$F$], [$T$],
)
]

There is only one row in which $P$ and $P => Q$ are both True (the first), and in this row, $Q$ is also True.

*For this class:*

#block(inset: (left: 1.5em))[
Each step in a proof should be clear and logical.

You should state which previously proved propositions are being used.

Please do not make wild leaps of faith.

Please do not use "Proof by Intimidation" ($P$ is obvious, Clearly $Q$, etc.)

But we are not picky about which inference rules you use, and there is certainly no need to cite an inference rule at every step.

We are also not picky about precisely which axioms you use; generally basic math you knew before this class is all fair game.

But if we ask you to prove $P$, then "I already knew $P$, so it's an axiom" is not a valid proof...
]

Today we will explore some basic (but crucial!) proof techniques, and then two powerful techniques: Proof by Contradiction and Proof by Induction.

= Fundamental proof techniques

== Proving Existence

The most straightforward way to prove that something _exists_ is to demonstrate an example! E.g., $exists n in NN space n >= 10$ and isPrime$(n)$.

_Proof._ We'll show that $n = 17$ satisfies the required condition. This is true because 17 is a prime number and $17 >= 10$. #h(1fr) $square$

In general, a proof of $exists x in S space P(x)$ will often look like this:

_Proof._ We'll show that the value $x = [italic("some specific value")]$ works. Indeed, for this choice of $x$, $P(x)$ is true because $[italic("reasons")]$. #h(1fr) $square$

== Proving Universality

Can't get away with just a single example, if we need to prove something for _all_ members of a set. E.g., $forall x in RR space x^2 - 6x > -10$.

The strategy: Introduce a _generic/arbitrary_ member $x$ of $S$ (i.e., make no assumptions about $x$ other than the fact that $x in S$), and prove $P(x)$ is true.

_Proof._ Suppose $x$ is an arbitrary real number. Then $x^2 - 6x + 9 = (x-3)^2$, which is $>= 0$ because the square of every real number is nonnegative. So $x^2 - 6x = (x-3)^2 - 9 >= -9 > -10$, as needed. #h(1fr) $square$

In general, when proving $forall x in S space P(x)$,

_Proof._ Assume $x$ is an arbitrary element of $S$. Then $P(x)$ is true because $[italic("reasons")]$. #h(1fr) $square$

== Proof of an Implication: Direct Method

When proving $P$ implies $Q$, the strategy is to _assume_ $P$, and then to prove $Q$ (probably using that assumption).

For example, if $n$ is a multiple of 10, then it is a multiple of 2.

_Proof._ Assume $n$ is a multiple of 10; in other words, $n = 10k$ for some integer $k$. This means $n = 2 dot (5k)$, and therefore $n$ is equal to 2 times an integer (namely, $5k$) and is therefore a multiple of 2. #h(1fr) $square$

In general,

_Proof._ Assume $P$ is true. Then $Q$ is also true, because $[italic("reasons")]$. #h(1fr) $square$

== Proof of an Implication: Contrapositive

$P$ implies $Q$ is equivalent to its contrapositive (not $Q$) implies (not $P$), and the latter is sometimes easier to think about. E.g., assuming $n$ is an integer, ($n^2$ is even) implies ($n$ is even).

_Proof._ The desired theorem is equivalent to its contrapositive ($n$ is odd) implies ($n^2$ is odd), so we'll prove _this_ implication directly. Assume $n$ is odd, and we'll prove that $n^2$ is also odd.

Since $n$ is odd, we know $n = 2k+1$ for some integer $k$. Then $n^2 = (2k+1)^2 = 4k^2+4k+1 = 2(2k^2+2k)+1$, which is one more than a multiple of 2, as required. #h(1fr) $square$

In general, when proving $P$ implies $Q$,

_Proof._ We'll prove the contrapositive, so assume not $Q$ is true. Then not $P$ is true because $[italic("reasons")]$. #h(1fr) $square$

= Proof by Contradiction

In a _Proof by Contradiction_, you assume the _opposite_ of what you want to prove, and you use that assumption to derive a falsehood, or contradiction.

#block(inset: (left: 1.5em))[
To prove $P$ by contradiction, you prove the implication (not $P$) $=>$ false.

By our inference rule, this is a valid proof of $P$!

Sometimes called an Indirect Proof
]

For example,

*Theorem 1.* $sqrt(2) in.not QQ$

_Proof by contradiction._ Assume for sake of contradiction that $sqrt(2) in QQ$. Write $sqrt(2)$ as a fraction in lowest terms, i.e. let $a, b in ZZ$ have no common divisors such that:

#align(center)[
$display(a/b) = sqrt(2)$

$a = b sqrt(2)$

$a^2 = 2b^2$
]

This tells us that $a^2$ is even.

By our theorem above, $a$ itself must be even, so we can write $a = 2c$ for some integer $c$.

#align(center)[
$a^2 = 2b^2$

$(2c)^2 = 2b^2$

$4c^2 = 2b^2$

$2c^2 = b^2$
]

This shows $b^2$ is even, so with our lemma again, $b$ itself is even. Now $a$ and $b$ share a factor (2). $=><=$ #h(1fr) $square$

= Proof Outlining

For many theorems, choosing a proof method can lead to immediate and noticeable progress on constructing the proof, based solely on the requirements of the method. The more precisely you can break down a proof into smaller tasks, the easier it will be to tackle these tasks one at a time, to ensure your proof is complete and correct. As this outlining task becomes faster and more automatic with practice, it will become easier to consider multiple possible approaches to a problem before deciding which one(s) to pursue.

A common proof-writing mistake is to dive headlong into _how to prove_ something, while not realizing that you're trying to prove the wrong thing! Spending a bit of time identifying _what_ needs to be proved, likely using our common proof techniques, will ensure that your "how to prove"-energy is directed at the correct targets. And thankfully, this outlining step can often be started nearly mechanically, based on the form of the theorem being proved and the chosen proof techniques, regardless of the specific concepts or terms used within.

For example, Theorem: "For every integer $n$, the number $n$ is #underline[fooish] precisely when $n+1$ is #underline[barsome]."

What do fooish and barsome mean? Doesn't matter — we can still make significant progress with structuring our proof!

Let's decompose this one step at a time. This theorem has the form $forall n in ZZ space F(n)$ iff $B(n+1)$. Handling the "$forall$" makes the outline look like this:

_Proof Outline Scratchwork, Step 1._ Suppose $n$ is any integer; we must prove $F(n)$ iff $B(n+1)$. [TODO: prove $F(n)$ iff $B(n+1)$.] #h(1fr) $square$

Our remaining task is to prove an iff, and we have a usual strategy for this as well:

_Proof Outline Scratchwork, Step 2._ Suppose $n$ is any integer; we must show $F(n)$ implies $B(n+1)$ and $B(n+1)$ implies $F(n)$.

#block(inset: (left: 1.5em))[
[TODO: prove $F(n)$ implies $B(n+1)$.]

[TODO: prove $B(n+1)$ implies $F(n)$.] #h(1fr) $square$
]

Now we have some implications, where the usual strategy looks like this:

_Proof Outline._ Suppose $n$ is any integer; we must show $F(n)$ and $B(n+1)$ both imply each other.

#block(inset: (left: 1.5em))[
To prove $F(n)$ implies $B(n+1)$, first assume $F(n)$ is true. [TODO: prove $B(n+1)$.]

To prove $B(n+1)$ implies $F(n)$, instead assume $B(n+1)$ is true. [TODO: prove $F(n)$.] #h(1fr) $square$
]

Since the remaining steps require knowing what $F(n)$ and $B(n+1)$ mean and how they relate to each other, this is as far as we can get for now — it's our finished outline!

= Proof by Induction

Induction is probably the most common and most powerful proof technique in computer science. Let's start with an example to build intuition.

== An Informal Example

*Theorem 2.* $forall n in NN space 1 + 2 + 3 + dots.c + n = n(n+1)/2$.

In order to prove this theorem, we need to verify the predicate $P(n) := 1+2+3+dots.c+n = n(n+1)/2$ for every possible natural number $n$. (Note: including $n = 0$, since the empty sum, by convention, is 0.) Let's investigate:

#align(center)[
#table(
  columns: (1fr, auto, 1fr),
  stroke: none,
  inset: (y: 3pt),
  align: (right, center, left),
  [$0$],           [$=$], [$(0)(1)/2$],
  [$1$],           [$=$], [$(1)(2)/2$],
  [$1+2$],         [$=$], [$3 = (2)(3)/2$],
  [$1+2+3$],       [$=$], [$4+5 = 6 = (3)(4)/2$],
  [$1+2+3+4$],     [$=$], [$10 = (4)(5)/2$],
  [$1+2+3+4+5$],   [$=$], [$15 = (5)(6)/2$],
)
]

But just checking examples isn't enough!

One possible idea: on the left side, we add 2, then 3, then 4, then 5, etc. Does the right side follow this same pattern?

#align(center)[
#table(
  columns: (auto, 1fr, auto),
  stroke: none,
  inset: (y: 2pt),
  [$P(n)$:],   [#h(1em)$1+2+3+dots.c+n$],          [$= (n)(n+1)/2$],
  [$P(n+1)$:], [#h(1em)$1+2+3+dots.c+n+(n+1)$],    [$= (n+1)(n+2)/2$],
)
]

On the left side, we got from one sum to the next by adding $n+1$. What about the right side?

$ frac((n+1)(n+2), 2) - frac((n)(n+1), 2) = (n+1) dot frac((n+2) - n, 2) = (n+1) $

It's the same! So from each row to the next, we're always adding the same amount on both sides, so the two sides will always stay equal.

This idea of "always adding the same amount to both sides at each step" is not very formal or generalizable, but hopefully it's at least convincing! How can we prove this carefully?

== Digging Deeper

Our "adding $n$ to both sides" argument proves the following: "Assuming $1+2+dots.c+(n-1) = (n-1)(n)/2$, it follows (by adding $n$ to both sides) that $1+2+dots.c+(n-1)+n = (n)(n+1)/2$." In other words, we were able to prove $P(n-1)$ implies $P(n)$, for every $n >= 1$. We also noticed that $P(1)$ is true just by looking at it, so here's what we actually proved (left), vs what we actually want to know (right):

#align(center)[
#table(
  columns: (auto, 0.5pt, auto),
  stroke: none,
  inset: (x: 20pt, y: 4pt),
  align: (left, center, left),
  [*Know all these*], [#line(length: 100%, angle: 90deg, stroke: 0.5pt)], [*Want to prove all these*],
  [$P(0)$],                   [#line(length: 100%, angle: 90deg, stroke: 0.5pt)], [$P(0)$],
  [$P(0)$ implies $P(1)$],    [#line(length: 100%, angle: 90deg, stroke: 0.5pt)], [$P(1)$],
  [$P(1)$ implies $P(2)$],    [#line(length: 100%, angle: 90deg, stroke: 0.5pt)], [$P(2)$],
  [$P(2)$ implies $P(3)$],    [#line(length: 100%, angle: 90deg, stroke: 0.5pt)], [$P(3)$],
  [$P(3)$ implies $P(4)$],    [#line(length: 100%, angle: 90deg, stroke: 0.5pt)], [$P(4)$],
  [$P(4)$ implies $P(5)$],    [#line(length: 100%, angle: 90deg, stroke: 0.5pt)], [$P(5)$],
  [$P(5)$ implies $P(6)$],    [#line(length: 100%, angle: 90deg, stroke: 0.5pt)], [$P(6)$],
  [$dots.v$],                 [#line(length: 100%, angle: 90deg, stroke: 0.5pt)], [$dots.v$],
)
]

This feels like it should be enough, right? We know $P(0)$, and once we know $P(0)$ the implication shows $P(1)$, and from this the next implication proves $P(2)$, and then $P(3)$, and $P(4)$, and all the way down! So they're all true! But again, how can we prove this formally? How can we go from the left column to the right column?

#align(center)[
#table(
  columns: (1fr, 0.5pt, 1fr),
  stroke: none,
  inset: (x: 10pt, y: 5pt),
  fill: (c,r) => if r == 0 { luma(235) } else { white },
  [*We Know*], [], [*We Want to Prove*],
  [$P(0)$ and $forall n >= 0 space [P(n)$ implies $P(n+1)]$],
  [#line(length: 100%, angle: 90deg, stroke: 0.5pt)],
  [$forall n >= 0 space P(n)$],
)
]

Turns out, this is exactly what the Induction axiom does for us!

*Axiom 1* (Induction). _Let $P(n)$ be a predicate, defined for $n in NN$. If $P(0)$ and $forall n in NN space P(n) => P(n+1)$, then $forall n in NN space P(n)$._

Now, let's see how we use this Induction principle to formally prove our theorem.

_Proof of Theorem 2 by Induction._ Let $P(n)$ be the predicate $1 + 2 + dots.c + n = n(n+1)/2$. We prove $forall n in NN space P(n)$, by induction on $n$.

Base case, must show $P(0)$: LHS is 0, RHS is $(0)(1)/2 = 0$, so they're equal.

Inductive step: Let $n in NN$, and assume $P(n)$ is true; we must show $P(n+1)$. In other words, assume $1 + 2 + dots.c + n = n(n+1)/2$; we must show $1 + 2 + dots.c + n + (n+1) = (n+1)(n+2)/2$. Adding $n+1$ to both sides of $P(n)$ proves that

$ (1 + 2 + dots.c + n) + (n+1) = n(n+1)/2 + (n+1) = (n+1) dot (n/2 + 1) = (n+1) dot frac(n+2, 2), $

which is precisely the statement we needed to show!

Since we've shown $P(0)$ and that $P(n)$ implies $P(n+1)$ for every $n >= 1$, we conclude by induction that $P(n)$ is true for every $n in NN$, as desired. #h(1fr) $square$

== Strengthening the Induction Hypothesis

In the preceding proof, the predicate $P(n)$ is what we call the _Induction Hypothesis_. Often (but not always!) this will be the predicate you initially set out to prove.

Here's a setting in which this is not true: Suppose we have a square grid with side length $2^n$. Is it possible to use non-overlapping L-trominoes to cover the grid, except for one of the center-most squares?

Let's call $P(n)$ the predicate "it is possible to use non-overlapping L-trominoes to cover a $2^n$ by $2^n$ square grid, except for one of the center-most squares".

*Theorem 3.* $forall n in NN space P(n)$

What happens if we try to use $P(n)$ as the inductive hypothesis?

#block(inset: (left: 1.5em))[
Our base case ($n = 0$) is fine, as the only square is left uncovered.

But how do we use the inductive hypothesis for the inductive step? Covering a $2^n$ by $2^n$ grid doesn't seem to help us cover the $2^(n+1)$ by $2^(n+1)$ grid...
]

Consider $Q(n)$: "it is possible to use non-overlapping L-trominoes to cover _any_ $2^(2n) - 1$ squares of a $2^n$ by $2^n$ grid".

#block(inset: (left: 1.5em))[
$Q(n)$ is _stronger_ than $P(n)$

This actually makes the proof by induction _easier_!
]

_Proof._ We prove the stronger claim $forall n space Q(n)$ by induction on $n$.

Base case ($n = 0$): There is only one square, which is uncovered.

Inductive step: Assume $Q(n)$ for the purposes of induction. Suppose we have a $2^(n+1)$ by $2^(n+1)$ grid and wish to leave the square with coordinates $(i,j)$ uncovered. Assume _without loss of generality_ that $(i,j)$ is in the top-left quadrant. Place one L-tromino in the middle of the grid to cover one square in each of the other three quadrants. By the inductive hypothesis, we may cover the top-left quadrant, except for $(i,j)$, and we may cover the other three quadrants except for the one square already covered by the middle tromino. Together, this covers the entire grid, except for $(i,j)$.

By induction, $forall n space Q(n)$. $P(n)$ is a special case of $Q(n)$, so $forall n space P(n)$. #h(1fr) $square$

Two nice properties of this proof:

#block(inset: (left: 1.5em))[
Proof is _constructive_: it not only proves that it is possible to tile the grid; it also gives an algorithm for actually doing it!

It gives a stronger result: now we can leave any square uncovered, not just one of the center ones.
]

*Takeaway:* when doing a proof by induction, if at first you don't succeed, try something harder!

#block(inset: (left: 1.5em))[
May seem counterintuitive

Notice that strengthening the inductive hypothesis also means that the inductive step has a better starting point.

Finding the right IH can be a bit of an art — sometimes easy, sometimes not.]
