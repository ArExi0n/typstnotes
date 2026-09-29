#set document(title: "Bayesian Stats")
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

#grid( 
  columns: (1fr, 1fr), align(left)[ 
    Course

    Author
], 
align(right)[ 
  #datetime.today().display("[month repr:long] [day], [year]") 
])

#line(length: 100%, stroke: 0.5pt)
#v(0.3em)

#align(center, text(size: 18pt, weight: "bold")[Bayesian Stats])
#v(1em)
