#set document(title: "Problem Set 1")
#set page(paper: "us-letter", margin: (x: 1.2in, y: 1in), height: auto)
#set text(font: "New Computer Modern", size: 12pt)
#set par(justify: true, leading: 0.65em)

#show heading.where(level: 1): it => {
  v(1em)
  text(size: 16pt, weight: "bold", it.body)
  v(0.4em)
}

#show heading.where(level: 2): it => {
  v(0.8em)
  text(size: 15pt, weight: "bold", it.body)
  v(0.3em)
}

#grid(
  columns: (1fr, 1fr),
  align(left)[
    6.1200J/18.062J _Mathematics for Computer Science_

    _Z. Abel, B. Chapman, E. Demaine_
  ],
  align(right)[
    #datetime.today().display("[month repr:long] [day], [year]")
  ],
)

#line(length: 100%, stroke: 0.5pt)
#v(0.3em)

#align(center, text(size: 18pt, weight: "bold")[Problem Set 1])
#v(1em)

Please make note of the following instructions:

- Your solutions must be submitted to Gradescope as a single PDF file. While we allow handwritten solutions, we *strongly suggest* that you *typeset in LaTeX*, using the template available on Canvas.
- *Each problem must be accompanied by a collaboration statement:* the students you collaborated with, and any external resources you consulted when solving the problem. Do not leave this blank—instead write "collaborators: none" if appropriate. See the Course Information handout for more details on the collaboration policy.

#show regex("(?i)Proof"): it => [*_Proof_*]
#show regex("qed"): it => align(right, $square.filled$)
#show regex("QED"): it => align(right, $square$)
#show regex("Thm"): it => [_Theorem_]
#show regex("Problem \d*"): it => text(weight: "bold", [#it. ])
#show regex("Sol \d"): it => text(weight: "bold", [#it. ])

#let notin = $in.not$
#let ifandonlyif = $arrow.l.r.double.long$


= Problem 1 Set Formulas and Propositional Formulas [10 points]

(a) [5 pts] Use a truth table to verify that the propositional formula $(P and Q) or (P and Q)$ is equivalent to $P$.

Note: For propositions, the three notations $not Q$, $not Q$, NOT $Q$ are interchangeable.

Sol

#set table(
  align: center,
  stroke: 0.5pt,
)

#table(
  columns: 6,
  inset: 8pt,
  [$P$], [$Q$], [$not Q$ ], [$P and Q$], [$P and not Q$], [$(P and Q) or (P and not Q)$ ],
  [T], [T], [F], [T], [F], [T],
  [T], [F], [T], [F], [T], [T],
  [F], [T], [F], [F], [F], [F],
  [F], [F], [T], [F], [F], [F],
)

(b) [5 pts] Prove that
$ A = (A - B) union (A inter B) $
for all sets $A, B$, by showing
$ x in A arrow.l.r x in ((A - B) union (A inter B)) $
for all elements $x$. How does this relate to part (a)?

Proof

Let $x$ be an arbitrary element. Then,

$
  x in A \
  ifandonlyif (x in A and x notin B) \
  or (x in A and x in B) \
  ifandonlyif x in ((A - B) union (A inter B)).
$

Therefore, $A = (A - B) union (A inter B)$.

*Relation to part (a)*.

Part (b) applies the logical identity from part (a) by substituting $P$ with $x in A$ and $Q$ with $x in B$. Logical conjunction corresponds to intersection, disjunction corresponds to union, and negation corresponds to not belonging to $B$.

qed

= Problem 2 Predicate Practice [10 points]

For parts (a)–(d) below, translate the given statements into predicate logic, while preserving the meaning as closely as possible. In addition to boolean logic symbols like AND, OR, NOT, and IMPLIES, and quantifiers $exists$ and $forall$, you may predicate builds using arithmetic, inequalities, and constants.

For this problem, you should use $NN = {0, 1, 2, dots}$ as your domain of discourse: all variables will be assumed to belong to $N$, so uses such as $exists$ and $forall x$ are understood to mean $exists x in NN$ and $forall x in NN$, respectively, and any predicate such as $S(y)$ will be defined for all inputs $y in NN$, and no others. For this problem we'd like you to avoid quantifying over other sets, such as "$forall p in "Primes"$ or "$exists n >= 1$".

For example, the statement "n is odd" (recall that $n in NN$ is assumed for this problem) could be translated into

$ "isOdd(n) := exists m. (2m + 1 = n)" $

or perhaps, relatedly,

$ "isNotEven(n) := NOT (exists a. n = 2a)" $

As another example, the predicate "p is a prime number" could be translated to

$ "isPrime(p) := (p > 1) AND NOT (exists m exists n. (m > 1 AND n > 1 AND m dot n = p))" $

(In more literal english, this says: p is greater than 1, and there do not exist two integers greater than 1 whose product is p.) You may use these predicates "isOdd(n)" and "isPrime(p)" by name in your answers below.

