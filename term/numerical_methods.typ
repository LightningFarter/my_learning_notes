#import "../math_variables_lib.typ": *

#let title = "Numerical Method Cheat Sheet"
#let author = "Jason Chang"
#let email = "jason5738867@gmail.com"
#let show-solutions = true

#set heading(numbering: "1.1.1")

#set page(
    paper: "a4",
    margin: (top: 2.2cm, bottom: 2.2cm, left: 2.2cm, right: 2.2cm),
    header: context [
        #align(center)[
            #title
        ]
    ],
    footer: context [
        #align(center)[
            #current-chapter-title()
            #h(1fr)
            Page #counter(page).display(
                "1/1",
                both: true,
            )
        ]
    ]
)

#set par(justify: true)
#set text(lang: "en")
#show link: underline
#show strong: it => text(weight: "bold")[#it]

#show heading.where(level: 1): it => {
    c-ch.step()
    c-sch.update(0)
    c-thm.update(0)
    c-lem.update(0)
    c-prp.update(0)
    c-cor.update(0)
    c-def.update(0)
    c-ex.update(0)
    c-exr.update(0)
    it
}

#show heading.where(level: 2): it => {
    c-sch.step()
    c-thm.update(0)
    c-lem.update(0)
    c-prp.update(0)
    c-cor.update(0)
    c-def.update(0)
    c-ex.update(0)
    c-exr.update(0)
    it
}

#align(center)[
    #set text(size: 24pt, weight: "bold")
    #title

    #set text(size: 12pt)
    #author , #email
]

#set math.mat(delim: "[")
#set math.vec(delim: "[")

// #outline(title: "Contents")

#c-ch.update(0)

#columns(2, gutter: 15pt)[

    = Floating Points

    == Representation

    $
        x = (-1)^s (1.f)_2 times 2^(e - "bias")
    $
    - *normalized*: leading $1$ implict
    - *denormalized*: no leading $1$ (very small)

    == IEEE Standards

    === Bits

    #table(
        columns: 3,
        "field", "float", "double",
        "sign", $1$, $1$,
        "exponent", $8$, $11$,
        "fraction", $23$, $52$,
        "bias", $127$, $1023$
    )

    === Special Values

    #table(
        columns: 3,
        "exponent", "fraction", "value",
        $0$, $0$, $0$,
        $0$, $!= 0$, "subnormal",
        $111...$, $0$, $plus.minus infinity$,
        $111...$, $!= 0$, "NaN"
    )

    === Properties

    - deterministic rounding
    - portable across machines
    - well-defined overflow/underflow
    - round to nearest (ties to even)
    - exceptions
        - overflow
        - underflow
        - division by zero
        - invalid
        - inexact

    == Errors

    - *base*: $beta$
    - *precision*: $p$
    - *min exponent*: $e_min$
    - *max exponent*: $e_max$
    - *ulps*: unit in the last place
    - *relative error*: $"error"/"original" <= epsilon.alt$
    - *machine epsilon*: $epsilon.alt = 1/2 beta^(-p+1)$
    - *rounding model*: $"fl"(x) = x(1 + delta), h0 |delta| <= epsilon.alt$
    - leading digit cancel $->$ accuracy loss

    == Cancelation

    subtraction of near numbers

    - *gaurd digits*: extra digit in calculation not storage
    - *sticky bit*: check rounding up or down when flushing

    = LU Factorization

    let $A, L, R in bb(R)^(n times n)$ where $L, R$ are upper and lower triangular, then $forall A exists L exists U (A = L U)$
    
    == Pivoted LU

    let $P in bb(R)^(n times n)$ be permutation matrix, then \ $P A = L U$
    - avoid division by small numbers
    - swap rows of $U$ to maximize pivot
    - swap columns of $L$ as $U$ does
    - solve $L y = P b h0 U x = y$

    = Cholesky Factorization (SPD)

    $
        A = L L^t
    $

    == Method 1

    $A = mat(alpha, v^t; v, B)$, then let $B - (v v^t)/alpha = L_B L_B^t$ then
    
    $L = mat(sqrt(alpha), 0; v/sqrt(alpha), L_B)$

    == Method 2

    #raw("
L = [[0] * n] * n
for i in range(n):
    v[i:n] = A[i:n, i
    for j in range(0, j):
        v[i:n] -= L[i, j] * L[i:n, k]
    L[i:n, i] = v[i:n] / sqrt(v(j))", lang: "python")

    = Matrix Condition

    - *condition*: $kappa (A) = ||A|| ||A^(-1)||$
    - *norm*: $||A|| = max_(||x|| = 1) x^t A x$
    
    == Error Propagation

    $
        (||delta x||)/(||x||) <= kappa (A) (||delta b||)/(||b||)
    $

    without $x$
    $
        (||delta x||)/(||x + delta x||) <= kappa (A) (||delta A||) / (||A||)
    $

    = BLAS

    == Levels
    
    #table(
        columns: 3,
        "level", "example", "complexity",
        $1$, [`dot`, `axpy`], $O(n)$,
        $2$, [`gemv`], $O(n^2)$,
        $3$, [`gemm`], $O(n^3)$
    )

    == Key BLAS Syntax

    #raw("cblas_ddot(n, x, 2, y, 1); // dot(x, y)
cblas_daxpy(n, a, x, 1, y, 1); // y = ax + y
cblas_dgemv(CblasRowMajor, CblasNoTrans,
    n, n, alpha, alpha, A, n,
    x, 1, beta, y, 1); // A x + b y
cblas_dnrm2(n, x, 1); // norm(x)
cblas_dgemm(CblasRowMajor, CblasNoTrans,
    CblasNoTrans, n, n, k, alpha, A, k, B,
    n, beta, c, n);
    // c = alpha * A @ B + beta * c", lang: "c")
]

