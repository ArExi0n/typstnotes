#set document(title: "Partial Derivates")
#set page(paper: "us-letter", margin: (x: 1.2in, y: 1in))
#set text(font: "New Computer Modern", size: 12pt)
#set par(justify: true, leading: 0.65em)

#show heading.where(level: 1): it => {
  v(0.2em)
  text(size: 16pt, weight: "bold", it.body)
  v(0.4em)
}

#show heading.where(level: 2): it => {
  v(0.8em)
  text(size: 12pt, weight: "bold", it.body)
  v(0.3em)
}

#grid( 
columns: (1fr, 1fr), align(left)[ 
  Differential Calc and Optimization Basics
  Multi-Variable Calc
], 
align(right)[ 
  #datetime.today().display("[month repr:long] [day], [year]") 
])

#line(length: 100%, stroke: 0.5pt)

#align(center, text(size: 18pt, weight: "bold")[Partial Derivatives])

#v(0.2em)

= Introduction 

When a function depends on multi-variables, the partial derivative measures the rate of change with respect to one variable while holding all other constant.

#block(width: 100%, inset: 20pt , radius: 8pt, stroke: 1pt + rgb("#26384a"))[ 

  #v(12pt)

  For a function $f(x_1,x_2,…,x_n)$, the partial derivative with respect to $x_i$ is:

  #v(14pt)

  #align(center)[
    $
    frac(partial f, partial x_i)
    =
    lim_(h -> 0)
    frac(
      f(x_1, ..., x_i + h, ..., x_i)
      -
      f(x_1, ..., x_i, ..., x_n)
      ,h
    )
    $
  ]

  #v(18pt)

  #text(size: 14pt)[where:]

  #v(6pt)

  - $x_i$: the variables with respect to which we differentiate
  - $h$: a small increment approaching zero
  - $x_1, ..., x_n$: all other variables, held constant during differentiation

    #v(18pt)

We treat all variables except $x_i$ as constant and differentiate normally.

]

The notation $frac(partial f, partial x_i)$ uses the curly "partial" symbol $partial$ rather than the regular "d" used in single variable calculus. This notational distinction is a reminder that we are holding other variables fixed. The computation itself follows the same rules as ordinary differentiation: we simply treat the other variables as constants and differentiate with respect to the variables of interest.

#v(0.6em)

Consider a simple two-asset portfolio where total return _R_ depends on the returns $r_1$ and $r_2$ of each asset and their weights $w_1$ and $w_2$:

$
R(w_1,w_2,r_1,r_2) = w_1r_1 + w_2r_2
$

The partial derivatives tell us how sensitive total return is to each input:

$
frac(partial R,partial w_1) = r_1,
frac(partial R, partial r_1) = w_1
$

The first equation says that the sensitivity of portfolio return to the first asset weight is the return of the first asset. The second equation says that the sensitivity of portfolio return to the first asset return is the weight of the first asset.

#v(0.8em)

These results have immediate practical interpretations. Holding $w_2$ fixed, increasing $w_1$ by 0.01 changes portfolio return by $0.01r_1$ but also increases net exposure and therefore requires additional financing. In a fully invested two-asset portfolio, $w_2 = 1-w_1$, so the relevant reallocation derivative is $frac(dif R, dif w_1) = r_1 - r_2$: shifting 0.01 from asset 2 to asset 1 changes return by 0.01$(r_1−r_2)$. Separately, if asset 1's return changes by 0.01 while its weight is 0.40, portfolio return changes by 0.004, or 0.4 percentage points. The same local linearization idea also appears in factor-based risk decompositions.