- [2pts] The predicate sixish(n) defined as "n is a natural number whose first digit is 6."
  _Hint:_ You may wish to use exponents, e.g., $10^k$. Be careful about where you do or don't need quantifiers.
- [2pts] "There are _exactly_ two natural numbers n such that $Q(n)$ is true."
- [2pts] Goldbach's Conjecture: "every even integer greater than 2 can be written as the sum of two primes."

Note: We don't know whether this is true or not, but that doesn't stop us from translating and discussing it!

Note: Recall that, for this problem, you shouldn't use quantifier shorthand $forall n > 2. V(n)$. Instead, use the more basic $forall n. W(n)$ (where $n in NN$ is implied), and include all necessary logic inside the predicate $W(n)$.

_Hint:_ "If n is even and greater than 2, then ..."
- [2pts] "Every prime larger than 100 is sixish."

Note: this statement is clearly untrue, so one attempted "translation" may be the statement that simply says "False". While this would logically equivalent, it wouldn't convey the _meaning_ behind the statement, i.e., it wouldn't explain which false statement is being

discussed. We need to be able to communicate statements precisely, regardless of their truth value.

_Hint:_ You may refer to "sixish" by name, even if you didn't solve part a.

(c) [2 pts] Is the predicate $R(n) := "exists b. n = 2b + 5"$ equivalent to $"isOdd"(n)$? Prove your answer.

_Hint:_ Recall that our domain of discourse is $NN$.

*(A)* Translate each statement

_I_. sixish(n): _n_ has first decimal digit 6.

A natural number has first digit 6 if it lies between $6 times 10^k - 1$ for some $k >= 0$.

$
  "sixish"(n) := exists k. exists r.\
  (6 times 10^k <= n)
  and (n < 7 times 10^k)
$

Here, _k_ is the number of digits after the first digit, and r is unnecessary, so we can simplify the answer to:

$ "sixish"(n) := exists k. (6 times 10^k <= n and n < 7 times 10^k) $

This also correctly excludes _n_ = 0, since zero does not begin with 6.

_II_. Exactly two natural numbers _n_ satisfy _Q(n)_.

We need two distinct numbers that satisfy _Q_, and every number satisfying _Q_ must equal one of those two.

$
  exists a. exists b. \
  (a != b)\
  and Q(a) and Q(b)\
  and forall n. (Q(n) => (n = a and n = b))
$

The distinctness condition $a!=b$ ensures there are two different numbers,while the final condition excludes any third number satisfying _Q_.

_III_. Goldbach's Conjecture

Every even natural number greater than 2 is the sum of two primes.

$
  forall n. ((exists k. n = 2k) and n >2)\
  =>exists p. exists q.\
  ("isPrime"(p) and "isPrime"(q)\
    and n = p + q))
$

The antecedent says that _n_ is even and greater than 2. The consequent says that two natural numbers _p,q_ exists, both are prime, and their sum is _n_.

_IV_. Every prime larger than 100 is sixish.

$ forall n. (("isPrime"(n) and n > 100) => "isPrime"(n)) $

This expresses the intended statement even though it is false: not every prime greater than 100 begins with the digit 6.

*(c)* Is R(_n_) equivalent to _isOdd(n)_

We are given
$ R(n):= exists b. n = 2b +5 $

*No, they are not equivalent.*

Proof. To show that two predicates are not equivalent, it is sufficient to find a natural number for which their truth values differ.

Take _n=1_. By the definition of odd number,
$ "isOdd"(1) = "true" $

However,_R(1)_ is false. If _R(1)_ were true, there would $exists b in NN$ such that

$ 1 = 2b+b $

Rearranging gives
$ b = -2 $

but $-2 notin NN$, contradicting the requirement that _b_ be a natural number.

Thus,_R(1)_ is false while _isOdd(1)_ is true. Therefore,

$ R(n) !== "isOdd"(n). $
QED
_Intuition_: _R(n)_ describes odd natural numbers greater than or equal to 5, whereas is _Odd(n)_ includes all odd natural numbers, including 1 and 3.

= Problem 3 Induction and Contradiction [Edited] [20 points]

(a) [10 pts] Suppose $Q(x)$ is a predicate defined for all $x in RR$. Assume that $Q$ has the following property: for every $x, y in RR$, if $Q(x dot y)$ is true, then at least one of $Q(x)$ or $Q(y)$ must be true.

From this, prove that $Q$ satisfies the following stronger property: for any integer $n >= 1$ and any $n$ numbers $x_1, x_2, dots, x_n in RR$, if $Q(x_1 dot x_2 dots dots x_n)$ is true, then at least one of $Q(x_1), Q(x_2), dots, Q(x_n)$ must be true.

Prove the result by induction on $n$. Be sure to _carefully_ identify your inductive hypothesis $P(n)$, your base case(s), and the assumption and goal in your inductive step.

_Hint:_ $x_1 dot x_2 dots dots x_{n-1} dot x_n = (x_1 dot x_2 dots dots x_{n-1}) dot x_n$

