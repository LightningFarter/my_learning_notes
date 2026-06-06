#import "@local/mylib:0.1.0": math_variables_lib
#import math_variables_lib: *

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
    - *norm*: $||A|| = max_(||x|| = 1) ||A x||$
    - *2-norm*: $kappa_2 (A) = (sigma_max (A)) / (sigma_min (A))$
    
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

    = Iterative Methods

    == Sparse Storage

    - *COO format*: $("value", "row", "col")$
    - *CSC format*: $("value", "row_ind", "col_ptr")$
    - *CSR format*: $("value", "col_ind", "row_ptr")$

    == Stationary Iterative Method

    $
        A = M - N quad A x = b quad M x = N x + b \
        x^((k+1)) = M^(-1)N x^((k)) + M^(-1) b quad G = M^(-1) N \
        "error:" e^((k+1)) = G e^((k)) = G^k e^((0)) \
        "converge:" rho (G) = max |lambda(G)| < 1
    $

    == Jacobi Method

    $
        A = L + D + U \
        D x^((k+1)) = b - (L + U) x^((k)) \
        x_i^((k +1)) = (b_i - sum_(j!=i) a_(i j) x_j^((k))) / (a_(i i))
    $

    == Gauss-Seidel Method

    $
        (D + L) x^((k + 1)) = b - U x^((k)) \
        x_i^((k + 1)) = (b_i - sum_(j < i) a_(i j) x_j^((k + 1)) - sum_(j > i) a_(i j) x_j^((k))) / (a_(i i))
    $

    == Conjugate Gradient Method

    for $A = A^t succ 0$
    $
        A x = b <=> min_x f(x) quad f(x) = 1/2 x^t A x - b^t x \
        "residual: " r_k = b - A x_k = - nabla f(x_k) \
        A"-conjugacy: " p_i^t A p_j = 0 quad i != j \
        x_k = x_(k - 1) + alpha_k p_k quad r_k = r_(k - 1) - alpha_k A p_k \
        "step size: " alpha_k = (r_(k - 1)^t r_(k - 1)) / (p_k^t A p_k) \
        "direction: " p_k = r_(k-1) + beta_k p_(k - 1) quad
        beta_k = (r_(k - 1)^t r_(k - 1)) / (r_(k - 2)^t r_(k - 2)) \
        "residual orthogonality: " r_i^t r_j = 0 quad i != j \
        x_k = argmin_(x in x_0 + cal(K)_k (A, r_0)) f(x) \
        cal(K)_k (A, r_0) = span{r_0, A r_0, dots, A^(k - 1) r_0} \
        "Converge: " ||x - x_k||_A <= 2 ||x - x_0||_A ((sqrt(kappa) - 1) / (sqrt(kappa) + 1))^k \
        "precondition: " M approx A quad M^(-1) A x = M^(-1) b  \
        kappa(M^(-1) A) << kappa(A)
    $

    = Nonlinear Equations

    - *solve* $f(x) = 0$
    - *root* $f(x^*) = 0$
    - *error* $e_k = x_k - x^*$

    == Convergence rates

    #grid(
        columns: (1fr, 1fr),
        [
            - *linear* $
                lim_(k -> infinity) (|e_(k + 1)|) / (|e_k|) <= r < 1
            $
            - *superlinear* $
                lim_(k -> infinity) (|e_(k + 1)|) / (|e_k|) = 0
            $
        ],
        [
            - *Quadratic* $
                lim_(k -> infinity) (|e_(k+1)|) / (|e_k|^2) <= r \
                "or" |e_(k + 1)| <= C |e_k|^2
            $
        ]
    )

    == Bisection

    $
        "assume" f in C[a, b] quad f(a) f(b) < 0 \
        "midpoint" c = (a + b) / 2 \
        cases(
            b <- c quad & f(a) f(c) < 0,
            a <- c quad & f(a) f(c) > 0
        ) \
        "error" |c_k - x^*| <= (b_0 - a_0) / (2^(k+1))
    $

    == Fixed-point iteration

    $
        "rewrite" f(x) = 0 <=> x = g(x) \
        x_(k + 1) = g(x_k) \
        "local converge" |g'(x)| <= q < 1 \
        "error" e_(k + 1) = g' (xi_k) e_k
    $

    == Newton method

    $
        "approx" f(x_k) + f'(x_k) (x_(k + 1) - x_k) approx 0 \
        x_(k + 1) = x_k - (f(x_k)) / (f'(x_k)) \
        "quadratic converge: " f(x^*) = 0, f'(x) != 0 \
        f' "Lipschitz:" |f'(y) - f'(x)| <= alpha |y - x| \
        |e(y, x)| <= 1/2 alpha |y - x|^2 \
        "error " x_(k + 1) - x^* = f'(x_k)^(-1) e(x^*, x_k) \
        "bound " |x_(k+1) - x^*| <= delta |x_k - x^*|^2 \
        "multiple root" f(x) = (x - r)^m \
        => e_(k + 1) = (1 - 1/m) e_k "linear"
    $

    == Secant method

    $
        "approx" f'(x_k) approx (f(x_k) - f(x_(k - 1))) / (x_k - x_(k - 1)) \
        x_(k + 1) = x_k - (f(x_k) (x_k - (x_(k - 1)))) / f(x_k) - f(x_(k - 1)) \ 
        "order " p = phi = (1 + sqrt(5)) / 2
    $

    == Stopping rules

    $
        "residual" |f(x_k)| <= epsilon_f \
        "step" |x_(k + 1) - x_k| <= epsilon_x (1 + |x_(k + 1)|) \
        "iteration cap" k >= k_max \
        "root error near simple root:" \
        => f(x_k) = f'(x^*) e_k + O(e_k^2) \
        => |e_k| = (|f(x_k)|) / (|f'(x^*)|)
    $

    = Approximation

    == Cubic spline interpolation

    given nodes $x_0 < dots < x_n$ and $y_j = f(x_j)$ \
    on interval $[x_j, x_(j + 1)]:$ \
    $
        s_j(x) = a_j + b_j (x - x_j) + c(x - x_j)^2 + d_j (x - x_j)^3
    $
    conditions:
    $
        s_j (x_j) = y_j quad s_j (x_(j + 1)) = s_(j + 1) (x_(j + 1)) \
        s'_j (x_(j + 1)) = s'_(j + 1) (x_(j + 1)) quad s''_j (x_(j + 1)) = s''_(j + 1) (x_(j + 1)) \
        "natural boundary" c_0 = 0 quad c_n = 0 \
        "clamped boundary" s'_0 (x_0) = alpha quad s'_(n - 1)(x_n) = beta \
        "define" h_j = x_(j + 1) - x_j quad a_j = y_j \
        h_(j - 1) c_(j - 1) + 2 (h_(j - 1) + h_j) c_j + h_j c_(j + 1) \ = 3/(h_j) (a_(j + 1) - a_j) - 3 / (h_(j - 1)) (a_j - a_(j - 1)) \
        "left " 2 h_0 c_0 + h_0 c_1 = 3((a_1 - a_0) / h_0 - alpha) \
        "right " h_(n - 1) c_(n - 1) + 2 h_(n - 1) c_n = 3 (beta - (a_n - a_(n - 1)) / (h_(n - 1))) \
        "after" c: quad b_j = (a_(j + 1) - a_j) / (h_j) - (h_j) / 3 (2 c_j + c_(j + 1)) \
        d_j = (c_(j + 1) - c_j) / (3 h_j)
    $

    == Least-squares regression

    $
        "fit " f(x) = a^t x + b \
        "data " (x_i, y_i) quad x_i in bb(R)^m \
        "objective " E(a, b) = sum_(i = 1)^n (y_i - (a^t x_i + b))^2 \
        "define" S_(x x) = sum_(i = 1)^n x_i x_i^t quad S_x = sum_(i = 1)^n x_i \
        => S_(x y) = sum_(i = 1)^n y_i x_i quad S_y = sum_(i = 1)^n y_i \
        mat(S_(x x), S_x; S_x^t, n) mat(a ; b) = mat(S_(x y) ; S_y) \
        "augmented" overline(x)_i = mat(x_i; 1) quad overline(a) = mat(a ; b) \
        => S_(overline(x) overline(x)) overline(a) = S_(y overline(x)) \
        "least square " min_theta ||y - X theta||_2^2 \
        "normal equation " X^t X theta = X^t y \
        "residual " r = y - X hat(theta) \
        "orthogonality " X^t r = 0 \
        "prefer QR/SVD when X is ill-conditioned:" \
        => kappa(X^t X) = kappa(X)^2
    $

    = Fourier Approximation & FFT

    == continuous trigonometric approximation

    $
        phi.alt_0 (x) = 1 / 2 \
        phi.alt_k = cos k x quad k = 1, dots, n \
        phi.alt_(n + k) = sin k x quad k = 1, dots, n - 1 \
        S_n (x) = (a_0) / 2 + a_n cos n x + sum_(k = 1)^(n - 1) (a_k cos k x + b_k sin k x) \
        a_k = 1 / pi integral_(- pi)^pi f(x) cos k x d x quad k = 0, dots, n \
        b_k = 1 / pi integral_(- pi)^pi f(x) sin k x d x quad k = 1, dots, n - 1
    $

    == Discrete trigonometric approximation

    $
        "use" 2m "points " x_j = -pi + j / m pi quad j = 0, dots, 2 m - 1 \
        "num data points " N = 2 m \
        "polynomial order: " n "highest frequency used" \
        min_(a, b) sum_(j = 0)^(2 m - 1) (y_j - S_n (x_j))^2 \
        a_k = 1 / m sum_(j = 0)^(2 m - 1) y_j cos(k x_j) quad k = 0, dots, n \
        b_k = 1 / m sum_(j = 0)^(2 m - 1) y_j sin(k x_j) quad k = 1, dots, n - 1 \
        "if " n = m " highest cosine half weight:" \
        => S_m (x) = (a_0) / 2 + (a_m cos (m x)) / 2 + sum_(k = 1)^(m - 1) (a_k cos k x + b_k sin k x)
    $

    == DFT

    $
        "let" w_N = e^((- 2 pi i) / N) \
        Y_k = sum_(j = 0)^(N - 1) y_j w_N^(k j) quad k = 0, dots, N - 1 \
        "matrix form " Y = F_N y quad (F_N)_(k j) = w_N^(k j) \
        "inverse DFT " y_j = 1 / N sum_(k = 0)^(N - 1) Y_k w_N^(- k j) \
        "direct cost" O(N^2) quad "FFT cost" O(N log N)
    $

    == Recursive radix-2 FFT
    
    $
        & E_k <- sum_(r = 0)^(N / 2 - 1) y_(2 r) w_(N / 2)^(k r) \
        & O_k <- sum_(r = 0)^(N / 2 - 1) y_(2 r + 1) w_(N / 2)^(k r) \
        & Y_k <- E_k + w_N^k O_k \
        & Y_(k + N / 2) <- E_k - w_N^k O_k
    $

    == Iterative radix-2 FFT

    
    $
        & "assume" N = 2^q \
        & X <- sigma_"bit-reverse" y \
        & "for each layer" L = 2, 4, 8, dots, N \
        & h0 "for each block-start" = 0, L, 2 L, dots, N - L \
        & h0 h0 "for" j = 0, dots, L / 2 - 1 \
        & h0 h0 h0 w <- e^(- 2 pi i j / L) \
        & h0 h0 h0 u <- X_l \
        & h0 h0 h0 v <- w_L^j X_r \
        & h0 h0 h0 X_l <- u + v \
        & h0 h0 h0 X_r <- u - v \
    $
]

