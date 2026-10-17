#set document(title: "Bayes Theorem")
#set page(paper: "us-letter", margin: (x: 1.2in, y: 1in))
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

#let code-block(number, body) = {
  block(
    width: 100%,
    fill: rgb("#EDEDED"),
    stroke: 1pt + rgb("#EDEDED"),
    radius: 10pt,
    inset: 14pt,
  )[
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      [
        #text(
          size: 8pt,
          fill: rgb("#777773"),
          weight: "bold",
        )[IN [#number]:]
      ],
      [
        #text(
          size: 9pt,
          fill: rgb("#aaa9a3"),
        )[</> Code]
      ],
    )

    #v(12pt)

    #show raw.where(block: true): block.with(
      width: 100%,
      fill: rgb("#E7E7E9"),
      radius: 6pt,
      inset: 10pt,
      stroke: none,
    )

    #show raw: set text(
      fill: rgb("#282c34"),
      size: 9pt,
    )

    #body
  ]
}

#let output-block(number, body) = {
  block(
    width: 100%,
    fill: rgb("#f5f5f3"),
    radius: 14pt,
    inset: 14pt,
  )[
    #grid(
      columns: (1fr, auto),
      align: (left, horizon),

      [
        #text(
          fill: rgb("#777771"),
          size: 11pt,
          font: "JetBrains Mono",
        )[
          OUT [#number]:
        ]
      ],

      [
        #text(
          fill: rgb("#777771"),
          size: 11pt,
          font: "JetBrains Mono",
        )[
          #box(
            width: 13pt,
            height: 13pt,
            stroke: 1pt + rgb("#777771"),
            radius: 2pt,
            inset: 1pt,
          )[
            #align(center + horizon)[#">_"]
          ]
          #h(5pt)
          Console
        ]
      ],
    )

    #v(10pt)

    #block(
      width: 100%,
      fill: rgb("#eeeeec"),
      radius: 7pt,
      inset: (x: 17pt, y: 16pt),
    )[
      #set text(
        font: "JetBrains Mono",
        size: 12pt,
        fill: rgb("#3f3f3b"),
      )

      #body
    ]
  ]
}

#grid(
  columns: (1fr, 1fr),
  align(left)[
    Probability Theory
  ],
  align(right)[
    #datetime.today().display("[month repr:long] [day], [year]")
  ],
)

#let def = text(style: "italic", [definition:])
#let proof = text(style: "italic", [proof:])

#show regex("Bayes Thm"): it => [$ P(A | B) = frac(P(B | A) times P(A), P(B)) $]

#line(length: 100%, stroke: 0.5pt)

#v(0.3em)

#align(center, text(size: 18pt, weight: "bold")[Bayes's Theorem])
#v(1em)

Bayes' Theorem provides a systematic way of updating probabilities when new information arrives, establishing the mathematical basis for learning from data and adapting beliefs.


#block(width: 100%, inset: 10pt, radius: 8pt, stroke: 1pt + rgb("#26384a"))[
  === Bayes' Theorem
  $
    P(A | B) = frac(P(B | A) times P(A), P(B))
  $

  #v(1em)

  - $P(A | B)$: posterior probability of event A given evidence B
  - $P(A | B)$: likelihood of observing _B_ if _A_ is true
  - $P(A)$: prior probability of event _A_ before observing _B_
  - $P(B)$: marginal probability of B (normalizing constant)

  #v(2em)
  In words: the probability of A given B equals the probability of B given A, times the prior probability of A, divided by the probability of B.
]

Bayes' Theorem follows directly from the definition of conditional probability applied twice. Starting from $P(A|B) = P(A union B)/P(B)$ and noting that $P(A union B) = P(B|A) times P(A)$ (by rearranging the conditional probability definition for B given A), we obtain the theorem. Despite this simple derivation, the theorem has practical implications for reasoning under uncertainty.

The components have specific names that reflect their roles in the updating process:

#v(1em)

- _P(A)_: Prior probability, representing our belief about A before observing B
- _P(B∣A)_: Likelihood, measuring how probable the evidence B is if A is true
- _P(A∣B)_: Posterior probability, representing our updated belief about A after observing B
- _P(B)_: Evidence probability, which is a normalizing constant

