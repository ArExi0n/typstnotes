#set document(title: "Gradient Vector")
#set page(paper: "us-letter", height: auto, margin: (x: 1.2in, y: 1in))
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
  columns: (5fr, 10fr), align(left)[ 
    The Gradient Vector by
    Michael Brenndoerfer
], 
align(right)[ 
  #datetime.today().display("[month repr:long] [day], [year]") 
])

#line(length: 100%, stroke: 0.5pt)

#align(center, text(size: 18pt, weight: "bold")[Gradient Vector])
#v(1em)

== Introduction

Collecting all partial derivatives of a function into a single vector gives us the gradient,a fundamental object in optimization.

The gradient represents the multivariable generalization of the derivative.

While a single-variable derivative tells us the rate of change in the only direction available, the gradient in multiple dimensions tells us how to combine changes in each direction to achieve the maximum rate of increase.

This makes the gradient more than a collection of sensitivities; it is a directional guide pointing toward improvement.

#block(width: 100%, inset: 10pt , radius: 8pt, stroke: 1pt + rgb("#26384a"))[
  === Gradient

  #v(1pt)

  The gradient of a function $f: RR^n arrow RR$ is a vector of all derivatives

  $
  nabla f =
  lr(
    mat(
      frac(partial f, partial x_1);
      frac(partial f, partial x_2);
      dots.c;
      frac(partial f, partial x_n)
    )
  )
  $

  #v(0.5pt)
  where :

  - $nabla f:$ the gradient operator(nable) applied to $f$, producing a vector
  - $frac(partial f, partial x_i)$ : the partial derivative of $f$ with respect to the $i$-th variable
  - $n$: the dimension of the input space

When $nabla f$ is nonzero, it points in the direction of steepest ascent among Euclidean unit directions.
]

#v(2pt)

== Direction of Steepest Ascent

The gradient's direction has a precise interpretation when it is nonzero: among Euclidean unit directions, $nabla f$/$||nabla f||$ maximizes the directional derivative.

Its magnitude is that maximum first-order rate of increase.

This property makes the gradient the workhorse of optimization algorithms, as we will see shortly.

To understand this result, consider the directional derivative $Dif_u f = nabla f^T_u$ for a Euclidean unit vector $u$.

The Cauchy-Schwarz inequality gives $Dif_u f <= ||nabla f||$, with equality in the normalized gradient direction when the gradient is nonzero; the opposite direction gives steepest descent.

If the gradient is zero, every first-order directional derivative is zero, so no unique steepest direction exists.

== Magnitude and Critical Points

The magnitude of the gradient, computed as $|| nabla f || = sqrt(sum_i (partial f "/" partial x_i)^2)$

tell us how rapidly the function is changing in the steepest direction. A large gradient magnitude indicates a region where the function is changing rapidly;

a small magnitude indicates a relatively flat region.When the gradient magnitude in exactly zero, we have reached a critical point where the function has no preffered direction of change, which typically indicates a local min, max, or saddle point. 
