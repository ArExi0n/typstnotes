#set document(title: "Gradient Vector")
#set page(paper: "us-letter", height: auto, margin: (x: 1.2in, y: 1in))
#set text(font: "New Computer Modern", size: 12pt)
#set par(justify: true, leading: 0.65em)

#let visualization-block(number, image-path, caption) = {
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
            #align(center + horizon)[
              #text(size: 8pt)[▥]
            ]
          ]
          #h(5pt)
          Visualization
        ]
      ],
    )

    #v(10pt)

    #block(
      width: 100%,
      fill: rgb("#eeeeec"),
      radius: 7pt,
      inset: 14pt,
    )[
      #image(
        image-path,
        width: 100%,
      )

      #v(12pt)

      #text(
        size: 10.5pt,
        fill: rgb("#555550"),
      )[
        #caption
      ]
    ]
  ]
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
  columns: (5fr, 10fr),
  align(left)[
    The Gradient Vector by
    Michael Brenndoerfer
  ],
  align(right)[
    #datetime.today().display("[month repr:long] [day], [year]")
  ],
)

#line(length: 100%, stroke: 0.5pt)

#align(center, text(size: 18pt, weight: "bold")[Gradient Vector])
#v(1em)

== Introduction

Collecting all partial derivatives of a function into a single vector gives us the gradient, a fundamental object in optimization.

The gradient represents the multivariable generalization of the derivative.

While a single-variable derivative tells us the rate of change in the only direction available, the gradient in multiple dimensions tells us how to combine changes in each direction to achieve the maximum rate of increase.

This makes the gradient more than a collection of sensitivities; it is a directional guide pointing toward improvement.

#block(width: 100%, inset: 10pt, radius: 8pt, stroke: 1pt + rgb("#26384a"))[
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

  - $nabla f:$ the gradient operator (nabla) applied to $f$, producing a vector
  - $frac(partial f, partial x_i)$ : the partial derivative of $f$ with respect to the $i$-th variable
  - $n$: the dimension of the input space

When $nabla f$ is nonzero, it points in the direction of steepest ascent among Euclidean unit directions.
]

#v(2pt)

== Direction of Steepest Ascent

The gradient's direction has a precise interpretation when it is nonzero: among Euclidean unit directions, $(nabla f)/(||nabla f||)$ maximizes the directional derivative.

Its magnitude is that maximum first-order rate of increase.

This property makes the gradient the workhorse of optimization algorithms, as we will see shortly.

To understand this result, consider the directional derivative $D_u f = nabla f dot u$ for a Euclidean unit vector $u$.

The Cauchy-Schwarz inequality gives $D_u f <= ||nabla f||$, with equality in the normalized gradient direction when the gradient is nonzero; the opposite direction gives steepest descent.

If the gradient is zero, every first-order directional derivative is zero, so no unique steepest direction exists.

The magnitude of the gradient, computed as $|| nabla f || = sqrt(sum_i (frac(partial f, partial x_i))^2)$

Tell us how rapidly the function is changing in the steepest direction. A large gradient magnitude indicates a region where the function is changing rapidly;
a small magnitude indicates a relatively flat region. When the gradient magnitude is exactly zero, we have reached a critical point where the function has no preferred direction of change, which typically indicates a local min, max, or saddle point.

#code-block(7)[
```rust
fn f(x: f64, y: f64) -> f64 {
    x.powi(2) + 2.0 * y.powi(2) - 2.0 * x * y
        + 4.0 * x - 6.0 * y
}

fn gradient_f(x: f64, y: f64) -> [f64; 2] {
    let df_dx = 2.0 * x - 2.0 * y + 4.0;
    let df_dy = 4.0 * y - 2.0 * x - 6.0;

    [df_dx, df_dy]
}

fn main() {
    let point = [1.0, 2.0];

    let value = f(point[0], point[1]);
    let grad = gradient_f(point[0], point[1]);

    let magnitude =
        (grad[0].powi(2) + grad[1].powi(2)).sqrt();

    println!(
        "Function value at ({:.0}, {:.0}): {:.2}",
        point[0], point[1], value
    );

    println!(
        "Gradient at ({:.0}, {:.0}): [{:.2}, {:.2}]",
        point[0], point[1], grad[0], grad[1]
    );

    println!("Gradient magnitude: {:.2}", magnitude);
  }
```
]

#output-block(8)[
  Function value at (1, 2): -3.00\
  Gradient at (1, 2): [2.00, 0.00]\
  Gradient Magnitude: 2.00
]

The gradient at (1, 2) is [2,0] meaning the function increases most rapidly in the positive _x_ direction at that point, with no change in the _y_ direction. This tells us that from (1,2) moving in the positive _x_ direction increases the function value, while moving in the positive _y_ direction has no first order effect.

The fact that the y-component of the gradient is zero at this point reveals that we are on a ridge or "valley" in the y-direction.

The function is neither increasing nor decreasing as we vary _y_ while holding _x_ fixed at 1. This doesn't mean we're at the optimum; it just means we're at a stationary point with respect to _y_ at this particular x-value. 

To find the true minimum, we need to find a point where both components of the gradients are zero simultaneously.

#visualization-block(
  9,
  "gradient-vector.png",
  [
    Gradient vector field overlaid on function contours.
    Arrows point in the direction of steepest ascent; their
    lengths are normalized for readability, while color encodes
    gradient magnitude. The gradient is perpendicular to contour lines.
  ],
)