#v(1em)

Once a prior and likelihood model are specified, the theorem provides the rule for computing the posterior after observing evidence. The posterior can then become the prior for the next round of updating as more evidence arrives.

== Updating Default Probabilities

A bank is evaluating a corporate borrower. Based on the firm's industry and size, the bank initially estimates 3% probability by default within one year. This is the prior probability

The bank then receives the firm's quarterly financial statements showing deteriorating profit margins. Historical estimates from a comparable borrower cohort, measured at the same observation point before a one-year forecast horizon, show:

- 40% of companies that defaulted within the following year showed deteriorating margins at the observation date

- 10% of companies that did not default within that same year showed deteriorating margins at the observation date

The bank wants to update its default probability given this new information.

*Step 1: Define events*

- D = company defaults within one year
- M = company shows deteriorating margins

*Step 2: List know probabilities*

- $P(D) = 0.03$  prior default probabilities
- $P(D^C) = 0.97$  prior probability of no default
- $P(M|D)=0.40$  likelihood of margin deterioration given default
- $P(M|D^C)=0.10$  likelihood of margin deterioration given default

*Step 3:Calculate _P(M)_ using the law of total probability*

Before applying Bayes' Theorem, we need the total probability of observing deteriorating margins, regardless of whether default occurs.

The law of total probability provides this by considering all mutually exclusive ways the evidence could arise:

$
  P(M) = P(M|D) times P(D) + P(M|D^C) times P(D^C)
$

#v(1em)
where:

- $P(M)$ : total probability of observing deteriorating  margins
- $P(M | D)$: probability of deteriorating margins given the company default
- $P(D)$: prior probability of default
- $P(M|D^c)$: probability of deteriorating margins given to no default
- $P(D^C)$: probability of no default

This formula works because every company either defaults or doesn't, so we can decompose the probability of deteriorating margins into these two mutually exclusive cases. We weight each conditional probability by the probability of that case occurring. The law of total probability essentially averages the conditional probabilities, weighted by the probability of each conditioning event.

#code-block(1)[
  ```rust
  fn main() {
    let p_defaults: f64 = 0.03;
    let p_no_defaults: f64 = 0.97;

    let p_margin_given_default: f64 = 0.40;
    let p_margin_given_no_default: f64 = 0.10;

    let p_margin = p_margin_given_default * p_default
    + p_margin_given_no_default * p_no_default;

    println!("P(M) = {:.4}", p_margin);
  }
  ```
]

#output-block(1)[
  ```
  P(M) = 0.1090
  ```
]

*Step4: Apply Bayes' Theorem*

Now we have all the ingredients to compute the posterior probability:

$
  P(M|D) = (P(M|D) times P(D))/(P(M))
$
where:

#v(2em)
- $P(D∣M)$: posterior probability of default given deteriorating margins (what we want to find)
- $P(M∣D)$: likelihood of deteriorating margins among defaulting companies (0.40)
- $P(D)$: prior default probability (0.03)
- $P(M)$: probability of deteriorating margins (calculated in Step 3)

The numerator P(M∣D)⋅P(D) represents the probability of both defaulting and showing deteriorating margins. The denominator normalizes this by dividing by the total probability of the evidence.

#code-block(2)[
  ```rust
  fn main() {
    let mut p_default_given_margin = (p_margin_given_default * p_default) / p_margin
  }
  ```
]

#output-block(2)[
  ```
  P(Default | Deteriorating Margins) = (0.4 × 0.03) / 0.1090
  P(Default | Deteriorating Margins) = 0.1101

  Updated default probability: 11.01%
  Prior default probability: 3.00%
  Increase factor: 3.7x
  ```
]

The deteriorating margins more than tripled our assessed default probability from 3% to about 11%. This updated probability should inform lending decisions, pricing, and reserve requirements. The magnitude of this update reflects both the strength of the evidence, since deteriorating margins are much more common among defaulters, and the prior belief that default was already considered unlikely.

