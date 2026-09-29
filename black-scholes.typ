#set text(font: "JetBrainsMono NFP", size: 13pt)
#set par(justify: true, leading: 0.35em)

#set page(paper: "iso-b4", margin: (x: 1in, y: 1in))
#show heading.where(level: 1): it => {
  v(1em)
  text(size: 14pt, weight: "bold", it.body)
  v(0.3em)
}

#align(center, text(size: 20pt, weight: "semibold", font: "New Computer Modern")[Black-Scholes Model])

= Black-Scholes Model

A mathematical formula deigned to price an option as a function of certain variables generally stock price, striking price, volatility, time to expiration, dividend to be paid and the current risk-free interest rate.

The model assumes that the stock price follows a geometric Brownian motion with constant drift and volatility.

- Developed by Fischer Black, Myron Scholes and Robert Merton in 1973.

= Stochastic Differential Equations

Let ($Omega$,F ,P) be a probability space and let $X_t$, $T epsilon R_+$ be a stochastic process X: $Omega * R_t arrow R$.

Moreover, assume that a$(X_t, t): Omega * R * R_+ arrow R$
and b($X_t, t$): $Omega * R * R_+ arrow R$ are stochastically
integrable functions of $t epsilon R_+$ Then equations

$
  dif X_t =
  a(X_t, t) dif t +
  b(X_t, t) dif W_t
$ <eq:sde>

is called stochastic differential equations.

Note <eq:sde> has to be understood as symbolic notation of the stochastic integral equations

$
  X_t = X_0
  + integral_0^t a(X_s, s)dif s
  + integral_0^t b(X_s,t)dif W_s
$

The functions $a(X_t, t)$ and $b(X_t, t)$ are called drift and
the diffusion term respectively.

= Itô Process
A stochastic process $X_t$ is called an Itô process if it satisfies the equations,

$
  dif X_t = a(X_t, t) dif t + b(X_t, t) dif W_t
$

is called stochastic differential equations.

Note that <eq:sde> has to be understood as a symbolic notation of the stochastic integral equation

$
  X_t = X_0 + integral^t_0 a(X_s, s)dif s + integral^t_0b(X_s,s)dif W_s
$

The functions $a(X_t,t) and b(X_t,t)$ are referred to as the drift term and the diffusion term respectively.

= Itô Integral

Assume that $b = b(t)$ is a stochastic integral function in the sense that there exists a sequence $b_n epsilon N$ of a simple processes such that

$
  lim_( n -> infinity)
  E(integral_0^T (b(t) - b_n (t))^2 dif t) = 0
$

Then, the Itô integral of b is defined as

$
  integral^T_0 b(t)dif W_t = lim_(n -> infinity) integral_0^T b_n (t)dif W_t
$

= Itô Lemma

Let $X_t, t epsilon R_+$ be an Itô process $X : Omega * R_+ arrow R$ and $f := C^2(R * R_+ * R_+)$.
Then, the stochastic process $f_t := f (X_t,t)$ is also an Itô process which satisfies

$
  upright(d) f_t =
  (
    frac(partial f, partial t)
    + a frac(partial f, partial x)
    + 1/2 b^2 frac(partial^2 f, partial x^2)
  )
  upright(d) t
  +
  frac(partial f, partial x)
  upright(d) W_t
$

*Proof*: By Taylor's series of expansion of *f*$ (X_t+Delta t, t + Delta t$ about $(X_t, t)$ #h(1fr) $square$

$
f(X_(t + Delta t), t + Delta t)
  = f(X_t, t)
  + frac(partial f, partial t)(X_t, t)(Delta t)
  + frac(partial f, partial x)(X_t, t)(X_(t + Delta t) - X_t)
  + frac(1, 2) frac(partial^2 f, partial t^2)(X_t, t)(Delta t)^2
  \
  + frac(1, 2) frac(partial^2 f, partial x^2)(X_t, t)(X_(t + Delta t) - X_t)^2
  + frac(partial^2 f, partial x partial t)(X_t, t)(Delta t)(X_(t + Delta t) - X_t)
  + O((Delta t)^2)
  \
  + O(Delta t)(X_(t + Delta t) - X_t)^2
  + O((X_(t + Delta t) - X_t)^3)
$

Taking, limit as $Delta t arrow 0$ gives

$
  dif f_t = 
  frac(partial f, partial t)dif t 
  + frac(partial f, partial x)dif X_t
  + frac(1 partial^2 f, 2 partial X^2)dif X_t^2
  + O((dif t)^2) + O(dif t(dif X_t)^2) + O((dif X_t)^3)
$

Consider $X_t$ is an Itô's process and d$W_t^2$ = dt, then form equation 4, we get 

$
  dif X_t^2 = (a dif t + b dif W_t)^2
  a^2(dif t)^2 + 2a b dif t dif W_t 
  + b^2 dif W_t^2 = b^2 dif t + O((dif t)^(3/2))
$

From equation 4 and 5, we get

$
  dif t_t = frac(partial f, partial t)dif t 
  + frac(partial f, partial x)(a dif t + b dif W_t)
  + 1/2 b^2 frac(partial^2 f,partial x^2)dif t
$

$
  dif f_t = frac(partial f, partial t) dif t + a frac(partial f, partial x)) + 1/2 b^2 frac(partial^2 f ,partial x^2)dif t
  + b frac(partial f, partial x)dif W_t
$

Where $W_t$ is a Wiener process.

= Black-Scholes Partial Differential Equations