#show regex("(?i)n"): it => [_n_]

_*Proof by Induction n*_

Thm. Suppose $Q(x)$ is a predicate defined $forall x,y in RR$,

$ Q(x y) => (Q(x_1) or Q(x_2) or ... or Q(x_n)) $

Then, for every integer $n >= 1$ and all $x_1, x_2, ...,x_n in RR$,

$ Q(x_1x_2...x_n) => (Q(x_1) or Q(x_2) or ... or Q(x_n)) $

Proof. We use induction on n .

*Base case: n = 1*
Let $x_1 in RR$. We must prove
$ Q(x_1) => Q(x_1) $

This implication is true, since assuming $Q(x_1)$ directly gives $Q(x_1)$. Thus, $P(1)$ holds.

*Inductive Step*
Inductive hypothesis: Assume $P(n-1)$ holds for some integers $n >= 2$. That is $forall x_1,...,x_n-1 in RR$,

*Goal*: Prove $P(n)$, namely, $forall x_1,...,x_n in RR$
$ Q(x_1x_2...x_n-1x_n) => (Q(x_1)or ... or Q(x_n)) $

*Proof of the inductive step*

Assume $Q(x_1x_2...x_n-1x_n)$ is true.

By the given property of Q, applied to $x = x_1x_2...x_n-1$ and $y = x_n$, we obtain
$ Q(x_1x_2...x_n-1) or Q(x_n) $

If $Q(x_1x_2...x_n-1)$ is true, then by the inductive hypothesis, at least one of $Q(n_1),...,Q(x_n-1)$ is true. Hence, at least one of $Q(x_1)...Q(x_n)$ is true.

Otherwise, $Q(x_n)$ is true, so the conclusion follow directly.

Thus, $P(n)$ holds.

By induction, $P(n)$ holds for every integer n >=1.
qed

(b) [5 pts] Consider the following theorem:

*Theorem 1.* _If the product of $n >= 1$ real numbers is irrational, then at least one of those numbers must be irrational._

We will eventually prove this Theorem by citing part (a). In preparation for this, what should we choose for $Q$ from part (a)? What lemma must we prove about your chosen predicate $Q$ before we're allowed to use part (a)?

Choose the predicate $Q(x)$ as:
$ Q(x): x "is irrational" $

Equivalently,$Q(x)$ is true if and only if $x in RR \ QQ$.

Lemma to prove: $forall x, y in RR$, if xy is irrational, then at least one of x or y is irrational.

Symbolically,
$ Q(x y) => (Q(x) or Q(y)) $

*Proof of the _lemma_.* We prove the contrapositive. Suppose both x and y are rational.Then $x = a/b$ and $y = c/d$ for some integers a,b,c,d with b, d != 0. Therefore,

$ x y = a/b times c/d = (a c)/(b d) in QQ $

Thus, if both x and y are rational, their product is rational. Hence, if xy is irrational, at least one of  x or y must be irrational.
qed

Why this lets us use part (a): The lemma establishes the required property of Q. Applying part (a) then shows that if the product of any $n >= 1$  real numbers is irrational, at least one of those numbers is irrational, proving Theorem 1.

(c) [5 pts] Use contradiction to carefully prove the lemma that you identified in part (b), and then finish the proof of Theorem 1.

While proving your lemma, you should _not_ assume any prior knowledge about _irrational_ numbers beyond the definition ("irrational" means "not rational"), but you may use familiar facts about _rational_ numbers.

#show regex("(?i)x"): it => [_x_]
#show regex("(?i)y"): it => [_y_]

*Lemma*

$forall x, y in RR$, if xy is irrational, then at least one of x and y is irrational.

*Proof by _Contradiction_*

Suppose xy is irrational. For a contradiction, assume that neither x nor y is irrational.By the definition of irrational, this mean that both x and y are rational.

Therefore, $exists a,b,c,d, "with" b != 0 "and" d != 0$, such that
$ x = a/b "and" y = c/d $
Then,
$ x y = a/b times c/d = (a c)/(b d) $

Since ac and bd are integers and $b d != 0$, xy is rational by the definition of rational numbers.

However, we assumed that xy is irrational. This is a contradiction.

Therefore, at least one of x or y must be irrational qed

*Proof of Thm 1*

Thm 1. If the product $n >= 1$ real numbers is irrational, then at least one of those numbers must be irrational.

Proof

Define $Q(x)$ to mean that x is irrational.

By the lemma proved above, $forall x, y in RR$,
$ Q(x y) => (Q(x) or Q(y)) $

Thus, _Q_ satisfies the hypothesis required by part (a).

By the result proved in part (a), $forall n n>=1$ and any $x_1,x_2,...,x_n in RR$

$ Q(x_1x_2...x_n) => (Q(x_1) or Q(x_2) or ... or Q(x_n)) $

By the definition of Q, this means that if $x_1x_2...x_n$ is irrational, then at least one of $x_1,x_2,...,x_n$ is irrational.

Therefore, Thm 1 holds. qed
