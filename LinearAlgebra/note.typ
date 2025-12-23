#import "../math_variables_lib.typ": *

#let title = "Linear Algebra Note"
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

#outline(title: "Contents")

#c-ch.update(0)

#pagebreak()

= Linear Equations

== Fields

Let $bb(F)$ be a field, must satisfy:

#definition([
    $
        & x + y = y + x  h1 forall x , y in bb(F) \
        & x + (y + z) = (x + y) + z h1 forall x, y, z in bb(F) \
        & exists excl s0 0 in bb(F) suchthat x + 0 = x h1 forall x in bb(F) \
        & forall x in bb(F) s0 exists s0 (-x) suchthat x + (-x) = 0 \
        & x y = y x h0 forall x, y in bb(F) \
        & x (y z) = (x y) z h0 forall x, y, z in bb(F) \
        & exists excl s0 1 in bb(F) suchthat x 1 = x h0 forall x in bb(F) \
        & forall x eq.not 0, x in bb(F), s0 exists s0 x^(-1) suchthat x x^(-1) = 1 \
        & x (y + z) = x y + x z h0 forall x, y, z in bb(F) \
    $
]) <field_axioms>

== Systems of Linear Equations

*Linear equations* has form of:

#example([
    $
        & A_(1 1) x_1 + A_(1 2) x_2 + dots + A_(1 n) x_n h0 = y_1 \
        & A_(2 1) x_1 + A_(2 2) x_2 + dots + A_(2 n) x_n h0 = y_2 \
        & h0 dots.v h1 h0 dots.v h1 h1 dots.v h2 s0 dots.v \
        & A_(m 1) x_1 + A_(m 2) x_2 + dots + A_(m n) x_n = y_m
    $
]) <linear_equation_example>

If $y_1 = y_2 = dots = y_m = 0$ is a solution, the system is *homogeneous*.

*Linear Combination* has form of:

#example([
    $
        ( c_1 A_(1 1) + dots + c_m A_(m 1) ) x_1 + dots + (c_1 A_(1 n) + dots + c_m A_(m n) ) x_n = c_1 y_1 + dots + c_m y_m
    $
]) <linear_combination_example>

Linear equations are *equivalent* if each equation is linear combination of other in each system.

#theorem([
    Equivalent systems of linear equations have exactly the same solutions.
]) <linear_equation_equivilance_theorem>

#exercise([
    + if two homogeneous of linear equation in two unknowns have same solution, they are equivalent
    + each subfield of complex number contains every rational number
    + each field of characteristic $0$ contains  rational number field
]) <exercise_linear_equations>

== Matrics and Elementary Row Operations

We could abbreviate Linear system of #exref(<linear_equation_example>) as $A X = Y$ where
$
    A = mat(A_(1 1), dots, A_(1 n) ; 
        dots.v , , dots.v ;
        A_(m 1), dots, A_(m n)
    ) h1
    X = vec(x_1, dots.v, x_n) h1
    Y = vec(y_1, dots.v, y_n)
$
$A$ is the *matrix of coefficients*

#definition(title: "Elementary Row Operation", [
    + $e(A)_(i j) = A_(i j) h0 mif i eq.not r h0 e(A)_(r j) = c A_(r j)$
    + $e(A)_(i j) = A_(i j) h0 mif i eq.not r h0 e(A)_(r j) = A_(r j) + c A_(s j)$
    + $e(A)_(i j) = A_(i j) h0 mif i eq.not r and i eq.not s h0 e(A)_(r j) = A_(s j) h0 e(A)_(s j) = A_(r j)$
]) <elementary_row_operation_definition>

#theorem([
    $
        "let" E "be set of all elementary row operations" \
        forall e in E s0 exists s0 e' in E suchthat e'(e(A)) = e(e'(A)) = A
    $
]) <elementary_row_operation_exists_inverse_theorem>

#definition(title: "Row-Equivalent", [
    for $A, B in bb(F)^(m times n)$, $B$ is row-equivalent to $A$ if $B$ is obtainable from a series of elementary row operations from $A$
]) <row_equivalent_definition>

#theorem([
    if $A, B in bb(F)^(m times n)$ are row-equivalent, then homogeneous system $A X = 0, s0 B X = 0$ has exact same solution
]) <homogeneous_row_equivalent_theorem>

#definition(title: "Row-Reduced", [
    + first non-zero entry in each non-zero row is equal to $1$
    + column having some row's first non-zero entry must have all other entries $0$
]) <row_reduced_definition>

#definition(title: "Identity Matrics", [
    $
        I_(i j) = delta_(i j) = cases(
            1 mif i = j,
            0 mif i eq.not j
        )
    $
    the $delta$ is called *Kronecker Delta*
]) <identity_matrics_definition>

#theorem([
    every $m times n$ matrix over $bb(F)$ is row-equivalent to a row-reduced matrix
]) <row_reduced_equivalent_theorem>

#exercise([
    + interchange of two rows can be acomplished by a finite series of other two type of row operations
]) <exercise_row_operations>

== Row-Reduced Echelon Matrics

#definition(title: "Row-Reduced Echelon", [
    for $R in bb(F)^(m times n)$ to be row-reduced echelon:
    + $R$ is row-reduced
    + all row of full $0$ entries is below any non-zero row
    + if there are $r$ non-zero rows in $R$, where the leading non-zero entry of row $i$ occurs in $k_i$, $i = 1, dots, r$ then $k_1 < k_2 < dots < k_r$
]) <row_reduced_echelon_definition>

#theorem([
    every $A in bb(F)^(m times n)$ is row-equivalent to a row-reduced echelon
]) <row_echelon_equivalence_theorem>

#theorem([
    for matrix $A in bb(F)^(m times n)$ if $m < n$ then $A X = 0$ has non-trivial solution
]) <non_trivial_solution_homogeneous_theorem>

#theorem([
    a homogeneous equation $A X = 0$ is row-equivalent to $I$ iff it has only trivial solution
]) <homogeneous_trivial_solution_identity_theorem>

== Matrix Multiplication

#definition(title: "Matrix Multiplication", [
    $
        "let" A in bb(F)^(m times n) , s0 B in bb(F)^(n times p), s0 A B = C, " where " C in bb(F)^(m times p) \
        "then " C_(i j) = sum_(r = 1)^n A_(i r) B_(r j)
    $
]) <matrix_multiplication_definition>

#theorem([
    if $A, B, C$ are matrices over field $bb(F)$ has product $B C, A(B C)$ defined, then so are
    $A B, (A B) C$, #s0 moreover, $A (B C) = (A B) C$
]) <matrix_product_defined_associative_theorem>

#definition(title: "Elementary Matrix", [
    a matrix is said to be *elementary matrix* if it could be obtainable by Identity matrix through a series of elementary row operations
]) <elementary_matrix_definition>

#theorem([
    let $e$ be elementary row operation, and $E = e(I)$ then for every $A_(m times n)$, #s0 $e(A) = E A$
]) <elementary_row_operation_matrix_equivalence_theorem>

#corollary([
    let $A, B in bb(F)^(m times n)$ then $B$ is row-equivalent to $A$ iff $B = P A$ where $P$ is product of a series of elementary row operation
]) <row_equivalent_elementary_row_operation_corollary>

== Invertible Matrix

#definition([
    let $A, B in bb(F)^(n times n)$ if $A B = I$, $A$ is the *left inverse* of $B$ and $B$ is the *right inverse* of $A$, if $A B = B A = I$ then it is a *two-sided inverse* and $A$ is said to be invertible
]) <matrix_inverse_definition>

#lemma([
    if $A$ has left inverse $B$ and right inverse $C$, then $B = C$
]) <matrix_left_right_inverse_lemma>

#theorem([
    let $A, B in bb(F)^(n times n)$
    + if $A$ is invertible, so is $A^(-1)$ and $(A^(-1))^(-1) = A$
    + if both $A, B$ are invertible, so is $A B$ and $(A B)^(-1) = B^(-1) A^(-1)$
]) <matrix_inverse_product_invertibility_theorem>

#corollary([
    product of invertible matrices are invertible
]) <matrix_product_invertibility_corollary>

#theorem([
    an elementary matrix is invertible
]) <elementary_matrix_invertibility_theorem>

#theorem([
    for $A in bb(F)^(n times n)$, the following are equivalent
    + $A$ is invertible
    + $A$ is row-equivalent to identity matrix
    + $A$ is product of elementary matrics
    + homogeneous system $A X = 0$ has only trivial solution
    + $A X = Y$ has solution $X$ for each $Y_(n times 1)$
]) <invertible_row_equivalence_identity_elementary_product_relation_theorem>

#corollary([
    + let $A in bb(F)^(n times n)$, if a $E_k dots E_1 A = I$ then $E_k dots E_1 I = A^(-1)$ \
    + let $A, B in bb(F)^(m times n)$ then $B$ is row-equivalent to $A$ iff $B = P A$ where $P$ is an invertible $m times m$ matrix \
    + a square matrix with left or right inverse is invertible \
    + let $A = A_1 dots A_k$ where $A_1, dots, A_k$ are square matrics, then $A$ is invertible iff all $A_1, dots, A_k$ are invertible
]) <inverse_elementary_row_operation_corollary>

#exercise([
    + an *upper-triangular* matrix is $A in bb(F)^(n times n) mif A_(i j) = 0, forall i > j$, then an upper-triangular matrix has no $0$ entries in diagonal iff it is invertible
    + let $A in bb(F)^(m times n), B in bb(F)^(n times m), s0 n < m$ then $A B$ is not invertible
    + there is a finite series of row and column operations such that any matrix $A$ can be transformed into $R = P A Q$, where $R$ is both a row-reduced echelon and column-reduced echelon matrix
    + *Hilbert matrics* $H$ is invertible and $H^(-1)$ has all integer entries
    $ 
        H = mat(
            1, 1/2, dots, 1/n;
            1/2, 1/3, dots, 1/(n+1);
            dots.v, dots.v, dots.down, dots.v;
            1/n, 1/(n+1), dots, 1/(2 n - 1)
        )
    $
]) <exercise_invertible_matrix>

#pagebreak()

= Vector Spaces

== Vector Spaces

#definition(title: "Vector Space", [
    a vector space consists of:
    + a field $bb(F)$ of scalars
    + a set $V$ of vectors
    + an addition operation on a pair of vectors, say $alpha , beta, gamma in V$
        - $alpha + beta in V$
        - $alpha + beta = beta + alpha$
        - $alpha + (beta + gamma) = (alpha + beta) + gamma$
        - $existsunique 0 in V suchthat alpha + 0 = alpha h0 forall alpha in V$
        - $forall alpha in V s0 existsunique -alpha in V suchthat alpha + (-alpha) = 0$
    + a scalar multiplation operator, say $alpha, beta in V$, and $c, c_1, c_2 in bb(F)$
        - $1 alpha = alpha h0 forall alpha in V$
        - $(c_1 c_2) alpha = c_1 (c_2 alpha)$
        - $c (alpha + beta) = c alpha + c beta$
        - $(c_1 + c_2) alpha = c_1 alpha + c_2 alpha$
]) <vector_space_definition>

#definition(title: "Linear Combination", [
    vector $beta in V$ is said to be linear combination of $alpha_1 , dots, alpha_n in V$ provided scalars $c_1, dots, c_n in bb(F)$ iff
    $
        beta = c_1 alpha_1 + dots + c_n alpha_n = sum^n_(k=1) c_k alpha_k
    $
]) <linear_combination_definition>

== Subspaces

#definition(title: "Subspace", [
    let $V$ be a vector space over field $bb(F)$, the subspace $W$ over field $bb(F)$ is a subset of $V$ which itself is a vector space with the same operators
]) <subspace_definition>

#theorem([
    a non-empty subset $W$ of $V$ is a subspace of $V$ over field $bb(F)$ iff $s0 forall alpha, beta in W, s0 c in bb(F), s0 c alpha + beta in W$
]) <subspace_definition_equivalence_theorem>

a *Hermitian matrix* is a square matrix over complex number where $A_(j k) = overline(A_(k j))$ or $A = A^*$

#lemma([
    $
        "let" A in bb(F)^(m times n), s0 B, C in bb(F)^(n times p), s0 d in bb(F) \
        A (d B + C) = d ( A B ) + A C
    $
]) <matrix_is_vector_space_lemma>

#theorem([
    let $V$ be a vector space over $bb(F)$, the intersection of any collection of subspace of $V$ is a subspace of $V$
]) <subspace_intersection_is_subspace_theorem>

#definition([
    let $S$ be a set of vectors in a vector space $V$, the *subspace spanned by *$S$ is intersection of all subspace $W$ of $V$ which contains $S$ \
    if $S$ is a finite set where $S = { alpha_1, dots, alpha_n }$ then $W$ is called *subspace spanned by * vectors $alpha_1, dots, alpha_n$
]) <subspace_spanning_definition>

#theorem([
    the subspace spanned non-empty subset $S$ of vector space $V$ is the set of all linear combination of vectors in $S$
]) <subspace_spanning_linear_combination_theorem>

#definition([
    let $S_1, dots, S_n$ be subsets of vector space $V$, the set of all sums
    $
        alpha_1 + dots + alpha_n, h0 alpha_1 in S_1, s0 dots , s0 alpha_n in S_n
    $
    is denoted as
    $
        S_1 + dots + S_n = sum_(k = 1)^n S_k 
    $
]) <subset_sum_definition>

the subspace of $bb(F)^n$ over field $bb(F)$ spanned by row vectors of matrix $A in bb(F)^(m times n)$ is called *row space* of $A$

== Bases and Dimension

#definition([
    for vector space $V$ over field $bb(F)$, a subspace $S$ is *linear dependent* iff
    $
        exists s0 0 != alpha_1, dots, alpha_n in S, s0 c_1, dots, c_n in bb(F) "not all" 0 suchthat sum_(k = 1)^n c_k alpha_k = 0
    $
    otherwise it is called *linear independent*
]) <linear_dependent_definition>

#definition(title: "basis", [
    let $V$ be a vector space, a *basis* is a linear independent set that spans $V$ \
    the space $V$ is *finite-dimensional* if it has finite basis \
]) <basis_definition>

#example([
    a standard basis of $bb(F)^n$ has form of:
    $
        epsilon.alt_1 = (1, 0, dots, 0) \
        epsilon.alt_2 = (0, 1, dots, 0) \
        dots.v \
        epsilon.alt_n = (0, 0, dots, 1)
    $
]) <standard_basis_example>

#theorem([
    let $V$ be a vector space spanned by a finite set of vectors $beta_1, dots , beta_n$ \
    then any linear independent subset of $V$ is finite and contains no more than $n$ elements
]) <independent_set_of_space_element_upper_bound_theorem>

#corollary([
    if $V$ is a finite-dimensional vector space, then any bases has the same (finite) numbers of elements
]) <finite_dimenstional_bases_elements_corollary>

#definition([
    the dimension of finite-dimensional vector space $V$ denoted as $dim V$ is the number of element of the bases of $V$
]) <dimension_finite_vector_definition>

#corollary([
    let $V$ be a finite-dimensional vector space with $dim V = n$ then
    + any subset of $V$ contains more than $n$ elements is linear dependent
    + no subset of $V$ contains less than $n$ elements can span $V$
]) <dimension_vector_subset_elements_corollary>

#lemma([
    suppose $S$ is a linear independent subset of vector space $V$ \
    if $beta in.not S$ then $S union {beta}$ is linear independent
]) <linear_independent_subset_adjoin_lemma>

#theorem([
    let $W$ be subspace of finite-dimensional vector space $V$, every linear independent subset of $W$ is finite and part of a basis of $W$ 
]) <subset_of_subspace_is_in_basis_theorem>

#corollary([
    if $W$ is a proper subspace of a finite-dimensional vector space $V$, then $W$ is finite-dimensional and $dim W < dim V$
]) <dimension_relation_proper_subspace_corollary>

#corollary([
    for every finite-dimensional vector space $V$, a linear independent subset is part of its basis
]) <linear_independent_subset_basis_corollary>

#corollary([
    let $A in bb(F)^(n times n)$ has its row vectors linear independent, then $A$ is invertible
]) <row_vector_independence_invertible_matrix_corollary>

#theorem([
    if $W_1 , W_2$ are subspaces of finite-dimensional vector space $V$ then $W_1 + W_2$ are finite-dimensional and $dim W_1 + dim W_2 = dim (W_1 inter W_2) + dim (W_1 + W_2)$
]) <dimension_of_sum_subspaces_theorem>

#exercise([
    + that $A in bb(F)^(m times n)$ has dimension $m n$ by exhibiting its standard basis
    + $V$ a vector space of $bb(Q)$ representing $bb(R)$ is not finite-dimensional 
]) <exercise_base_dimensions>

== Coordinates

#definition(title: "Ordered Basis", [
    let $V$ be a finite-dimensional vector space, an *ordered basis* is a finite sequence of linearly independent vectors that spans $V$
]) <ordered_basis_definition>

#definition([
    the coordinate matrix of $alpha$ to the ordered basis $cal(B)$ is as
    $
        [alpha]_cal(B) = vec(x_1, dots.v, x_n), s0 "where" alpha = sum_(i=1)^n x_i alpha_i, s0 alpha_i in cal(B)
    $
]) <coordinate_matrix_definition>

#theorem([
    let $P_(n times n)$ be invertible matrix over $bb(F)$, $V$ be an $n$-dimensional vector space with ordered basis $cal(B)$. there is a unique ordered basis $cal(B)'$ for each $alpha$ such that
    $
        [alpha]_cal(B) = P [alpha]_cal(B)' \
        [alpha]_cal(B)' = P^(-1) [alpha]_cal(B) \
        P = mat([alpha'_1]_cal(B), dots, [alpha'_n]_cal(B))
    $
]) <ordered_basis_transforming_theorem>

== Summary of Row-Equivalences

#theorem([
    Row-Equivalent matrices have the same row space
]) <row_equivalent_same_row_space_theorem>

#theorem([
    let $R$ be a row-reduced echelon matrix, then the non-zero rows of $R$ forms a basis of row space of $R$
]) <row_reduced_echelon_non_zero_row_space_theorem>

#theorem([
    $"let" m, n > 0 s0 m, n in N, s0 bb(F) "be a field", s0 W "be a subspace of " bb(F)^n "and" dim W <= m$ \
    then exists unique row-reduced echelon matrix over $bb(F)$ which has $W$ as its row space
]) <row_space_unique_row_reduced_echelon_theorem>

#corollary([
    each $m times n$ matrix is row-equivalent to one and only one row-reduced echelon matrix
]) <any_matrix_row_reduced_echelon_uniqueness_corollary>

#corollary([
    let $A, B in bb(F)^(m times n)$, then $A$ and $B$ are row-equivalent iff they have the same row space
]) <same_row_space_row_equivalence_corollary>

#exercise([
    let $A in bb(F)^(n times m)$ of equation $A X = Y$ then equation has solution iff $rank A$ is equal to rank of augmented matrix of the system
]) <computation_concerning_subspace_exercise>

#pagebreak()

= Linear Transformations

== Linear Transformations

#definition(title: "Linear Transformation", [
    let $V, W$ be vector spaces over field $bb(F)$, a linear transformation from $V$ to $W$ is a function \
    $T: V arrow W$ such that $T(c alpha + beta) = c(T alpha) + T beta$
]) <linear_transformation_definition>

if $V$ is a vector space, an *identity transformation* $I$ is defined by $I alpha = alpha$ for $alpha in V$ \
an *zero transformation* $0$ is defined by $0 alpha = 0$ 

#theorem([
    let $V$ be a finite-dimensional vector space over field $bb(F)$, let ${alpha_1, dots, alpha_n}$ be an ordered basis of $V$, let $W$ be a vector space over $bb(F)$, and let $beta_1, dots, beta_n$ be any vectors in $W$, then
    $
        existsunique T : V arrow W suchthat T alpha_i = beta_i, h0 i = 1, dots, n
    $
]) <exists_unique_linear_transformation_theorem>

#definition([
    let $V, W$ be vector spaces over field $bb(F)$, let $T : V -> W$, the *null space* of $T$ is the set of all vectors $alpha$ such that $T alpha = 0$ \
    let $V$ be a finite-dimensional vector space, the *rank* of $T$ is the dimension of range of $T$, the *nullity* of $T$ is the dimension of null space of $T$
]) <null_space_rank_nullity_definition>

#theorem([
    let $V$ be finite-dimensional and $W$ be any vector space over $bb(F)$, let $T : V -> W$ be a linear transformation, then
    $
        rank T + nullity T = dim V
    $
]) <rank_nullity_dim_relation_theorem>

#theorem([
    if $A in bb(F)^(m times n)$ then $ "row" rank A = "column" rank A $
]) <row_column_rank_equality_theorem>

#exercise([
    + let $V = bb(F)^(n times n)$, let $B in V$ be fixed and let $T(A) = A B - B A$ then $T in L(V, V)$
    + let $V = bb(F)^(n times 1)$, let $W = bb(F)^(m times 1)$, let $A in bb(F)^(m times n)$ be fixed, let $T in L(V, W)$ be $T(X) = A X$ then that $T = 0 <=> A = 0$
    + let $V$ be $n$-dimensional vector space over field $bb(F)$, let $T in L(V, V)$ such that $null T = range T$ then $n$ is even
    + let $V$ be vector space, let $T in L(V, V)$ then the followings are equivalent 
        + $null T inter range T = {0}$
        + $T(T alpha) = 0 => T alpha = 0$
]) <linear_transformation_exercise>

== The Algebra of Linear Transformation

#theorem([
    let $V, W$ be vector spaces over field $bb(F)$, #s0 $T, U$ be linear transformations from $V$ into $W$ then functions $ (T + U)(alpha) := T alpha + U alpha$, #s0 $(c T)(alpha) := c (T alpha)$ where the set of linear transformations $ T, U$ spanned form a vector space over field $bb(F)$
]) <linear_transformation_set_vector_space_theorem>

#theorem([
    let $V$ be $n$-dimensional and $W$ be $m$-dimensional vector space over $bb(F)$, then the linear transformation vector space $L(V, W)$ is finite-dimensional and has dimension $m n$
]) <linear_transformation_dimension_relation_theorem>

#theorem([
    let $V, W, Z$ be vector spaces over field $bb(F)$, #s0 let linear transformations $T : V -> W, s0 U : W -> Z$ then $(U T)(alpha) := U(T(alpha))$ is a linear transformation such that $U T : V -> W$
]) <composed_linear_transformation_theorem>

#definition(title: "linear operator", [
    let $V$ be a vector space over field $bb(F)$, then $T : V -> V$ is a *linear operator* on $V$
]) <linear_operator_definition>

#lemma([
    let $V$ be a vector space over field $bb(F)$, $s0$ let $U, T_1, T_2$ be linear operators on $V$, $s0$ let $c in bb(F)$
    + $I U = U I = U$
    + $U (T_1 + T_2) = U T_1 + U T_2 h0 (T_1 + T_2) U = T_1 U + T_2 U$
    + $c (U T_1) = (c U) T_1 = U (c T_1)$
]) <linear_operator_lemma>

#theorem([
    let $V, W$ be vector spaces over field $bb(F)$, let $T : V -> W$ be linear transformation \
    if $T$ is invertible, then $T^(-1) : W -> V$ is linear transformation
]) <linear_transformation_inverse_theorem>

for a linear transformation $T$ to be *non-singular* is $T alpha = 0$ implies $alpha = 0$

#theorem([
    let $T : V -> W$ be linear transformation, then $T$ is non-singular iff $T$ maps each linearly independent subset of $V$ onto a linearly independent subset of $W$
]) <non_singularity_linear_independent_subset_theorem>

#theorem([
    let $V, W$ be finite-dimensional vector spaces over field $bb(F)$ such that $dim V = dim W$, let $T : V -> W$ be linear transformation then the followings are equivalent
    + $T$ is invertible
    + $T$ is non-singular
    + $T$ is onto
    + if ${alpha_1, dots, alpha_n}$ is basis of $V$, then ${T alpha_1, dots, T alpha_n}$ is a basis for $W$
    + $exists "basis" {alpha_1, dots, alpha_n} "for" V suchthat {T alpha_1, dots, T alpha_n}$ is basis of $W$ 
]) <equal_dimension_linear_transform_equivalency_theorem>

#exercise([
    + let $T in L(bb(F)^n, bb(F)^m)$, let $U in L(bb(F)^m, bb(F)^n)$ then if $n < m => T U$ is not invertible
    + let $V$ be vector space over field $bb(F)$, let $T in L(V, V)$ such that $T^2 = 0$ then $range T = null T$
    + let $V$ be finite-dimensional vector space over field $bb(F)$, let $T, U in L(V, V)$ such that $T U = I$ then $T$ is invertible and $U = T^(-1)$, but if $V$ is not finite-dimensional the statement does not hold
    + let $A in bb(F)^(m times n)$, let $T in L(bb(F)^(n times 1), bb(F)^(m times 1))$ and $T (X) = A X$ then
        + if $m < n$ then $T$ may be onto but singular
        + if $m > n$ then $T$ may be non-singular but not onto
    + let $V$ be finite-dimensional vector space, let $T in L(V, V)$ such that $rank T^2 = rank T$ then $null T inter range T = {0}$
    + let $V = bb(F)^(m times n)$, let $W = bb(F)^(p times m)$, let $B in bb(F)^(p times m)$ be fixed, let $T in L(V, W)$ be $T (A) = B A$ then $T$ is invertible iff $p = m$ and $B$ is invertible
]) <algebra_linear_transformation_exercise>

== Isomorphism

if $V, W$ are vector spaces over field $bb(F)$, any bijection transformation $T : V -> W$ is called *isomorphism* of $V$ onto $W$

#theorem([
    every $n$-dimensional vector space over field $bb(F)$ is isomorphic to space $bb(F)^n$
]) <n_dimensional_n_tuple_isomorphism_theorem>

#exercise([
    + $bb(F)^(n times m) tilde.equiv bb(F)^(n m)$
    + let $V, W$ be finite-dimensional vector space over field $bb(F)$, then $V tilde.equiv W <=> dim V = dim W$
    + let $V, W$ be vector space over field $bb(F)$, let $U in L(V, W)$ be isomorphism, let $T in L(V, V)$ be \ $T = U T U^(-1)$ then $T$ is isomorphism of $L(V, V) -> L(W, W)$
]) <linear_transformation_isomorphism_exercise>

== Representation of Transformations by Matrices

#theorem([
    let $V$ be $n$-dimensional, $W$ be $m$-dimensional vector spaces over field $bb(F)$, let $cal(B)$ be ordered basis of $V$, and $cal(B)'$ be ordered basis of $W$
    $
        forall s0 T : V -> W s0 exists A in bb(F)^(m times n) suchthat [T alpha]_(cal(B)') 
        = A [alpha]_(cal(B)) h0 forall alpha in V
    $
    furthermore, $T -> A$ is a bijection between $L(V, W)$ and $bb(F)^(m times n)$
]) <linear_transformation_matrices_representation_existence_theorem>

$A$ in #theref(<linear_transformation_matrices_representation_existence_theorem>) is called *matrix of * $T$ * relative to the ordered bases * $cal(B), cal(B)'$ deonted as $[T]_cal(B)^cal(B)'$

#theorem([
    let $V, W, Z$ be finite-dimensional vector space over field $bb(F)$, let $cal(B), cal(B)', cal(B)''$ be ordered basis of $V, W, Z$ respectively, let $T : V -> W, s0 U : W -> Z$, if $A$ be matrix of $T$ relative to $(cal(B), cal(B)')$, and $B$ be matrix of $U$ relative to $(cal(B)', cal(B)'')$, then matrix of $U T$ relative to $(cal(B), cal(B)'')$ be $C = B A$
]) <linear_transformation_composition_matrix_representation_theorem>

#definition([
    let $A, B in bb(F)^(n times n)$, then $B$ is similar to $A$ over $bb(F)$ if exists invertible $P in bb(F)^(n times n)$ such that $B = P^(-1) A P$
]) <similar_matrix_definition>

#theorem([
    let $V$ be finite-dimensional vector space over field $bb(F)$ let $cal(B) = {alpha_1, dots, alpha_n}$ and $cal(B)' = {alpha'_1, dots, alpha'_n}$ be ordered basis of $V$; let $T$ be linear operator on $V$, if $P = [ [alpha'_1]_cal(B), dots, [alpha'_n]_cal(B) ]$ be $n times n$ matrix, then
    $
        [T]_cal(B)' = P^(-1) [T]_cal(B) P
    $
    if $U$ is invertible operator on $V$ defined by $U alpha_j = alpha'_j, s0 j = 1 , dots, n$ then
    $
        [T]_cal(B)' = [U]^(-1)_cal(B) [T]_cal(B) [U]_cal(B)
    $
]) <linear_operator_similar_theorem>

#exercise([
    + let $V$ be finite-dimensional vector space over field $bb(F)$, let $S, T in L(V, V)$, then $exists cal(B), cal(B)'$ be ordered basis such that $[S]_cal(B) = [T]_cal(B)'$ iff $exists U in L(V, V)$ be invertible such that $T = U S U^(-1)$
    + let $W = bb(F)^(n times 1)$, let $A in bb(F)^(n times n)$ then $A$ defines $L_A in L(W, W)$ be $L_A (X) = A X$, where \ $forall T_W in L(W, W) s0 exists L_A = T_W "for some" A in bb(F)^(n times n)$ \ let $V$ be $n$-dimensional vector space over field $bb(F)$, let $cal(B)$ be ordered basis of $V$, define \ $U alpha = [alpha]_cal(B) s0 forall alpha in V$ then $U$ is an isomorphism $V -> W$, if $T in L(V, V)$ then \ $U T U^(-1) in L(W, W)$ and $U T U^(-1) = L_A$ for some $A in bb(F)^(n times n)$
    + let $V$ be $n$-dimensional vector space over field $bb(F)$, let $cal(B) = {alpha_1, dots, alpha_n}$ be ordered basis of $V$, then
        + $exists T in L(V, V) suchthat T alpha_j = alpha_(j + 1) h0 j = 1, dots, n - 1 "and" T alpha_n = 0$ with $A = [T]_cal(B)$
        + $T^n = 0 and T^(n - 1) != 0$
        + let $S in L(V, V) suchthat S^n = 0 and S^(n - 1) != 0$ then $exists cal(B)'$ be ordered basis of $V$ such that $[S]_cal(B)' = A$
        + let $M, N in bb(F)^(n times n) suchthat M^n = N^n = 0 and M^(n - 1) != 0 != N^(n - 1)$ then $M tilde N$
    + let $V, W$ be finite-dimensional vector space over field $bb(F)$, let $T in L(V, W)$, let $cal(B) = {alpha_1, dots, alpha_n}$ and let $cal(B)' = {beta_1, dots, beta_m}$ be ordered basis of $V, W$, define $E^(p, q) in L(V, W)$ be $E^(p, q)(alpha_i) = delta_(i q) beta_p$ then $E^(p, q)$ for $1 <= p <= m$ and $1 <= q <= n$ form a basis of $L(V, W)$, let $T in L(V, W)$ then $ T = sum_(p = 1)^m sum_(q = 1)^n A_(p q) E^(p, q) $ for some $A in bb(F)^(m times n)$ with $A = [T]_(cal(B) times cal(B)')$
]) <representation_transformation_matrix_exercise>

== Linear Functionals

#definition(title: "linear functional", [
    let $V$ be a vector space over field $bb(F)$, a *linear functional* $f : V -> bb(F)$ is a linear transformation from $V$ to $bb(F)$ such that
    $
        f( c alpha + beta) = c f(alpha) + f(beta)
    $
]) <linear_functional_definition>

#definition(title: "dual space", [
    let $V$ be a vector space over field $bb(F)$, then $L(V, bb(F))$ is a *dual space* of $V$ denoted as $V^*$
]) <dual_space_definition>

#corollary([
    let $V$ be a vector space over field $bb(F)$, and let $V^*$ be its dual space, then
    $
        dim V^* = dim V
    $
]) <dual_space_dimension_corollary>

#theorem([
    let $V$ be a finite-dimensional vector space over field $bb(F)$ with an ordered basis $cal(B) = {alpha_1, dots, alpha_n}$\
    There is a unique basis $cal(B)' = {f_1, dots, f_n }$ such that $f_i(alpha_j) = delta_(i j)$, and for each function $f in V^*$ that
    $
        f = sum_(i=1)^n f(alpha_i) f_i
    $
    and for each vector $alpha in V$ that
    $
        alpha = sum_(i=1)^n f_i (alpha) alpha_i
    $
]) <linear_functional_uniqueness_theorem>

#definition(title: "annihilator", [
    let $V$ be a vector space over field $bb(F)$, and $S$ is a subset of $V$ #s0 the *annihilator* of $S$ denoted as $S^0$ is the set of linear functionals $f$ on $V$ such that $f(alpha) = 0 s0 forall alpha in S$
]) <annihilator_definition>

#theorem([
    let $V$ be a finite-dimensional vector space over field $bb(F)$, and let $W$ be a subspace of $V$, then
    $
        dim W + dim W^0 = dim V
    $
]) <annihilator_dimensional_theorem>

if $V$ is a finite-dimensional vector space with a subspace $W$ such that $dim W = dim V - 1$, then $W$ is a *hyperspace* or *hyperplane* or *subspace of codimension 1*

#corollary([
    if $W$ is a $k$-dimensional subspace of a $n$-dimensional vector space $V$, then $W$ is the intersection of $(n - k)$ hyperspaces in $V$
]) <hyperspaces_intersection_corollary>

#corollary([
    if $W_1, W_2$ are subspace of a finite-dimensional vector space, then $W_1 = W_2 <=> W_1^0 = W_2^0$
]) <subspace_annihilator_equivilant_corollary>

#exercise([
    + let $A, B in bb(F)^(n times n)$ then $tr (A B) = tr (B A)$, if $A tilde B$ then $tr A = tr B$
    + let $A, B in bb(C)^(n times n)$ then $A B - B A = I$ is impossible
    + let $m, n in bb(Z)^+$, let $bb(F)$ be a field, let $f_1, dots, f_m in L(bb(F)^n, bb(F))$, let $alpha in bb(F)^n$ define $T alpha = (f_1(alpha), dots, f_m (alpha))$ then $T in L(bb(F)^n, bb(F)^m)$ and $forall T in L(F^n, bb(F)^m) s0 exists f_1, dots f_m in.rev T alpha = (f_1(alpha), dots, f_m (alpha))$
    + let $V$ be finite-dimensional vector space, let $W_1, W_2 subset V$ be subspaces, then
        + $(W_1 + W_2)^0 = W_1^0 inter W_2^0$
        + $(W_1 inter W_2)^0 = W_1^0 + W_2^0$
    + let $V$ be finite-dimensional vector space over field $bb(F)$, let $W subset V$ be subspace, let $f in L(W, bb(F))$, then $exists g in L(V, bb(F)) suchthat g(alpha) = f(alpha) s0 forall alpha in W$
    + let $bb(F) subset bb(C)$ be field, let $V$ be vector space over $bb(F)$, let $f, g in L(V, bb(F))$ and define $h(alpha) = f(alpha) g(alpha)$, then if $h in L(V, bb(F)) => f = 0 or g = 0$
    + let $bb(F)$ be field of characteristic $0$, let $V$ be finite-dimensional vecotr space over $bb(F)$, \ let $alpha_1, dots, alpha_m in V$ each not $0$ with $m$ finite, then $exists f in L(V, bb(F)) in.rev f(alpha_i) != 0 h0 i = 1, dots, m$
    + let $W = bb(F)^(n times n)$ over field $bb(F)$, let $f in L(bb(F)^(n times n), bb(F)) in.rev f(A B) = f(B A) s0 forall A, B in W$, then $exists c in bb(F)$ such that $f = c tr$, if $f(I) = n => f = tr$ is uniquely defined
    + let $W = bb(F)^(n times n)$ over field $bb(F)$, then subspace $W_0 = {C in bb(F)^(n times n) | A B - B A, s0 A, B in bb(F)^(n times n)}$ is matrices of $0$ trace
]) <exercise_linear_functionals>

== The Double Dual

#theorem([
    let $V$ be finite-dimensional vector space over field $bb(F)$, for each $alpha in V$ define
    $
        L_(alpha) (f) = f(alpha), h0 f in V^*
    $
    the mapping $alpha -> L_alpha$ is an isomorphism of $V$ onto $V^(**)$
]) <double_dual_isomorphism_theorem>

#corollary([
    let $V$ be finite-dimensional vector space over field $bb(F)$, let $L$ be a linear functional on dual space $V^*$ of $V$, then
    $
        existsunique alpha in V suchthat L(f) = f(alpha) h0 forall f in V^*
    $
]) <exists_unique_dual_linear_functional_corollary>

#corollary([
    let $V$ be finite-dimensional vector space over field $bb(F)$, then each basis of $V^*$ is the dual of some basis for $V$
]) <vector_space_linear_functional_basis_dual_corollary>

#theorem([
    if $S$ is any subspace of finite-dimensional vector space $V$, then $(S^0)^0$ is the subspace of $S$
]) <annihilator_annihilator_theorem>

#definition(title: "hyperspace", [
    if $V$ is a vector space, a *hyperspace* in $V$ is a maximal proper subspace of $V$
]) <hyperspace_definition>

#theorem([
    let $V$ be a vector space, $f$ be a non-zero linear functional on $V$, then
    - null $f$ is a hyperspace in $V$
    - every hyperspace in $V$ is null $f$ for some $f$
]) <hyperspace_linear_functional_null_theorem>

#lemma([
    let $V$ be vector space over field $bb(F)$, let $f, g in L(V, bb(F))$
    $
        g = c f <=> null f subset null g <=> (f(alpha) = 0 => g(alpha) = 0) \
        c in bb(F), s0 alpha in V
    $
]) <linear_functional_scalar_multiple_lemma>

#theorem([
    let $g, f_1, dots, f_r$ be linear functionals on vector space $V$ with null space $N, N_1, dots, N_r$, then $g$ is linear combination of $f_1, dots, f_r$ iff $N_1 inter dots inter N_r subset N$
]) <linear_functional_linear_combination_theorem>

#exercise([
    + let $n in bb(Z)^+$, let $bb(F)$ be a field, let $W = {(x_1, dots, x_n) in bb(F)^n | x_1 + dots + x_n = 0}$, then
        + $forall f in W^0$ can be written as $f(x_1, dots, x_n) = c_1 x_1 + dots + c_n x_n$
        + dual $W^*$ can be defined as $f(x_1, dots, x_n) = c_1 x_1 + dots + c_n x_n$ such that $c_1 + dots + c_n = 0$
    + let $V$ be vector space over field $bb(F)$, let ${g_1, dots, g_r}$ be any basis of $W^0$ then $ W = op(inter, limits: #true)_(i = 1)^r N_g_i $
    + let $S$ be a set, let $bb(F)$ be a field, let $V(S ; bb(F)) = {f : S -> bb(F)}$ be a vector space, let $W subset V(S ; bb(F))$ be $n$-dimensional subspace, then $exists x_1, dots, x_n in S$ and $exists f_1, dots, f_n in W in.rev f_i (x_i) = delta_(i j)$
]) <double_dual_exercise>

== The Transpose of a Linear Transformation

#theorem([
    let $V, W$ be vector spaces over field $bb(F)$, then \
    $
        "for each linear transformation" T : V -> W \
        existsunique T^t : W^* -> V^* suchthat \
        (T^t g)(alpha) = g (T alpha) h0 forall g in W^*, forall alpha in V
    $
    which $T^t$ is called *transpose* of $T$
]) <transpose_definition_theorem>

#theorem([
    let $V, W$ be vector spaces over field $bb(F)$, let $T in L(V, W)$, then
    $
        null T^t = (range T)^0
    $
    if $V, W$ are finite-dimensional, then
    + $rank T = rank T^t$
    + $range T^t = (null T)^0$
]) <null_annihilator_transpose_theorem>

#theorem([
    let $V, W$ be finite-dimensional vector space over field $bb(F)$, let $cal(B)$ be basis of $V$ with dual basis $cal(B)^*$, let $cal(B)'$ be basis of $W$ with dual basis of $cal(B)'^*$, let $T in L(V, W)$ where
    $
        [T]_cal(B)^cal(B)' = A h0 [T^t]_(cal(B)'^*)^(cal(B)^*) = B \
        "then" A_(i j) = B_(j i)
    $
]) <transpose_matrix_representation_theorem>

#definition(title: "matrix transpose", [
    let $A in bb(F)^(m times n)$, then *transpose* of $A$ is $A^t in bb(F)^(n times m)$ defined as $A^t_(i j) = A_(j i)$
]) <matrix_transpose_definition>

#theorem([
    let $A in bb(F)^(m times n)$ , then row rank $A = $ column rank $A$
]) <row_column_rank_transpose_theorem>

#exercise([
    + let $V = bb(F)^(n times n)$ over field $bb(F)$, let $B in V$ be fixed, let $T in L(V, V)$ as $T (A) = A B - B A$ and let $f = tr$, then $T^t f = 0$
    + let $V$ be finite-dimensional vector space over field $bb(F)$, let $T in L(V, V)$, let $c in bb(F)$ and let $alpha in V$ such that $T alpha = c alpha, s0 alpha != 0$ then $exists f in V^* s0 f != 0 in.rev T^t f = c f$
    + let $A in bb(R)^(m times n)$, then $A = 0 <=> tr (A^t A) = 0$
    + let $V$ be finite-dimensional vector space over field $bb(F)$, let $T in L(V, V)$ then $Phi : T -> T^t$ is an isomorphism of $L(V, V) -> L(V^*, V^*)$
    + let $V = bb(F)^(n times n)$ over field $bb(F)$, let $B in V$ be fixed then define $f_B (A) = tr (B^t A)$ then
        + $f_B in L(V, bb(F))$
        + $forall f in V^* exists B in bb(F)^(n times n) in.rev f_B = f$
        + $Phi : B -> f_B$ is an isomorphism of $V -> V^*$
]) <transpose_linear_transformation_exercise>

#pagebreak()

= Polynomials

== Algebras

#definition(title: "Linear Algebra", [
    let $bb(F)$ be a field, a *linear algebra* over field $bb(F)$ is a vector space $cal(A)$ over field $bb(F)$ with additional *multiplication* operator for each pair of $alpha, beta in cal(A)$, where $alpha beta$ is the *product*, such that
    + $alpha (beta gamma) = (alpha beta) gamma$
    + $alpha (beta + gamma) = alpha beta + alpha gamma h0 (alpha + beta) gamma = alpha gamma + beta gamma$
    + $c (alpha beta) = (c alpha) beta = alpha (c beta), h0 c in bb(F)$
    if $exists s0 1 in cal(A) suchthat 1 alpha = alpha 1 = alpha, s0 alpha in cal(A)$ then $cal(A)$ is *linear algebra with identity* \
    if $alpha beta = beta alpha h0 alpha, beta in cal(A)$ then $cal(A)$ is *commutative linear algebra*
]) <linear_algebra_definition>

== The Algebra of Polynomials

#definition(title: "polynomial", [
    let $bb(F)[x]$ be a subspace of $bb(F)^infinity$ spanned by vectors $1, x, x^2, dots$, then $bb(F)[x]$ is *polynomial* over $bb(F)$
]) <polynomial_definition>

let $f$ be polynomial such that $f = sum_(i=0)^infinity c_i x^i$, if $c_n = 1$ and $c_k = 0 s0 forall k > n$ then, $deg f = n$\
if $deg f = n, s0 c_n = 1$, then $f$ is *monic polynomial* \
if $deg f = 0$, then $f$ is *scalar polynomial*

#theorem([
    let $f, g$ be non-zero polynomials over field $bb(F)$
    + $f g$ is non-zero polynomial
    + $deg (f g) = deg f + deg g$
    + $f, g$ be monic polynomial $=> f g$ be monic polynomial
    + $f, g$ be scalar polynomial $<=> f g$ be scalar polynomial
    + if $f + g != 0$ then $deg (f + g) <= max (deg f, deg g)$
]) <polynomial_degree_theorem>

#corollary([
    the set of all polynomials over field $bb(F)$ is a commutative linear algebra
]) <polynomial_linear_algebra_corollary>

#corollary([
    if $f, g, h in bb(F)[x] suchthat f != 0, s0 f g = f h$ then $g = h$
]) <polynomial_cancelation_corollary>

#definition([
    let $cal(A)$ be a linear algebra with identity over field $bb(F)$, identity denoted as $1$ and set $alpha^0 = 1 s0 forall alpha in cal(A)$ and
    $
        "for each" f = sum_(i=0)^n f_i x^i \
        "define" f(alpha) = sum_(i=0)^n f_i alpha^i
    $
]) <polynomial_association_definition>

#theorem([
    let $cal(A)$ be linear algebra with identity over field $bb(F)$, let $f, g in bb(F)[x]$, let $alpha in cal(A)$, and $c in bb(F)$, then
    + $(c f + g) (alpha) = c f(alpha) + g(alpha)$
    + $(f g) (alpha) = f(alpha) g(alpha)$
]) <linear_algebra_polynomial_linearlity_theorem>

#exercise([
    let $bb(F)$ be a field
    + let $f, g in bb(F)[x]$ be independent, let $h in bb(F)[x]$ then $f h, g h$ are independent
    + let $f, g in bb(F)[x], s0 f != 0 != g$ then $f g != 0$
    + let $S = {f in bb(F)[x] | (forall g in S, s0 g != f) s0 deg f != deg g}$, then $S$ is independent set in $bb(F)[x]$
    + let $a, b in bb(F), s0 a != 0$ then $1, (a x + b), (a x + b)^2, dots$ forms a basis of $bb(F)[x]$
    + let $h in bb(F)[x] s0 deg h >= 1$ then $Phi : f -> f(h)$ is injection of $bb(F)[x] -> bb(F)[x]$, it is an isomorphism iff $deg h = 1$
]) <algebra_of_polynomial_exercise>

== Lagrange Interpolation

let $V in bb(F)[x]$ and $bb(F)$ be a field \
*Lagrange interpolation forula* is as form
$
    f = sum_(i=0)^n f(t_i) P_i, h0 f in V, h0 t_i in bb(F) \
    P_i = product_(j != i) ((x - t_j)/(t_i - t_j))
$
let $L_i (f) = f(t_i) suchthat L_j (P_i) = P_i (t_j) = delta_(i j)$, then
$
    L = mat(
        1, t_0, t_0^2, dots, t_0^n ;
        1, t_1, t_1^2, dots, t_1^n ;
        dots.v, dots.v, dots.v, dots.down, dots.v ;
        1, t_n, t_n^2, dots, t_n^n
    )
$

if $f in bb(F)[x]$ is polynomial let polynomial functions denoted as $f^~ in L(bb(F)[x], bb(F))$

#definition([
    let $bb(F)$ be a field, let $cal(A), cal(A)^~$ be linear algebras over $bb(F)$, then $cal(A) tilde.equiv cal(A)^~$ if there is a bijection $alpha -> alpha^~$ of $cal(A) -> cal(A)^~$ such that
    + $(c alpha + d beta)^~ = c alpha^~ + d beta^~$
    + $(alpha beta)^~ = alpha^~ beta^~$
    for $c, d in bb(F), s0 alpha, beta in cal(A)$\
    the mapping is called an *isomorphism* of $cal(A)$ onto $cal(A)^~$
]) <polynomial_functions_isomorphism_definition>

#theorem([
    if $bb(F)$ contains infinite number of distinct elements,\
    then $f -> f^~$ is an isomorphism of $bb(F)[x] -> L(bb(F)[x], bb(F))$
]) <polynomial_functions_isomorphism_theorem>

#exercise([
    let $bb(F)$ be a field
    + let $A, P in bb(F)^(n times n), P$ is invertible, let $f in bb(F)[x]$ then $f(P^(-1) A P) = P^(-1) f(A) P$
    + define evaluation function as $L(f) = f(t)$ for $f in bb(F)[x], t in bb(F)$, then if $L in L(bb(F)[x], bb(F))$ such that $L (f g) = L(f) L(g) s0 forall f, g in bb(F)[x]$ then either $L = 0$ or $exists t in bb(F) in.rev L(f) = f(t) s0 forall f in bb(F)[x]$
]) <lagrange_interpolation_exercise>

== Polynomial Ideals

#lemma([
    let $f, d in bb(F)[x]$ be non-zero, such that $deg d <= deg f$, then $exists g in bb(F)[x] suchthat$
    $
        f - d g = 0 s0 or s0 deg(f - d g) < deg f
    $
]) <degree_reduce_lemma>

#theorem([
    let $f, d in bb(F)[x], s0 d != 0$ then, $existsunique q, r in bb(F)[x]$ where
    + $f = d g + r$
    + $r = 0 s0 or s0 deg r < deg d$
]) <polynomial_division_theorem>

#definition(title: "polynomial division", [
    let $f, d in bb(F)[x], s0 d != 0$, let $q in bb(F)[x] suchthat f = d q$ then
    - $d$ *divides* $f$
    - $f$ is *divisible* by $d$
    - $f$ is *multiple* of $d$
    - $q$ is *quotient* of $f, d$, denoted as $q = f / d$
]) <polynomial_division_definition>

#corollary([
    let $f in bb(F)[x], s0 c in bb(F)$ then $f$ is divisible by $x - c$ iff $f (c) = 0$
]) <divisible_corollary>

#definition(title: "root of polynomial", [
    let $bb(F)$ be a field, $c in bb(F), f in bb(F)[x]$ then $c$ is a *root* or *zero* of $f$ if $f(c) = 0$
]) <polynomial_root_definition>

#corollary([
    a polynomial $f$ of degree $n$ has at most $n$ roots in $bb(F)$ 
]) <polynomial_root_bound_corollary>

#theorem(title: "Taylor's Formula", [
    let $bb(F)$ be a field of characteristic $0$, $c in bb(F), s0 n in N, s0 n > 0, s0 f in bb(F)[x], s0 deg f <= n$ then
    $
        f = sum_(k = 0)^n (D^k f)/(k !) (c) (x - c)^k
    $
]) <taylor_formula_theorem>

let $c in bb(F), f in bb(F)[x]$, the *multiplicity* of $c$ as a root of $f$ is the largest $r in N suchthat f = (x - c)^r g$ for some $g in bb(F)[x]$

#theorem([
    let $bb(F)$ be a field of characteristic $0$, $f in bb(F)[x], deg f <= n, c in bb(F)$, $c$ is a root of $f$ of multiplicity  $r$ iff
    $
        (D^k f)(c) = 0 h0 1 <= k <= r - 1 \
        (D^r)(c) != 0
    $ 
]) <multiplicity_differentiation_theorem>

#definition(title: "Ideal", [
    let $bb(F)$ be a field, an *ideal* of $bb(F)[x]$ is a subspace $M$ such that
    $
        f g in M h0 forall f in bb(F)[x], s0 g in M
    $
]) <ideal_definition>

let $d in bb(F)[x]$ then $d bb(F)[x]$ is *principal ideal generated by* $d$ \
let $d_1, dots, d_n in bb(F)[x]$ then $d_1 bb(F)[x] + dots + d_n bb(F)[x]$ is ideal *generated* by $d_1, dots, d_n$

#theorem([
    let $bb(F)$ be a field, $M$ be any non-zero ideal in $bb(F)[x]$, then $existsunique d in bb(F)[x]$ be monic polynomial such that $M$ is principal ideal generated by $d$
]) <monic_principal_ideal_theorem>

#corollary([
    let $bb(F)$ be a field, if $p_1, dots, p_n in bb(F)[x]$ not all $0$, $existsunique d in bb(F)[x]$ be monic where
    + $d bb(F)[x]$ is the ideal generated by $p_1, dots, p_n$
    + $d$ divides each of $p_i$
    + $d$ is divisible by any $g$ that $g$ divides all $p_i$ 
]) <monic_principal_ideal_corollary>

#definition(title: "polynomial GCD", [
    let $bb(F)$ be a field, $p_1, dots, p_n in bb(F)[x]$ not all $0$ \
    then monic polynomial $d$ generated by ideal $p_1 bb(F)[x] + dots + p_n bb(F)[x]$ is called *greatest common divisor* of $p_1, dots, p_n$ \
    $p_1, dots, p_n$ are *relatively prime* if $d = 1$ or $p_1 bb(F)[x] + dots + p_n bb(F)[x] = bb(F)[x]$
]) <polynomial_GCD_definition>

#exercise([
    + if $bb(F)$ is a field, then any intersection of ideals of $bb(F)[x]$ is a ideal
    + let $bb(K)$ be a subfield of $bb(F)$, let $f, g in bb(F)[x]$ which generates ideal $M_bb(K)$ in $bb(K)$, let $M_bb(F)$ be ideal generated by $f, g$ in $bb(F)$, then $M_bb(F), M_bb(K)$ has same monic generator
]) <polynomial_ideal_exercise>

== The Prime Factorization of a Polynomial

#definition(title: "prime and irreducible polynomials", [
    let $bb(F)$ be a field, then $f in bb(F)[x]$ is *reducible over* $bb(F)$ if $exists g, h in bb(F)[x]$ which $deg g >= 1, deg h >= 1$ such that $f = g h$, otherwise $f$ is *irreducible over* $bb(F)$ \
    A non-scalar irreducible polynomial over $bb(F)$ is called a *prime polynomial over* $bb(F)$, or *prime* in $bb(F)[x]$
]) <prime_irreducible_polynomial_definition>

#theorem([
    let $bb(F)$ be a field, $p, f, g in bb(F)[x]$, if $p$ is prime, and $p$ divides $f g$ then either $p$ divides $f$ or $p$ divides $g$
]) <prime_divide_factor_theorem>

#corollary([
    continue by #theref(<prime_divide_factor_theorem>), let $f_1, dots, f_n in bb(F)[x]$ and $p$ divides $f_1 dots f_n$ then $p$ divides at least one of $f_1, dots, f_n$
]) <prime_divide_factor_corollary>

#theorem([
    let $bb(F)$ be a field, $f in bb(F)[x]$ be monic can be factorized into a product of monic prime polynomials in one unordered form
]) <polynomial_prime_factorization_theorem>

#theorem([
    let $bb(F)$ be a field, let $f in bb(F)[x]$ be monic and let $f = p_1^(n_1) dots p_k^(n_k)$ be prime factorization and let
    $
        f_j = f / p_j^(n_j) = product_(i != j) p_i^(n_i) h0 1 <= j <= k
    $
    then $f_1, dots, f_k$ are relatively prime
]) <polynomial_factor_exclude_theorem>

#theorem([
    let $bb(F)$ be a field, $f in bb(F)[x]$ is product of distinct prime iff $p$ is relatively prime to $p'$ which is the formal derivative
]) <formal_derivative_prime_polynomial_theorem>

#definition(title: "algebraically closed", [
    a field $bb(F)$ is *algebraically closed* if $deg p = 1 s0 forall p in bb(F)[x]$ be prime
]) <algebraically_closed_definition>

#definition(title: "polynomial congruent", [
    let $bb(F)$ be a field, let $f, g, h in bb(F)$, then $f$ is *congruent to* $g$ *modulo* $p$ if $(f - g) | p$ denoted as
    $
        f equiv q s0 mod p
    $
]) <polynomial_congruent_definition>

#exercise([
    let $bb(F)$ be a field
    + let $p in bb(F)[x]$ be monic, let $f, g in bb(F)[x] in.rev gcd(f, g) = 1$ then $gcd(p f, p g) = p$
    + let $bb(F)$ be algebraically closed, let $f, g in bb(F)[x]$, then $gcd(f, g) = 1 <=> f, g$ has no common root
    + let $bb(F)$ be algebraically closed, let $D$ be differentiation operator, let $f in bb(F)[x]$ be monic such that \ $f = (x - c_1) dots (x - c_k)$, then $c_1, dots, c_k$ are distinct iff $gcd(f, D f) = 1$
    + congruence of polynomial is equivalence relation
    + let $f, g, f_1, g_1, h, p in bb(F)[x]$ with $f equiv g mod p h0 f_1 equiv g_1 mod p h0 p != 0$, then
        + $f + f_1 equiv g + g_1 mod p$
        + $f f_1 equiv g g_1 mod p$
        + $h(f) equiv h(g) mod p$
    + let $p, f, g in bb(F)[x], s0 p$ is irreducible and $f g equiv 0 mod p$ then either $p equiv 0 mod p$ or $q equiv 0 mod p$
]) <prive_factor_polynomial_exercise>

#pagebreak()

= Determinants

== Commutative Rings

#definition(title: "Ring", [
    a *ring* is a set $K$ with operation $(x, y) -> x + y$ and $(x, y) -> x y$ where
    + $K$ is commutative group under $(x, y) -> x + y$
    + $(x y) z = x (y z)$
    + $x (y + z) = x y + x z ; s0 (y + z) x = y x + z x$
    if $x y = y x s0 forall x, y in K$ then $K$ is *commutative ring*\
    if $exists 1 in K suchthat 1 x = x 1 = x s0 forall x in K$ then $K$ is *ring with identity* and $1$ is *identity* of $K$
]) <ring_definition>

== Determinant Functions

#definition(title: "n-linear", [
    let $K$ be a commutative ring with identity, $n in bb(Z)^+$, $D : K^(n times n) -> K$ is *n-linear* if
    $
        "let" A = mat(alpha_1, dots, alpha_n) in K^(n times n), s0 alpha_i in K^(1 times n), s0 i = 1, dots, n
    $
    then $D in L(K^(n times n), K)$ for $alpha_i$ if all $alpha_j, s0 j!= i$ are fixed
]) <n_linear_definition>

#lemma([
    a linear combination of n-linear function is n-linear
]) <n_linear_combination_lemma>

#definition(title: "alternating", [
    let $D$ be n-linear function, then it is *alternating*, or *alternate* if
    + $D(alpha_i, alpha_j) = 0 mif alpha_i = alpha_j, s0 i != j$
    + $D(alpha_i, alpha_j) = -D(alpha_j, alpha_i)$
]) <alternating_definition>

#lemma([
    let $D$ be $2$-linear function, if $D(A) = 0, forall A in K^(2 times 2)$ where $A$ has equal rows, then $D$ is alternating
]) <2_linear_alternating_lemma>

#lemma([
    let $D$ be $n$-linear function, if $D(A) = 0, forall A in K^(n times n)$ where $A$ has two adjacent rows equal, then $D$ is alternating
]) <adjacent_row_alternating_lemma>

#definition([
    if $n in bb(Z)^+, A in K^(n times n)$ then denote $A(i|j) in K^((n-1) times (n-1))$ obtained by deleting $i$th row and $j$th column of $A$ \
    let $D$ be $(n-1)$-linear and let $A in K^(n times n)$ then denote $D_(i j) (A) = D(A(i|j))$
]) <deleting_row_column_notation_definition>

#theorem([
    let $n in bb(Z)^+$, let $D : K^((n-1) times (n-1)) -> K$ be $(n-1)$-linear function, then define $E_j$ as
    $
        E_j (A) = sum_(i=1)^n (-1)^(i+j) A_(i j) D_(i j) (A) h0 j = 1, dots, n
    $
    $E_j$ is an alternating n-linear function if $D$ is determinant function
]) <determinant_induction_construction_theorem>

#corollary([
    let $K$ be a commutative ring with identity and $n in bb(Z)^+$, then exists at least one determinant function for $K^(n times n)$
]) <determinant_exists_corollary>

#exercise([
    let $bb(K)$ be commutative ring with identity, let $bb(F)$ be a field
    + let $A in bb(K)^(2 times 2)$, define $adj A = mat(A_(2 2), -A_(1 2); -A_(2 1), A_(1 1))$ then
        + $(adj A) A = A (adj A) = (det A) I$
        + $det (adj A) = det A$
        + $adj (A^t) = (adj A)^t$
    + let $A in bb(F)^(2 times 2)$, then $A$ is invertible iff $det A != 0$
    + let $A in bb(F)^(2 times 2) in.rev A^2 = 0$, let $c in bb(F)$, then $det (c I - A) = c^2$
    + let $bb(F) subset bb(C)$ be field, let $n in bb(Z)^+$, let $j_1, dots, j_n, k_1, dots, k_n in bb(Z)^+$ each less than $n$, let $A in bb(F)^(n times n)$, define $ D(A) = product_(i = 1)^n A_(j_i k_i) $ then $D$ is $n$-linear $<=> j_1, dots, j_n$ are distinct
    + $det|_(M_(2 times 2)(bb(K)))$ is alternating and $2$-linear over column vectors
    + let $D in Lambda^n (bb(K))$, let $A, B in bb(K)^(n times n)$, then
        + one of a columns of $A$ is $0$ $=> D(A) = 0$
        + $A$ can be obtained by adding scalar multiple of rows to another from $B => D(A) = D(B)$
    + let $D in Lambda^2 (bb(K))$, let $A, B in bb(K)^(2 times 2)$, then
        + $D(A) = (det A) D(I)$
        + $det (A B) = (det A) (det B)$
    + let $A, B in bb(F)^(n times n)$, let $D : M_(n times n)(bb(F)) -> bb(F) in.rev D(A B) = D(A) D(B) s0 forall A, B$, then either of the two is true
        + $D(A) = 0 h0 forall A$
        + $D(I) = 1$ and $(D(A) != 0 <=> A "is invertible")$
]) <exercise_determinant_functions>

== Permutations and the Uniqueness of Determinants

if $(k_1, dots k_n)$ that no two $k_i$ is equal, then it is called *permutation of degree $n$* \
the group of all permutation of degree $n$ is a *symmetric group* of degree $n$ \
numbers of interchanges of a permutation determines if a permutation is *even* or *odd*, sign defined by 
$
    sign sigma = cases(
        1 h0 & mif sigma "is even",
        -1 h0 & mif sigma "is odd", 
    )
$

#theorem([
    let $K$ be a commutative ring with identity, $n in bb(Z)^+$, then $existsunique det$ on $K^(n times n)$ defined by
    $
        det A = sum_sigma (sign sigma) A_(1, sigma 1) dots A_(n, sigma n) h1 forall A in K^(n times n)
    $
    then if $D : K^(n times n) -> K$ be $n$-linear and alternating, then
    $
        D(A) = (det A) D(I) h1 forall A in K^(n times n)
    $
]) <n_linear_alternating_determinant_permutation_theorem>

#theorem([
    let $K$ be a commutative ring with identity, let $A, B in K^(n times n)$, then
    $
        det (A B) = (det A) (det B)
    $
]) <determinant_product_theorem>

#exercise([
    let $bb(F)$ be a field
    + let $A in bb(F)^(n times n)$ be invertible, then $det A != 0$
    + let $A in bb(F)^(2 times 2)$, then $det (I + A) = 1 + det A <=> tr A = 0$
    + let $A in bb(F)^(n times n)$, then $det A = A_(1 1) A_(2 2) dots A_(n n)$
    + let $sigma in S_n, s0 T(x_1, dots, x_n) = (x_sigma_1, dots, x_sigma_n)$ is invertible and $T in L(bb(F)^n, bb(F)^n)$
    + let $S = {A in bb(F)^(n times n)}$ be a set, let $V = L(S, bb(F))$ be vector space, let $W = L(Lambda^n (bb(F)), bb(F))$ be a set, then $W subset V$ is a subspace
    + let $T in L(bb(F)^n, bb(F)^n)$, define $D_T (alpha_1, dots, alpha_n) = det( T alpha_1, dots, T alpha_n)$, let $cal(B)$ be ordered basis of $bb(F)^n$, then
        + $D_T in Lambda^n (bb(F))$
        + if $exists c in bb(F) in.rev c = det(T epsilon.alt_1, dots, T epsilon.alt_n)$, then $det(T alpha_1, dots, T alpha_n) = c det(alpha_1, dots, alpha_n)$
        + $det [T]_cal(B) = c$
    + let $sigma in S_n$, let $A, B in bb(F)^(n times n)$, $A$ with row vectors $alpha_1, dots, alpha_n$, define $sigma(A) in bb(F)^(n times n)$ with row vectors $alpha_sigma_1, dots, alpha_sigma_n$, then
        + $sigma(A B) = sigma(A) B$ and $sigma(A) = sigma(I) A$
        + $sigma^(-1)(I) = sigma(I)^(-1)$
    + let $sigma, tau in S_n$, let $f : S_n -> bb(Z)$ such that $f(sigma tau) = f(sigma) f(tau)$ then $f$ is one of the followings
        + $f = 0$
        + $f = 1$
        + $f = sign$
]) <permutation_uniqueness_determinant_exercise>

== Additional Properties of Determinants

let $A in bb(F)^(r times r), C in bb(F)^(s times s), B in bb(F)^(r times s)$ then
$
    det mat(A , B; 0, C) = (det A) (det C)
$
$
    det A = sum_(i=1)^n (-1)^(i + j) A_(i j) det A(i|j)
$
then denote $C_(i j) = (-1)^(i + j) det A(i|j)$ the *cofactor* of $A$ \
the *classical adjoint* of $A$ is
$
    (adj A)_(i j) = C_(j i) = (-1)^(i+j) det A(j|i) \
    (adj A)A = (det A) I
$

#theorem([
    let $A in K^(n times n)$ be invertible iff $det A$ is invertible in $K$, if $A$ is invertible, then
    $
        A^(-1) = (det A)^(-1) adj A
    $
]) <invertible_determinant_theorem>

for equation $A X = Y$
$
    (adj A) A X = (adj A) Y \
    => (det A) X = (adj A) Y \
    => x_j = (det B_j) / (det A) h1 B_j = mat(A_(. 1), dots, A_(. j-1), Y, A_(. j+1), dots, A_(. n) )
$
which is the *Cramer's rule*

#exercise([
    let $bb(F)$ be a field, let $bb(K)$ be commutative ring with identity
    + let $A in bb(F)^(n times n)$ be skew-symmetric, then $det A = 0$
    + let $A in bb(F)^(n times n)$ be orthogonal, then $det A = plus.minus 1$
    + let $A in bb(F)^(n times n)$ be unitary, then $|det A| = 1$
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $T, U in L(V, V)$, then
        + $det (T U) = (det T) (det U)$
        + $T$ is invertible $<=> det T != 0$
    + let $A in bb(K)^(n times n)$, and $A_j in bb(K)^(r_j times r_j)$ for $j = 1, dots, k$ and $r_j in bb(Z)^+$ such that $
        A = mat(
            A_1, 0, dots, 0;
            0, A_2, dots, 0;
            dots.v, dots.v, dots.down, dots.v;
            0, 0, dots, A_k
        )
    $ then $det A = (det A_1) (det A_2) dots (det A_k)$
    + let $V = bb(F)^(n times n)$ a vector space, let $A, B in V$, let $T_B in L(V, V)$ by $T_B (A) = A B - B A$ then $det T_B = 0$
    + let $A in bb(F)^(n times n)$, then $r times r$ *submatrix* is obtained by deleting $(n - r)$ rows and columns, and the *determinant rank* of $A$ is $max r in.rev sup_((j_1, k_1), dots, (j_r, k_r)) det A[j_1 | k_1] dots [j_r | k_r] != 0$, then \ $rank A = "determinant" rank A$
    + let $A in bb(F)^(n times n)$, there are at most $n$ distinct $c in bb(F)$ such that $det (c I - A) = 0$
    + let $A, B in bb(F)^(n times n)$, if $A$ is invertible, then there are at most $n$ scalar $c in bb(f)$ such that $c A + B$ is not invertible
    + let $V = bb(F)^(n times n)$ be vector space, let $A, B in V$, define $L_B, R_B in L(V, V)$ as $L_B (A) = B A$ and $R_B (A) = A B$, then
        + $det L_B = (det B)^n$
        + $det R_B = (det B)^n$
    + let $V in bb(C)^(n times n)$ be vector space, let $B in V$, define $M_B in L(V, V)$ as $M_B (A) = B A B^*$, then $det M_B = |det B|^(2 n)$ \ let $H = {A in V | A^* = A}$ be a set, then $H$ is vector space over $bb(R)$, define $T_B = B A B^*$ be $T_B in L(H, bb(R))$, then $det T_B = |det B|^(2 n)$
    + let $A, B, C, D in bb(F)^(n times n)$ be commuting, then $
        det(mat(
            A, B; C, D
        )) = det(A D - B C)
    $
]) <additional_determinant_exercise>

== Modules

#definition(title: "module", [
    let $K$ be a commutative ring with identity, $V$ is a *module over* $K$ if:
    + $exists + suchthat (alpha, beta) -> alpha + beta, h0 alpha, beta in V$, where $V$ is a commutative group
    + $exists dot suchthat (c, alpha) -> c alpha, h0 c in K, alpha in V$ such that
        - $(c_1 + c_2)alpha = c_1 alpha + c_2 alpha$
        - $c(alpha_1 + alpha_2) = c alpha_1 + c alpha_2$
        - $(c_1 c_2) alpha = c_1 (c_2 alpha)$
        - $1 alpha = alpha$
]) <module_definition>

#definition(title: "free module", [
    the $K$-module $V$ is called a *free module* if it has a basis. \
    if $V$ has a finite basis of $n$ elements, then $V$ is *free $K$-module with $n$ generators*
]) <free_module_definition>

#definition(title: "finitely generated", [
    module $V$ is *finitely generated* if $exists S subset V suchthat V = span S$ \
    let $V$ be finitely generated, then the *rank* defined by smallest $k$ such that $span (v_1, dots, v_k) = V$
]) <finitely_generated_definition>

#theorem([
    let $K$ be a commutative ring with identity, let $V$ be free $K$-mudule with $n$ generators then $rank V = n$
]) <free_K_module_n_gen_rank_theorem>

== Multilinear Functions

#definition(title: "multilinear functions", [
    let $K$ be commutative ring with identity, let $V$ be a module over $K$, $r in bb(Z)^+$, then $L : V^r -> K$ is *multilinear* if $L(alpha_1, dots, alpha_r)$ is $r$-linear, also called as *$r$-linear form* on $V$ or *multilinear form of degree $r$* on $V$, or *$r$-tensors* on $V$

    the collection of all multilinear functions on $V^r$ denoted as $M^r (V)$ where $M^r (V)$ is a $K$-module, meanwhile a submodule of all functions $V^r -> K$ \
    if $r = 1$ then $M^1 (V) = V^*$ \
    if $r = 2$ it is *bilinear form* on $V$ \
])

define $U(alpha_1, dots, alpha_r) = f_1 (alpha_1) dots f_r (alpha_r)$ then $U in M^r (V)$ as $f_i in L(V, V)$

#definition(title: "tensor product", [
    let $L in M^r (V)$, $U in M^s (V)$ define function $L times.o U in M^(r+s) (V)$ by
    $
        (L times.o U) (alpha_1, dots, alpha_(r+s)) = L(alpha_1, dots, alpha_r) U(alpha_(r + 1), dots, alpha_(r+s))
    $
    then $L times.o U$ is the *tensor product* of $L$ and $U$, which is not commutative
]) <tensor_product_definition>

#lemma([
    let $L_1, L in M^r (V)$, let $U_1, U in M^s (V)$, let $N in M^t (V)$, let $c in K$ then
    + $(c L_1 + L) times.o U = c (L_1 times.o U) + L times.o U$
    + $L times.o (c M_1 + M) = c (L times.o U_1) + L times.o U$
    + $(L times.o U) times.o N = L times.o (U times.o N)$
]) <tensor_product_distributive_lemma>

#lemma([
    let $L_1, dots, L_k$ be multilinear functions on $V^(r_1), dots ,V^(r_n)$ ,then tensor product 
    $
        L := L_1 times.o dots times.o L_n
    $
    is well defined, let $r = r_1 + dots + r_n$ then
    $
        L(alpha_1, dots, alpha_r) = f_1 (alpha_1) dots f_r (alpha_r), h0 f_i in L(V, V)
    $
]) <tensor_product_series_lemma>

#theorem([
    let $K$ be a commutative ring with identity, $V$ be a free $K$-module of rank $n$ then $M^r (V)$ is a free $K$-module of rank $n^r$ \
    if ${f_1, dots, f_n}$ be a basis of $V^*$ then
    $
        f_(j_1) times.o dots times.o f_(j_r) h0 1 <= j_1 <= n, dots, 1 <= j_r <= n
    $
    form a basis of $M^r (V)$
]) <multilinear_module_function_degree_theorem>

#definition(title: "multilinear alternating", [
    let $L$ be a $r$-linear form on $K$-module $V$, then $L$ is *alternating* if $L(alpha_1, dots, alpha_r) = 0$ wherever $alpha_i = alpha_j$ with $i != j$

    denote $Lambda^r (V)$ as the collection of all alternating $r$-linear forms on $V$ which is a submodule of $M^r (V)$
]) <multilinear_alternating_definition>

#definition([
    let $L in M^r (V)$, $sigma$ as a permutation, then define $pi_r L in M^r (V)$ as
    $
        pi_r L = sum_sigma (sign sigma) L_sigma \
        "or " (pi_r L) (alpha_1, dots, alpha_r) = sum_sigma (sign sigma) L(alpha_(sigma 1), dots, alpha_(sigma r))
    $
]) <pi_permutation_function_on_multilinear_function_definition>

#lemma([
    $pi_r in L(M^r (V), Lambda^r (V))$

    if $L in Lambda^r (V)$ then $pi_r L = r! L$
]) <pi_permutation_linear_to_alternating_lemma>

#theorem([
    let $K$ be a commutative ring with identity, let $V$ be a free $K$-module of rank $n$
    - if $r > n$ then $Lambda^r (V) = {0}$
    - if $1 <= r <= n$ then $Lambda^r (V)$ is a free $K$-module of rank $mat(delim: "(", n ; r)$
]) <alternating_multilinear_function_rank_theorem>

a *$r$-shuffle* of ${1, dots, n}$ is picking $r$ out of $n$ and permute

#corollary([
    if $V$ is a free $K$-module of rank $n$, then $Lambda^n (V)$ is a free $K$-module of rank $1$ \
    if $T in L(V, V)$ then $existsunique c in K suchthat$
    $
        L(T alpha_1, dots, T alpha_n) = c L(alpha_1, dots, alpha_n) h0 forall L in Lambda^n (V)
    $
]) <determinant_rank_corollary>

we can denote $D_J (alpha_1, dots, alpha_r)$ for $J$ the $r$-shuffle, $D$ the determinant of $r times r$ matrix as
$
    D_j (alpha_1, dots, alpha_r) = (partial (alpha_1, dots, alpha_r)) / (partial (beta_j_i, dots, beta_j_r)) \
    "then" L(alpha_1, dots, alpha_r) = sum_(j_1 < dots < j_r) (partial (alpha_1, dots, alpha_r)) / (partial (beta_j_i, dots, beta_j_r)) L(beta_j_i, dots, beta_j_r)
$

== The Grassman Ring

#definition(title: "exterior product of field", [
    let $bb(F)$ be a field of characteristic $0$, $V$ be a vector space, then define *exterior product* or *wedge product* of $L in M^r (V)$, $U in M^s (V)$ by
    $
        L and U = 1 / (r ! s !) pi_(r+s) (L times.o M)
    $
]) <field_exterior_product_definition>

let $I = (i_1, dots, i_r)$ a $r$-shuffle, $J = (j_1, dots, j_s)$ a $s$-shuffle, assume
$
    i_1 < dots < i_r < j_1 < dots < j_s
$
and set $E_I = f_i_1 times.o dots times.o f_i_r$, $E_J = f_j_1 times.o dots times.o f_j_s$, let determinant $D_I = pi_r (E_I)$ and $D_J = pi_s (E_J)$ then
$
    D_I D_J = r! s! D_(I union J) \
    D_I and D_J = D_(I union J)
$

#theorem([
    let $K$ be a field of characteristic zero and $V$ be a vector space over $K$, then exterior product is associative operation on alternating multilinear forms on $V$
    
    namely, let $L in Lambda^r (V), M in Lambda^s (V), N in Lambda^r (V)$ then
    $
        (L and M) and N = L and (M and N)
    $
]) <field_exterior_product_associative_theorem>

#definition(title: "commutative ring with identity exterior product", [
    let $K$ be a commutative ring with identity, let $L in M^r (V), M in M^s (V)$, let $sigma in S_(r+s)$ \
    define $psi (sigma) = (sign sigma)(L times.o M)_sigma$ let $G = S_r plus.o S_({r+1, dots, r+s})$ then define $tilde(psi) (tau G) = psi (tau)$ for $tau in S_(r+s)$ then let $H = tau G$ define
    $
        L and M = sum_H tilde(psi) (H)
    $
]) <commutative_ring_with_identity_exterior_product_definition>

$
    L and M = sum_sigma (sign sigma) (L times.o M)_sigma => r! s! L and M = pi_(r+s) (L times.o M)
$

#theorem([
    let $K$ be a commutative ring with identity, let $V$ be a module over $K$, then the exterior product is associative operation on alternating multilinear forms on $V$

    namely, let $L in Lambda^r (V), M in Lambda^s (V), N in Lambda^r (V)$ then
    $
        (L and M) and N = L and (M and N)
    $
]) <commutative_ring_with_identity_exterior_product_associative_theorem>

#definition(title: "Grassman ring", [
    let $K$ be a commutative ring with identity, and $V$ be a $k$-module, define
    $
        Lambda (V) = Lambda^0 (V) plus.o Lambda^1 (V) plus.o dots plus.o Lambda^n (V)
    $
    an $(n+1)$-tuple then the ring of $Lambda (V)$ is *Grassman ring* over $V^*$
]) <grassman_ring_definition>

the Grassman ring is not a commutative ring which
$
    L and M = (-1)^(r s) M and L
$

#pagebreak()

= Elementary Canonical Forms

== Characteristic Values

#definition(title: "characteristic value", [
    let $bb(F)$ be a field, $V$ be a vector space over $bb(F)$, $T in L(V, V)$, $alpha in V$ then a *characterisitc value* of $T$ is $c in bb(F) suchthat T alpha = c alpha$
    + any $alpha in V suchthat T alpha = c alpha$ is called *characteristic vector* of $T$ associated with $c$
    + $W = {alpha in V | alpha T = c alpha}$ is *characteristic space* associated with $c$
]) <characteristic_value_definition>

#theorem([
    let $V$ be a vector space over field $bb(F)$, $T in L(V, V)$, $c in bb(F)$ then the followings are equivalent
    + $c$ is a characteristic value of $T$
    + the operator $(T - c I)$ is singular
    + $det (T - c I) = 0$
]) <characteristic_singular_det_equivalent_theorem>

#definition(title: "characteristic value for matrix", [
    let $A in bb(F)^(n times n)$, then a *characteristic value of $A$ in $bb(F)$* is $c in bb(F)$ such that $(A - c I)$ is singular

    the polynomial $f(x) = det (x I - A)$ is the *characteristic polynomial*
]) <characteristic_value_matrix_definition>

#lemma([
    similar matrices have the same characteristic polynomial
]) <characteristic_poly_similar_eq_lemma>

#definition(title: "diagonalizable", [
    let $V$ be a finite-dimensional vector space, $T in L(V, V)$, then $T$ is *diagonalizable* if $exists cal(B) suchthat [T]_cal(B) = diag (c_1, dots, c_n)$ where $cal(B)$ is a basis formed by characteristic vectors of $T$ and $c_i$ are characteristic values of $T$
]) <diagonalizable_definition>

#lemma([
    if $T alpha = c alpha$ then $f(T) alpha = f(c) alpha s0 forall f in bb(F)[x]$
]) <polynomial_linear_transform_characteristic_value_lemma>

#lemma([
    let $V$ be a finite-dimensional vector space, $T in L(V, V)$, let $c_1, dots, c_k$ be distinct characteristic values of $T$, and let $W_i$ be characteristic spaces associated with $c_i$, set $W = W_1 + dots + W_k$ then
    $
        dim W = sum_(i = 1)^k dim W_i
    $
    if $cal(B)_i$ is basis of $W_i$ then $cal(B) = (cal(B)_1, dots, cal(B)_k)$ is an ordered basis of $W$
]) <characteristic_space_linear_independence_lemma>

#theorem([
    let $V$ be a finite-dimensional vector space, let $T in L(V, V)$, let $c_1, dots, c_k$ be distinct characteristic values of $T$, and let $W_i$ be null space of $(T - c_i I)$ then the followings are equivalent
    + $T$ is diagonalizable
    + the characteristic polynomial of $T$ is $f = (x - c_1)^(d_1) dots (x - c_k)^(d_k)$ where $dim W_i =d_i$
    + $dim W = dim W_1 + dots + dim W_k$
]) <diagonalizable_equivalence_theorem>

#exercise([
    let $bb(F)$ be a field
    + let $V$ be $n$-dimensional vector space over $bb(F)$, then characteristic value of $I in V$ is $1$, with characteristic polynomail $(x-1)^n$
    + let $A in bb(F)^(n times n)$ be triangular, then characteristic values of $A$ are $A_(i i)$ for $i = 1, dots, n$
    + let $V$ be $n$-dimensional vector space, let $T in L(V, V)$ with $n$ distinct characteristic values, then $T$ is diagonalizable
    + let $A, B in bb(F)^(n times n)$, if $(I - A B)$ is invertible, then $(I - B A)$ is invertible, and \ $(I - B A)^(-1) = I + B (I - A B)^(-1) A$, also for each $A, B in bb(F)$, $A B$ and $B A$ has same characteristic values in $bb(F)$
    + let $V = {f : bb(R) -> bb(R)}$ be a vector space, let $T in L(V, V)$ as $
        (T f)(x) = integral^x_0 f(t) d t
    $ then $T$ has no characteristic values
    + let $A in bb(F)^(n times n)$ be diagonal, with characteristic polynomial $(x - c_1)^(d_1) dots (x - c_k)^(d_k)$, let \ $V = {B in bb(F)^(n times n) | B A = A B}$, then $dim V = d_1^2 + dots + d_k^2$
]) <characteristic_values_exercise>

== Annihilating Polynomials

#definition(title: "minimal polynomial of linear operator", [
    let $V$ be a finite-dimensional vector space over field $bb(F)$, let $T in L(V, V)$, a *minimal polynomial* for $T$ is the unique monic generator of the ideal of polynomial $p in bb(F)[x]$ such that $p$ annihilate $T$
]) <minimal_polynomial_linear_operator_definition>

#theorem([
    let $V$ be a $n$-dimensional vector space, let $T in L(V, V)$, then the characteristic and minimal polynomials of $T$ have the same roots, excepts for multiplicities 
]) <characteristic_minimal_poly_same_roots_theorem>

#theorem(title: "Cayley-Hamilton", [
    let $V$ be a finite-dimensional vector space, $T in L(V, V)$, if $f$ is the characteristic polynomial of $T$ then $f(T) = 0$\
    or say, minimal polynomial divides characteristic polynomial of $T$
]) <cayley_hamilton_theroem>

#exercise([
    let $bb(F)$ be a field
    + let $V$ be finite-dimensional vector space, then
        + minimal polynomial of $I$ is $m_T = x - 1$
        + minimal polynomial of $0$ is $m_0 = 0$
    + let $V$ be $n$-dimensional vector space, let $T in L(V, V)$, let $exists k in bb(Z)^+ in.rev T^k = 0$ then $T^n = 0$
    + let $A in bb(F)^(n times n)$ with characteristic polynomail $f = (x - c_1)^(d_1) dots (x - c_k)^(d_k)$ then \ $tr A = c_1 d_1 + dots + c_k d_k$
    + let $V = bb(F)^(n times n)$ be vector space, let $A, B in V$, let $T in L(V, V)$ as $T(B) = A B$, then $m_T = m_A$
]) <annihilating_polynomial_exercise>

== Invariant Subspaces

#definition(title: "invariant under operator", [
    let $V$ be a vector space and $W$ be a subspace, $T in L(V, V)$ then if $L(W) subset W$, then $W$ is *invariant under* $T$
]) <invariant_under_operator_definition>

let $alpha_1, dots, alpha_n$ be basis of $V$ and $alpha_1, dots, alpha_k$ be basis of $W$, where $k < n$, let $E in V, A in W$ then
$
    E = mat(A, B; 0, C) h0 "for some" B_(k times (n-k)), C_((n-k) times (n-k))
$

#lemma([
    let $W$ be invariant space of $T$, let $T_W$ be restriction operator of $T$ on $W$, then the characteristic polynomial of $T_W | T$, and minimal polynomial $T_W | T$
]) <invariant_polynomial_division_lemma>

#definition(title: "conductor ideal", [
    let $W$ be invariant subspace of $T in L(V, V)$, the *$T$-conductor of $alpha$ into $W$* is denoted as $S_T (alpha, W)$, which is a set of polynomials $g$ such that $g(T)alpha in W$

    in the special case $W = {0}$ is called *$T$-annihilator of $alpha$*
]) <conductor_ideal_definition>

#lemma([
    if $W$ be an invariant subspace of $T$, then $W$ is invariant under any polynomial of $T$

    thus $forall alpha in V, s0 S_T (alpha, W)$ is an ideal in $bb(F)[x]$
]) <invariant_subspace_polynomial_lemma>

#definition(title: "conductor generator", [
    the unique monic generator of $S_T (alpha, W)$ is also called *$T$-conductor of alpha into W*
]) <conductor_generator_definition>

#lemma([
    let $V$ be a finite-dimensional vector space over field $bb(F)$, let $T in L(V, V)$ where minimal polynomial $p$ is 
    $
        p = (x - c_1)^(r_1) dots (x - c_k)^(r_k) h0 c_i in bb(F)
    $
    let $W$ be a proper subset of $V$ where $T(W) subset W$ then $exists alpha in V$ sucht that
    + $alpha in.not W$
    + $(T - c I) alpha in W$ for some characteristic value $c$ of $T$ 
]) <expanding_invariant_subspace_lemma>

to be *triangulable* is to be able to find a basis $cal(B)$ for $T in L(V, V)$ such that $[L]_cal(B)$ is a triangular matrix

#theorem([
    let $V$ be a finite-dimensional vector space over field $bb(F)$, let $T in L(V, V)$, then $T$ is triangulable iff minimal polynomial of $T$ is products of linear polynomials
]) <linear_operator_triangulable_linear_poly_theorem>

#corollary([
    let $bb(F)$ be an algebraically closed, then every $A in M_(n times n)(bb(F))$ is triangulable
]) <algebraically_closed_triangulable_corollary>

#theorem([
    let $V$ be a finite-dimensional vector space over field $bb(F)$, let $T in L(V, V)$, then $T$ is diagonalizable iff minimal polynomial $p$ of $T$ is product of 
    $
        p = (x - c_1) dots (x - c_k) h0 c_i in K "be distinct"
    $
]) <diagonalizable_minimal_polynomial_factor_theorem>

#exercise([
    let $bb(F)$ be a field
    + let $V$ be a vector space over $bb(F)$, let $T in L(V, V)$, let $W subset V$ be invariant subspace for $T$, then $m_(T|_W) | m_T$
    + let $A in bb(F)^(n times n)$ such that $A^2 = A$, then $A$ is similar to diagonal matrix
    + let $V$ be $n$-dimensional vector space, let $T in L(V, V)$ be diagonalizable, let $W subset$ be invariant subspace for $T$, then $T|_W$ is diagonalizable
    + let $V$ be finite-dimensional vector space over field $bb(C)$, let $T in L(V, V)$, then $T$ is diagonalizable iff $exists f in bb(C)[x]$ of distinct roots such that $f(T) = 0$
    + let $V$ be vector space, let $T in L(V, V)$, if $forall W subset V$ is invariant under $T$, then $T = c I$ for some $c in bb(F)$
    + let $V$ be finite-dimensional vector space over algebraically closed field $bb(F)$, let $T in L(V, V)$, let $f in bb(F)[x]$, then $c$ is characteristic value of $f(T)$ iff $c = f(t)$ for $t$ be characteristic value of $T$
]) <invariant_subspace_exercise>

== Simultaneous Triangulation; Simultaneous Diagonalization

#definition(title: "invariant family of operators", [
    the subspace $W$ is *invariant under* $cal(F)$ if $W$ is invariant under every element of $cal(F)$
])

#lemma([
    let $cal(F)$ be a commuting family of triangulable linear operators on $V$, let $W$ be a proper subspace of $V$ which is invariant under $cal(F)$, then $exists alpha in V$ such that
    + $alpha in.not W$
    + $forall T in cal(F), s0 T alpha in span {alpha} union W$
]) <expanding_invariant_commuting_family_lemma>

#theorem([
    let $V$ be a finite-dimensional vector space over field $bb(F)$, let $cal(F)$ be commuting family of triangulable linear operations on $V$, then exists $cal(B)$ be an ordered basis that $forall T in cal(F), s0 [T]_cal(B)$ is triangular matrix
]) <simultaneous_triangulation_theorem>

#corollary([
    let $cal(F)$ be a comuting family of $n times n$ matrices over algebraically closed field $bb(F)$, then exists non-singular $P in bb(F)^(n times n)$ such that $P^(-1) A P$ is upper-triangular for all $A in cal(F)$
]) <similar_upper_triangular_algebraically_closed_corollary>

#theorem([
    let $cal(F)$ be a comuting family of diagonalizable linear operator on finite-dimensional space $V$, then there exists $cal(B)$ be an ordered basis that $forall T in cal(F), s0 [T]_cal(B)$ is diagonal matrix
]) <simultaneous_diagonalization_theorem>

#exercise([
    let $bb(F)$ be a field
    + let $V$ be $n$-dimensional vector space, let $T in L(V, V)$ with $n$ distinct characteristic values, then any $U in L(V, V)$ such that $U T = T U => exists f in bb(F)[x] in.rev U = f(T)$
    + let $V = bb(F)^(n times n)$ be vector space, let $A, B in V$, let $T_A in L(V, V)$ as $T_A (B) = A B - B A$, let \ $cal(F) = {T_A | A in bb(F)^(n times n) "be diagonal"}$ be a family, then $cal(F)$ is simultaneously diagonalizable
]) <simultaneous_diagonalization_exercise>

== Direct-Sum Decomposition

#definition(title: "linear independence of subspaces", [
    let $W_1, dots, W_k$ be subspaces of vector space $V$ then $W_1, dots, W_k$ are *linear independent* if 
    $
        alpha_1 + dots + alpha_k = 0 h0 alpha_i in W_i
    $
    implies trivial solution
]) <linear_independence_of_subspace_definition>

#lemma([
    let $V$ be a finite-dimensional vector space, let $W_1, dots, W_k$ be subspaces of $V$, let $W = W_1 + dots + W_k$, then the followings are equivalent
    + $W_1, dots, W_k$ are independent
    + for each $j, s0 2 <= j <= k$ that $W_j inter (W_1 + dots + W_(j-1)) = {0}$
    + if $cal(B)_i$ is an ordered basis of $W_i$ then $cal(B) = (cal(B)_1, dots, cal(B)_k)$ is ordered basis of $W$
]) <linear_independent_spaces_equivalent_lemma>

#definition(title: "direct sum", [
    if #lemref(<linear_independent_spaces_equivalent_lemma>) holds, then we say $W = W_1 + dots + W_k$ is *direct sum* denoted as
    $
        W = W_1 plus.o dots plus.o W_k
    $
]) <direct_sum_definition>

#definition(title: "projection", [
    if $V$ is a vector space, a *projection* of $V$ is $E in L(V, V)$ such that $E^2 = E$
]) <projection_definition>

#lemma([
    let $E$ be a projection and $R = range E, s0 N = null E$ then
    + the vector $beta in R$ iff $E beta = beta$
    + $V = R plus.o N$
    + $alpha = E alpha + (alpha - E alpha)$ is unique expression
    it is called *projection on $R$ along $N$*
]) <projection_range_null_lemma>

#theorem([
    if $V = W_1 plus.o dots plus.o W_k$ then exists $E_1, dots, E_k in L(V, V)$ such that
    + $E_i = E_i^2$ be a projection
    + $E_i E_j = 0 h0 i != j$
    + $I = E_1 + dots + E_k$
    + $range E_i = W_i$
]) <projection_direct_sum_theorem>

#exercise([
    let $bb(F)$ be a field
    + let $V$ be finite-dimensional vector space, let $W_1 subset V$ be a subspace, then $exists W_2 subset V$ be subspace such that $V = W_1 plus.o W_2$
    + let $V$ be finite-dimensional vector space, let $W_1, dots, W_k$ be subspace such that $V = W_1 + dots + W_k$ and $dim V = dim W_1 + dots + dim W_k$ then $V = W_1 plus.o dots plus.o W_k$
    + let $E$ be projection on $R$ along $N$, then $(I - E)$ is the projection on $N$ along $R$
    + let $V$ be vector space over $bb(R)$, let $E in L(V, V) in.rev E^2 = E$, then $(I + E)$ is invertible
    + let $bb(F)$ be subfield of $bb(C)$, let $V$ be finite-dimensional vector space over $bb(F)$, let $E_1, dots, E_k$ be projections on $V$ such that $E_1 + dots + E_k = I$, then $E_i E_j = 0 h0 i!= j$
    + let $V$ be vector space, let $W_1, dots, W_k$ be subspaces of $V$ such that $V = W_1 plus.o dots plus.o W_k$, and let \ $V_j = W_1 + dots + W_(j - 1) + W_(j + 1) + dots + W_k$, then $V^* = V_1^0 plus.o dots plus.o V_k^0$
]) <direct_sum_decomposition_exercise>

== Invariant Direct Sums

let $V = W_1 plus.o dots plus.o W_k$ be a vector space, let $cal(B) = (cal(B)_1, dots, cal(B)_k)$ be a basis, where each $cal(B)_i$ be basis of $W_i$, then $A = [T]_cal(B)$ and $A_i = [T_i]_(cal(B)_i)$, $A$ has block form
$
    A = mat(
        A_1, 0, dots, 0;
        0, A_2, dots, 0;
        dots.v, dots.v, dots.down, dots.v;
        0, 0, dots, A_k
    )
$
where $A$ is *direct sum* of $A_1, dots, A_k$

#theorem([
    let $T$ be a linear operator on vector space $V = W_1 plus.o dots plus.o W_k$, let $E_1, dots, E_k$ be projection of $W_1, dots, W_k$, then
    $
        T(W_i) subset W_i <=> T E_i = E_i T h0 forall i = 1, dots, k
    $
]) <restriction_operation_commute_theorem>

#theorem([
    let $T$ be a linear operator on finite-dimensional vector space $V$, if $T$ is diagonalizable and let $c_1, dots, c_k$ be distinct characteristic values of $T$, then $exists s0 E_1, dots, E_k$ on $V$ such that
    + $T = c_1 E_1 + dots + c_k E_k$
    + $I = E_1 + dots + E_k$
    + $E_i E_j = 0 h0 i != j$
    + $E_i^2 = E_i$
    + $range E_i = $ characteristic space for $T$ associated with $c_i$
    if exists $k$ distinct scalars $c_1, dots, c_k$ and $k$ non-zero operatiors $E_1, dots, E_k$ satisfy 1, 2, 3 then $T$ is diagonalizable and 4, 5 are satisfied
]) <diagonalizable_projection_condition_theorem>

#exercise([
    + let $V$ be a vector space, let $E$ be projection on $V$, let $T in L(V, V)$, then
        + $range E$ is invariant under $T <=> E T E = T E$
        + if both $range E, null E$ are invariant under $T <=> E T = T E$
    + let $V$ be finite-dimensional vector space, let $T in L(V, V)$, let $R = range T$, let $N = null T$, then $R, N$ are independent iff $V = R plus.o V$
    + let $V$ be a vector space, let $T in L(V, V)$, let $V = W_1 plus.o dots plus.o W_k$ with each $W_i$ invariant under $T$, let $T_i = T|_W_i$, then
        + $det T = (det T_1) dots (det T_k)$
        + $x_T = x_T_1 dots x_T_k$
        + $m_T = lcm(m_T_1, dots, m_T_k)$
]) <invariant_direct_sums_exercise>

== The Primary Decomposition Theorem

#theorem(title: "Primary Decomposition Theorem", [
    let $T$ be a linear operator finite-dimensional vector space $V$ over field $bb(F)$, let $p$ be minimal polynomial of $T$, where $p = p_1^(r_1) dots p_k^(r_k)$, $p_i$ are distinct irreducible monic polynomials over $bb(F)$, and $r_i in bb(Z)^+$ \ for $i = 1, dots, k$ then
    + $V = W_1 plus.o dots plus.o W_k$
    + $T (W_i) subset W_i h0 i = 1, dots, k$
    + $T_i in L(W_i, W_i)$ where $T_i$ is restriction of $T$ on $W_i$, then minimal polynomial of $T_i$ is $p_i^(r_i)$
]) <primary_decomposition_theorem>

#corollary([
    if $E_1, dots, E_k$ are projections associated with primary decomposition of $T$, then each $E_i$ is a polynomial of $T$

    if exists $U$ such that $U T = T U$ then $U E_i = E_i U$ for all $i = 1, dots, k$, namely $W_i$ is invariant under $U$
]) <primary_decomposition_corollary>

#definition(title: "nilpotent", [
    let $N$ be a linear operator on vector space $V$, then $N$ is *nilpotent* if $exists s0 r in bb(Z)^+ suchthat N^r = 0$
]) <nilpotent_definition>

#theorem([
    let $T$ be a linear operator on finite-dimensional vector space $V$ over field $bb(F)$, if minimal polynomial of $T$ decomposes over $bb(F)$ into product of linear polynomials, then exists diagonalizable operator $D$ on $V$, and nilpotent operator $N$ on $V$ such that
    + $T = D + N$
    + $D N = N D$
]) <diagonalizable_nilpotent_decomposition_theorem>

#exercise([
    let $bb(F)$ be a field
    + let $V = {f in bb(F)[x] | deg f <= n}$ be a vector space, then $D$ on $V$ is nilpotent
    + let $V$ be finite-dimensional vector space over field $bb(F)$, let $T in L(V, V)$ with characteristic polynomail $f = x_T = (x - c_1)^(d_1) dots (x - c_k)^(d_k)$ and minimal polynomail \ $p = m_T = (x - c_1)^(r_1) dots (x - c_k)^(r_k)$, let $W_i = null (T - c_i I)^(r_i)$, then
        + $W_i = {alpha in V | (T - c_i I)^m alpha = 0}$ for some $m in bb(Z)^+$
        + $dim W_i = d_i$
    + let $V$ be finite-dimensional vector space over $bb(C)$, let $T in L(V, V)$ with $T = D + N$, $D$ is the diagonalizable part, let $g in bb(C)[x]$, then diagonalizable part of $g(T)$ is $g(D)$
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $T in L(V, V) in.rev rank(T) = 1$, then $T$ is either diagonalizable or nilpotent, but not both
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $T in L(V, V)$ commutes with every diagonalizable linear operator on $V$, then $T = c I$ for some $c in bb(F)$
    + let $V = bb(F)^(n times n)$ be vector space, let $A, B in V$, define $T in L(V, V)$ as $T(B) = A B - B A$, if $A$ is nilpotent matrix, then $T$ is nilpotent operator
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $T in L(V, V)$, let $p = p_1^(r_1) dots p_k^(r_k)$ be minimal polynomail of $T$, let $V = W_1 plus.o dots plus.o W_k$ be primary decomposition of $T$, let $W subset V$ be subspace invariant under $T$, then $W = (W inter W_1) plus.o dots plus.o (W inter W_k)$
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $T in L(V, V)$, then $exists alpha in V in.rev p_alpha = m^T$ which $p_alpha$ generates $M(alpha; T)$
    + let $V$ be $n$-dimensional vector space, let $N in L(V, V)$ be nilpotent, then $x_N = x^n$
]) <primary_decomposition_exercise>

== Matrix Limits and Markov Chains

#definition(title: "limit of matrix", [
    let $L, A_1, A_2, dots in bb(F)^(n times m)$ then sequence $A_1, A_2, dots$ *converges* to $L$ or has limit $L$ if
    $
        lim_(k -> infinity) (A_k)_(i j) = L_(i j) h0 1 <= i <= n, s0 1 <= j <= m \
        "or" lim_(k -> infinity) A_k = L
    $
]) <matrix_limit_definition>

#theorem([
    let $A_1, A_2, dots in bb(F)^(n times m)$ be a sequence converges to $L in bb(F)^(n times m)$, then $forall P in bb(F)^(r times n), forall Q in bb(F)^(m times s)$ that
    $
        lim_(k -> infinity) P A_k = P L h0 lim_(k -> infinity) A_k Q = L Q
    $
]) <matrix_limit_product_theorem>

#theorem([
    let $bb(F)$ be algebraically closed field, let $A in bb(F)^(n times n)$, let $c_1, dots, c_n$ be characteristic values of $A$ such that $|c_1| = dots = |c_n| = 1$ and $A$ is diagonalizable, then
    $
        exists lim_(k -> infinity) A^k
    $
]) <matrix_limit_exponent_existence_theorem>

#definition(title: "Markov Chain", [
    let $M, M' in bb(R)^(n times n)$ of non-negative entries, let $v in bb(R)^n$ of non-negative entries, let $u in bb(R)^n$ of all entries $1$ then
    + $M$ is *transition matrix* iff $M^t u = u$
    + $v$ is *probability vector* iff $u^t v = 1$
    + if $M, M'$ are transition matrix, then $M M'$ are transition matrix
    + if $M$ is transition matrix, $v$ is probability vector, then $M v$ is probability vector

    stochastic process that can be modeled by transition matrix, as *Markov process*, the possible states in the process is *Markov chain*

    for a state once entered, it will not able to get out is called the *absorbing state*, if for every state exists finite steps probability to enter absorbing state then it is a *absorbing Markov chain*
]) <markov_chain_definition>

#definition(title: "regular transition matrix", [
    let $M in bb(R)^(n times n)$ be transition matrix, then $M$ is *regular* if $exists k in bb(N) in.rev M^k$ has only positive entries
]) <regular_transition_matrix_definition>

#definition(title: "row and column sum of matrix", [
    let $A in bb(C)^(n times n)$ define
    $
        & rho_j (A) = sum_(k = 1)^n |A_(k j)| h0 j = 1, dots, n \
        & nu_j (A) = sum_(k = 1)^n |A_(j k)| h0 j = 1, dots, n \
        & rho (A) = sup_(j = 1)^n rho_j h0 nu (A) = sup_(j = 1)^n nu_j \
        & "each be" bold("row/column sum")
    $
]) <row_column_sum_matrix_definition>

#definition(title: "Gerschgorin disk", [
    let $A in bb(C)^(n times n)$, define *Gerschgorin disk* $C_j = {z in bb(C) | |z - A_(j j)| < rho_j (A)- |A_(j j)|}$

    then every characteristic value is contained in a $C_j$
]) <gerschgorin_disk_definition>

#corollary([
    let $A in bb(C)^(n times n)$, let $c_1, dots, c_n$ be characteristic values of $A$ then
    + $|c_j| <= min(rho(A), nu(A))$
    + if $A$ is transition matrix then $|c_j| <= 1$ and $exists c_k = 1$
]) <gerschgorin_disk_corollary>

#theorem([
    let $A in bb(R)^(n times n)$ be regular transition matrix, then
    + multiplicity of $x - 1$ is $1$
    + $lim_(k -> infinity) A^k$ exists
    + $L = lim_(k -> infinity) A^k$ is transition matrix
    + $A L = L A = L$
    + $exists v in bb(R)^n$ be probability vector such that columns of $L = v plus.o dots plus.o v$ which $v$ is associated with characteristic value $1$
    + $forall w in bb(R)^n$ be probability vector $lim_(k -> infinity) A^k w = v$
    the probability vector $v$ is the *fixed probability vector* or *stationary vector*
]) <regular_transition_matrix_theorem>



#pagebreak()

= The Rational and Jordan Forms

== Cyclic Subspaces and Annihilators

#definition(title: "cyclic vector", [
    let $alpha in V$ be any vector in vector space $V$, the *$T$-cyclic subspace generated by $alpha$* is the subspace $Z(alpha; T)$, where for all $g in bb(F)[x], s0 g(T)alpha in Z(alpha; T)$

    if $Z(alpha; T) = V$ then $alpha$ is *cyclic vector* for $T$
]) <cyclic_vector_definition>

#definition(title: "T-annihilator", [
    let $V$ be a vector space, $alpha in V$, the *$T$-annihilator of $alpha$* is the ideal $M(alpha; T) subset bb(F)[x]$ of all $g in bb(F)[x]$ that $g(T) alpha = 0$

    the unique monic polynomial $p_alpha$ which generates $M(alpha; T)$ is also called *$T$-annihilator of $alpha$*
]) <T-annihilator_definition>

#theorem([
    let $V$ be a vector space and $alpha in V$, let $p_alpha$ be $T$-annihilator of $alpha$ then
    + $deg p_alpha = dim Z(alpha; T)$
    + let $deg p_alpha = k$ then $B = (alpha, T alpha, T^2 alpha, dots, T^(k-1) alpha)$ is a basis of $Z(alpha; T)$
    + let $U in L(Z(alpha; T), Z(alpha; T))$ induced by $T$, then minimal polynomial of $U$ is $p_alpha$
]) <cyclic_subspace_dimension_basis_theorem>

#definition(title: "companion matrix", [
    let $U$ be a linear operator on space $W$ where $dim W = k$, let the basis $cal(B) = (alpha, dots, U^(k-1) alpha)$, by minimal polynomial of $U$ be $p_alpha = c_0 + dots + c_(k-1) x^(k-1) + x^k$ then the *companion matrix* is
    $
        [U]_cal(B) = mat(
            0, 0, 0, dots, 0, -c_0;
            1, 0, 0, dots, 0, -c_1;
            0, 1, 0, dots, 0, -c_2;
            dots.v, dots.v, dots.v, dots.down, dots.v, dots.v;
            0, 0, 0, dots, 0, -c_(k-2);
            0, 0, 0, dots, 1, -c_(k-1)
        )
    $
]) <companion_matrix_definition>

#theorem([
    let $W$ be a finite-dimensional vector space, and $U in L(W, W)$, then $U$ has cyclic vector iff exists $cal(B)$ be an ordered basis of $W$ that $[U]_cal(B)$ is a companion matrix
]) <companion_matrix_cyclic_vector_theorem>

#corollary([
    if $A$ is a companion matrix of polynomial $p$, then $p$ is both characteristic and minimal polynomial of $A$
]) <companion_matrix_polynomail_char_min_corollary>

#exercise([
    let $bb(F)$ be a field
    + let $T in L(bb(F)^2, bb(F)^2)$, let $alpha in V, s0 alpha != 0, exists.not c in bb(F) in.rev T alpha = c alpha => Z(alpha; T) = V$, then $T$ has cyclic vector or $T = c I$ for some $c in bb(F)$
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $T in L(V, V)$ such that $T^2$ has cyclic vector, then $T$ has cyclic vector
    + let $V$ be $n$-dimensional vector space over $bb(F)$, let $N in L(V, V)$ be nilpotent, let $N^(n - 1) != 0$, let \ $alpha in V$ such that $N^(n - 1) alpha != 0$, then $alpha$ is a cyclic vector of $N$
    + if $A$ is the companion matrix of a monic polynomial $p$, then $p = x_A$
    + let $V$ be $n$-dimensional vector space, let $T in L(V, V)$ be diagonalizable, then
        + if $T$ has cyclic vector, then $T$ has $n$ distinct characteristic values
        + if $T$ has $n$ distinct values and ${alpha_1, dots, alpha_n}$ is a basis of charactieristic vectors for $T$, then \ $alpha = alpha_1 + dots + alpha_n$ is a cyclic vector for $T$
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $T in L(V, V)$ has a cyclic vector, let $U in L(V, V)$ such that $U T = T U$ then $exists f in bb(F)[x] in.rev U = f(T)$
]) <cyclic_subspaces_annihilators_exercise>

== Cyclic Decopmosition and the Rational Form

#definition(title: "T-admissible", [
    let $V$ be a vector space, $W$ be subspace of $V$, $T in L(V, V)$, then $W$ is *$T$-admissible*
    + $W$ is invariant under $T$
    + if $f(T) beta in W => exists gamma in W suchthat f(T) beta = f(T) gamma$
]) <t-admissible_definition>

#theorem(title: "Cyclic Decomposition Theorem", [
    let $V$ be a finite-dimensional, let $T in L(V, V)$, let $W_0$ be proper $T$-admissible subspace of $V$, then $exists s0 alpha_1, dots, alpha_r in V$ having $T$-annihilators $p_1, dots, p_r$ such that
    + $V = W_0 plus.o Z(alpha_1; T) plus.o dots plus.o Z(alpha_r; T)$
    + $p_k | p_(k-1), h0 k = 2, dots, r$
    + $p_1 dots p_r = det (x I - T)$
]) <cyclic_decomposition_theorem>

#corollary([
    let $V$ be a finite-dimensional vector space, let $T in L(V, V)$, if $W$ be $T$-admissible subspace of $V$ then $exists s0 W' plus.o W = V suchthat T(W') subset W'$
]) <admissible_subspace_complement_corollary>

#corollary([
    let $V$ be a finite-dimensional vector space, let $T in L(V, V)$ then
    + $exists alpha in V suchthat$ minimal polynomial of $T = p_alpha$ generator of $M(alpha; T)$
    + $T$ has cyclic vector iff characteristic polynomial and minimal polynomial is the same
]) <cyclic_characteristic_minimal_equiv_corollary>

#theorem(title: "Generalized Cayley-Hamilton Theorem", [
    let $V$ be a finite-dimensional vector space, $T in L(V, V)$, let $p, f$ be minimal and characteristic polynomial of $T$ then
    + $p | f$
    + $p$ and $f$ have same roots in algebraically closed field
    + if $p = f_1^(r_1) dots f_k^(r_k)$ where $f_1, dots, f_k$ are all prime, then $f = f_1^(d_1) dots f_k^(d_k)$ where $d_i = (nullity f_i (T)^(r_i)) / (deg f_i)$
]) <generalized_cayley-hamilton_theorem>

#corollary([
    if $T$ is a nilpotent linear operator of $n$-dimensional vector space, then characteristic polynomail of $T$ is $f = x^n$
]) <nilpotent_characteristic_polynomial_corollary>

#definition(title: "rational form", [
    let $V = Z(alpha_1; T) plus.o dots plus.o Z(alpha_k; T)$, let basis $cal(B)_i = (alpha_i, T alpha_i, dots, T^(r_i) alpha_i)$, set basis $cal(B) = (cal(B)_1, dots, cal(B)_k)$ then
    $
        [T]_cal(B) = A = mat(
            A_1, 0, dots, 0;
            0, A_2, dots, 0;
            dots.v, dots.v, dots.down, dots.v;
            0, 0, dots, A_k
        )
    $
    where $A_i$ be companion matrix of basis $cal(B)_i$ of annihilator $p_(alpha_i)$
    
    then $A$ is the *rational form* of $T$
]) <rational_form_definition>

#theorem([
    let $bb(F)$ be a field, let $B in bb(F)^(n times n)$ then $existsunique A ~ B$ where $A$ is of rational form
]) <rational_form_uniqueness_theorem>

#exercise([
    let $bb(F)$ be field
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $T in L(V, V)$, let $R = range T$, let $N = null T$, then
        + $exists R'$ be complementary $T$-invariant subspace iff $R inter N = {0}$
        + if $R inter N = {0}$ then $N$ is the unique $T$-invariant subspace complementary ot $R$
    + let $V$ be vector space over $bb(F)$, let $T in L(V, V)$, let $f in bb(F)[x]$, let $alpha in V$, let $f alpha = f(T) alpha$, let $V_1, dots, V_k$ be $T$-invariant subspace and $V = V_1 plus.o dots plus.o V_k$ then $f V = f V_1 plus.o dots plus.o f V_k$, then if $alpha, beta in V$ such that $M(alpha; T) = M(beta; T)$ then $M(f alpha; T) = M(f beta; T)$
    + let $A, B in bb(F)^(3 times 3)$ then $A tilde B <=> x_A = x_B and m_A = m_B$
    + let $bb(F) subset bb(C)$, let $A, B in bb(F)^(n times n)$ then $A tilde B$ over $bb(C)$ then $A tilde B$ over $bb(F)$
    + let $A in bb(C)^(n times n)$, if every characteristic value of $A$ is real, then $exists B in bb(R)^(n times n) in.rev A tilde B$
    + let $V$ be finite-dimensional vector space, let $T in L(V, V)$, then \ $exists alpha in V in.rev (exists f in bb(F)[x] in.rev f(T) alpha = 0 => f(T) = 0)$
    + let $bb(F) subset bb(C)$, let $A in bb(F)^(n times n)$, let $p = m_A$, let $A in bb(C)^(n times n)$, let $f = m_A$, then $p = f$
    + let $A in bb(R)^(n times n) in.rev A^2 + I = 0$, then $n = 2k$ for some $k in bb(Z)$, and $A tilde mat(0, -I; I, 0)$
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $T in L(V, V)$ then if $x_T = m_T = p^k$ for some irreducible $p in bb(F)[x]$ and $k in bb(Z)$, then no non-trivial $T$-invariant subspace has complementary $T$-invariant subspace
    + let $T$ be diagonalizable operator, then every $T$-invariant subspace has a complementary $T$-invariant subspace
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $T in L(V, V)$, then $T$ has cyclic vector iff $forall U in L(V, V) in.rev U T = T U => exists f in bb(F)[x] in.rev U = f(T)$
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $T in L(V, V)$, then $forall alpha in V, s0 alpha != 0$ is a cyclic vector of $T <=> x_T$ is irreducible over $bb(F)$
    + let $A in bb(R)^(n times n)$, let $T in L(bb(R)^n, bb(R)^n) in.rev [T] = A$, let $U in L(bb(C)^n), bb(C)^n in.rev [U] = A$, if the only subspace invariant under $T$ are $R^n$ and ${0}$ then $U$ is diagonalizable
]) <cyclic_decomposition_rational_form_exercise>

== The Jordan Form

#definition(title: "elementary Jordan matrix", [
    let $V$ be a finite-dimensional vector space, let $T in L(V, V)$, let $V = W_1 plus.o dots plus.o W_k$ by primary decomposition theorem, let $T_i = T |_W_i$, let $N_i = T_i - c_i I$ where $c_i$ is characteristic value of $T_i$, then $N_i$ is nilpotent and $[T_i] = J_1^((i)) plus.o dots plus.o J_(n_i)^((i))$ where
    $
        J_j^(i) = mat(
            c_i, 0, 0, dots, 0, 0;
            1, c_i, 0, dots, 0, 0;
            0, 1, c_i, dots, 0, 0;
            dots.v, dots.v, dots.v, dots.down, dots.v, dots.v;
            0, 0, 0, dots, c_i, 0;
            0, 0, 0, dots, 1, c_i
        )
    $
    is the *elementary Jordan matrix with characteristic value* $c_i$
]) <elementary_jordan_matrix_definition>

#definition(title: "Jordan form", [
    continue #defref(<elementary_jordan_matrix_definition>), every $T$ is represented as
    $
        [T] = mat(
            [T_1], 0, dots, 0;
            0, [T_2], dots, 0;
            dots.v, dots.v, dots.down, dots.v;
            0, 0, dots, [T_k]
        ) \
        [T_i] = mat(
            J_1^((i)), 0, dots, 0;
            0, J_2^((i)), dots, 0;
            dots.v, dots.v, dots.down, dots.v;
            0, 0, dots, J_(n_i)^((i))
        )
    $
    where for each $J_j^((i))$ has polynomial $f_j^((i))$ then $f_1^((i)) | dots | f_(n_i)^((i))$
]) <jordan_form_definition>

#theorem([
    for a finite-dimensional vector space $V$, with $T in L(V, V)$, having $A$ as Jordan form of $T$, by primary decomposition theorem, $V = W_1 plus.o dots plus.o W_k$, where characteristic polynomial of $T$ is \ $f = (x - c_i)^(d_i) dots (x - c_k)^(d_k)$ then
    + $A_(j, j) = c_i$ which each $c_i$ appears $d_i = dim W_i$ times, $A_(j+1, j) = 1$ others $= 0$
    + $n_i = nullity (T - c_i I)$, and $T$ is diagonalizable iff $n_i = d_i s0 forall i$
    + $forall i s0 J_1^((i)) in bb(F)^(r_i times r_i)$ where $ p = (x - c_1)^(r_1) dots (x - c_k)^(r_k)$ is minimal polynomial of $T$
    + $nullity (T - c_i I)^j = $ number of elementary Jordan block of size $j times j$
]) <jordan_form_remark_theorem>

#exercise([
    let $bb(F)$ be field
    + let $N_1, N_2 in bb(F)^(3 times 3)$ be nilpotent, then $N_1 tilde N_2 <=> m_N_1 = m_N_2$
    + let $A, B in bb(F)^(n times n) in.rev x_A = x_B = f = (x - c_1)^(d_1) dots (x - c_k)^(d_k)$ and $m_A = m_B$, if $forall d_i <= 3 => A tilde B$
    + let $n in bb(Z)^+, s0 n >= 2$, let $N in bb(F)^(n times n) in.rev N^n = 0 and N^(n - 1) != 0$, then $N$ has no square root
    + let $N_1, N_2 in bb(F)^(6 times 6) in.rev m_N_1 = m_N_2 and nullity N_1 = nullity N_2$ then $N_1 tilde N_2$
    + let $A, B in bb(F)^(n times n) in.rev x_A = x_B = f = (x - c_1)^(d_1) dots (x - c_k)^(d_k)$ and $m_A = m_B$ with solution spaces $(A - c_i I), (B - c_i I)$ same dimension for each $i$, and $forall d_i <= 6$ then $A tilde B$
    + let $N in bb(F)^(k times k)$ be elementary nilpotent, then $N^t tilde N$, and $forall A in bb(C)^(n times n) s0 A tilde A^t$
]) <jordan_from_exercise>

== Computation of Invariant Factors

#definition(title: "row operations and equivalence on polynomials", [
    let $M in bb(F)[x]^(n times m)$ over polynomial of field $bb(F)$ be a matrix, then the *elementary row operations* is defined as
    + $M_(i .) <- c M_(i .) h0 c in bb(F)$
    + $M_(i .) <- M_(i .) + f M_(j .) h0 f in bb(F)[x], s0 i != j$
    + $M_(i .) <- M_(j .) "while" M_(j .) <- M_(i .)$
    An *elementary matrix* is $M in bb(F)[x]^(m times m)$ that can be obtained by a series of row operation from $I_(m times m)$ and let $e$ be row operation function, then $e(M) = e(I) M$

    let $N, M in bb(F)[x]^(n times m)$ to said to be *row-equivalent* iff exists finite series of row operation that converts $N$ to $M$ or $M$ to $N$
    $
        M = M_0 <-> M_1 <-> dots <-> M_k = N
    $
    if $N$ is row-equivalent to $M$ then $N = P M$ where $P in bb(F)[x]^(n times n)$ be product of elementary matrix

    the *elementary column operations* and *column-equivalence* is defined similarly
]) <row_op_eq_poly_definition>

#lemma([
    let $M in bb(F)[x]^(m times n)$ where $M_(. 1) != 0$, let $p = gcd(M_(1 1), dots, M_(m 1))$, then $M$ is row-equivalent to \ $N in bb(F)[x]^(m times n)$ where
    $
        N_(. 1) = mat(p; 0; dots.v; 0)
    $
]) <row_equivalent_gcd_1st_col_lemma>

#theorem([
    let $P in bb(F)[x]^(m times m)$ then the followings are equivalent
    + $P$ is invertible
    + $det(P) != 0 and deg (det(P)) = 0$
    + $P$ is row-equivalent to $I_(m times m)$
    + $P = E_1 dots E_k$ where $E_1, dots, E_k$ are all elementary matrices
]) <invertible_polynomial_matrices_equivalent_theorem>

#corollary([
    let $M, N in bb(F)[x]^(m times n)$ then $N$ is row-equivalent to $M$ iff $exists P in bb(F)[x]^(m times m)$ be invertible such that \ $N = P M$
]) <row_eq_invertible_transform_corollary>

#definition(title: "equivalent of polynomial matrices", [
    let $N, M in bb(F)[x]^(m times n)$ is said to be *equivalent* then exists a series of row or column operations that
    $
        M = M_0 <-> M_1 <-> dots <-> M_k = N
    $
]) <equivalent_polynomial_matrices_definition>

#theorem([
    let $M, N in bb(F)[x]^(m times n)$ then $N$ is equivalent to $M$ iff $exists P in bb(F)[x]^(m times m), s0 exists Q in bb(F)[x]^(n times n)$ both invertible such that $N = P M Q$
]) <equivalent_polynomial_theorem>

#theorem([
    let $A in bb(F)[x]^(n times n)$ and let $p_1, dots, p_r$ be invariant factors of $A$ then $x I - A$ is equivalent to $diag(p_1, dots, p_r, 1, dots, 1)$
]) <invariant_factors_polynomial_eq_diag_theorem>

#definition(title: "Smith Normal Form", [
    let $N in bb(F)[x]^(m times n)$ then $N$ is in *(Smith) normal form* if
    + $N_(i j) = 0 h0 forall i != j$
    + $N_(1, 1) | N_(2, 2) | dots | N_(k, k)$ where $k = min(n, m)$
]) <smith_normal_form_definition>

#theorem([
    let $M in bb(F)[x]^(m times n)$ then $M$ is equivalent to $N in bb(F)[x]^(m times n)$ which is in Smith normal form
]) <smith_normal_form_equivalent_theorem>

#definition(title: [$delta$ function for polynomial matrices], [
    let $M in bb(F)[x]^(m times n)$ and let $1 <= k <= min(m, n)$, let
    $
        I = (i_1, dots, i_k) h0 1 <= i_1 <= dots <= i_k <= m \
        J = (j_1, dots, j_k) h0 1 <= j_1 <= dots <= j_k <= n \
        D_(I, J) = det mat(
            M_(i_1 j_1), dots, M_(i_1 j_k) ;
            dots.v, dots.down, dots.v;
            M_(i_k j_1), dots, M_(i_k j_k)
        )
    $
    then define $delta_k (M) = gcd(D_(I, J), dots) h0 forall I, J$
]) <delta_function_polynomial_matrices_definition>

#theorem([
    if $M, N in bb(F)[x]^(m times n)$ are equivalent then $delta_k (M) = delta_k (N) h0 1 <= k <= min(m, n)$
]) <equivalent_polynomial_matrices_delta_theorem>

#corollary([
    for each $M in bb(F)[x]^(m times n) s0 existsunique N in bb(F)[x]^(m times n)$ in Smith normal form, where
    $
        N_(k k) = (delta_k (M)) / (delta_(k-1) (M)) h0 1 <= k <= min(n, m)
    $
    and define $delta_0 (M) = 1$ \
    where $N$ is the *normal form* of $M$ and $N_(1 1), dots, N_(k k)$ is the *invariant factors* of $M$ for $k = min(n, m)$
]) <polynomial_matrices_unique_normal_form_invariant_corollary>

#exercise([
    let $bb(F)$ be field
    + let $V$ be finite-dimensional vector space, let $T in L(V, V)$, let $A = [T]_cal(B)$ for some ordered basis $cal(B)$ of $V$, then $T$ has cyclic vector iff determinant of $(n - 1) times (n - 1)$ submatrices of $x I - A$ are relatively prime
]) <computation_invariant_factors_exercise>

== Semi-Simple Operators

#definition(title: "semi-simple", [
    let $V$ be a finite-dimensional vector space over field $bb(F)$, let $T in L(V, V)$, to say $T$ is *semi-simple* is to say that $forall W subset V$ be a $T$-invariant vector space, then $exists W' plus.o W = V$ such that $W'$ is $T$-invariant
]) <semi_simple_definition>

#lemma([
    let $V$ be a finite-dimensional vector space, let $T in L(V, V)$, let $V = W_1 plus.o dots plus.o W_k$ and $p = p_1^(r_1) dots p_k^(r_k)$ be invariant subspaces and minimal polynomials by primary decomposition theorem, \ then $W_i = null p_i^(r_i) (T)$, let $W$ be any $T$-invariant subspace of $V$ then
    $
        W = (W inter W_1) plus.o dots plus.o (W inter W_k)
    $
]) <invariant_subspace_direct_sum_lemma>

#lemma([
    let $V$ be a finite-dimensional vector space over field $bb(F)$, let $T in L(V, V)$, if minimal polynomial of $T$ is a prime polynomial over $bb(F)$ then $T$ is semi-simple
]) <prime_minimal_polynomial_semi_simple_lemma>

#theorem([
    let $V$ be a finite-dimensional vector space over field $bb(F)$, let $T in L(V, V)$ then $T$ is semi-simple iff minimal polynomial of $T$ is $p = p_1 dots p_k$ where $p_1, dots, p_k$ are distinct prime polynomials over $bb(F)$
]) <distinct_prime_polynomial_semi_simple_theorem>

#corollary([
    let $V$ be a finite-dimensional vector space over algebraically closed field $bb(F)$, let $T in L(V, V)$ then $T$ is semi-simple iff $T$ is diagnoalizable
]) <algebraically_closed_semi_simple_diagonalizable_corollary>

#lemma(title: "Taylor's Formula", [
    let $bb(F)$ be a field of characteristic zero, and let $g, h in bb(F)[x]$, if $f in bb(F)[x] suchthat deg f <= n$ then
    $
        f(g) = f(h) + f^((1))(h)(g-h) + (f^((2))(h))/2(g-h)^2 + dots + (f^((n))(h))/(n!)(g-h)^n
    $
]) <taylor_formula_polynomial_extension_lemma>

#lemma([
    let $bb(F) subset bb(C)$ be a field, let $f in bb(F)[x]$, let $f'$ be formal derivative of $f$, then the followings are equivalent
    + $f$ is product of distinct prime polynomial over $bb(F)$
    + $gcd(f, f') = 1$
    + $f$ has no repeated roots in $bb(C)$
]) <product_distinct_prime_polynomial_equivalent_lemma>

#theorem([
    let $bb(F) subset bb(C)$ be a field, let $V$ be a finite-dimensional vector space over $bb(F)$, let $T in L(V, V)$, let $cal(B)$ be an ordered basis of $V$, let $A = [T]_cal(B)$, then $T$ is semi-simple iff $A$ is similar to a diagonal matrix over $bb(C)$
]) <semi_simple_similar_diagonal_matrix_complex_theorem>

#theorem([
    let $bb(F) subset bb(C)$ be a field, let $V$ be a finite-dimensional vector space over $bb(F)$, let $T in L(V, V)$ then $existsunique S$ be semi-simple, $existsunique N$ be nilpotent over $V$ such that
    + T = S + N
    + S N = N S
]) <semi_simple_nilpotent_decomposition_theorem>

#exercise([
    let $bb(F) subset bb(C)$ be field
    + let $V$ be vector space over $bb(F)$, let $N in L(V, V)$ be nilpotent, let $f in bb(F)[x]$, then semi-simple part of $f(N) = c I$ for some $c in bb(F)$
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $T in L(V, V)$ be semi-simple, let $f in bb(F)[x]$, then $f(T)$ is semi-simple
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $T in L(V, V)$, let $f in bb(F)[x]$, then $T$ is semi-simple iff when $f(T)$ is nilpotent $=> f(T) = 0$
]) <semi_simple_operators_exercise>

#pagebreak()

= Inner Product Spaces

== Inner Products

#definition(title: "inner product", [
    let field $bb(F)$ be $bb(C)$ or $bb(R)$, let $V$ be a vector space over $bb(F)$, *inner product* $inpd(., .)$ on $V$ is $(V, V) -> bb(F)$, let $alpha, beta, gamma in V$ and let $c in bb(F)$ then define
    + $inpd(alpha + beta, gamma) = inpd(alpha, gamma) + inpd(beta, gamma)$
    + $inpd(c alpha, beta) = c inpd(alpha, beta)$
    + $inpd(beta, alpha) = overline(inpd(alpha, beta))$
    + $inpd(alpha, alpha) > 0 mif alpha != 0$
    then imply $inpd(alpha, c beta + gamma) = overline(c) inpd(alpha, beta) + inpd(alpha, gamma)$
]) <inner_product_definition>

let $bb(F)$ be $bb(R)$ or $bb(C)$, let $alpha, beta in bb(F)^n$ which $[alpha] = [x_1, dots, x_n]$, $[beta] = [y_1, dots, y_n]$ then \
the *standard inner product* is defined as
$
    inpd(alpha, beta) = sum_(i=1)^n x_i overline(y_i)
$
let $X, Y in bb(F)^(n times 1)$ and let $Q in bb(F)^(n times n)$ be invertible then inner product can also be present as
$
    inpd(X, Y) = Y^* Q^* Q X^*
$
when $Q = I$ then it is standard inner product

the *norm* $||alpha||$ is denoted as $||alpha||^2 = inpd(alpha, alpha)$ then 
$
    ||alpha plus.minus beta||^2 = ||alpha||^2 plus.minus 2 real inpd(alpha, beta) + ||beta||^2 \
    inpd(alpha, beta) = 1/4 ||alpha + beta||^2 - 1/4 ||alpha - beta||^2 + i/4 ||alpha + i beta||^2 - i/4 ||alpha - i beta||^2 \
    = 1/4 sum_(n=1)^4 i^n ||alpha + i^n beta||^2
$
let $cal(B) = (gamma_1, dots, gamma_k)$ be a basis, and $[alpha]_cal(B) = X, s0 [beta]_cal(B) = Y$ let $G_(j k) = inpd(gamma_k, gamma_j)$ then
$
    inpd(alpha, beta) = Y^* G X
$
where $G$ is the *matrix of inner product in ordered basis* $cal(B)$ then $G = Q^* Q$ which $G^* = G$ and additinally
$
    X^* G X > 0, h0 X != 0
$

#exercise([
    + let $V$ be vector space, and $inpd(space, space)$ be inner product on $V$, then
        + $inpd(0, beta) = 0 h0 forall beta in V$
        + $inpd(alpha, beta) = 0 h0 forall beta in V => alpha = 0$
    + let $V$ be vector space over field $bb(F)$, sum of two inner products on $V$ is inner product of $V$, and positive multiple of inner product on $V$ is inner product on $V$
    + let $A in bb(R)^(2 times 2)$, let $X, Y in bb(R)^(2 times 1)$, let $f_A (X, Y) = Y^t A X$, then $f_A$ is inner product on $bb(R)^(2 times 1) <=> h0 A = A^t, A_(1 1) > 0, A_(2 2) > 0, det A > 0$
    + let $V$ be vector space over $bb(R)$ or $bb(C)$, with inner product, then the inner product satisfies *parallelogram law* $||alpha + beta||^2 + ||alpha - beta||^2 = 2 ||alpha||^2 + 2 ||beta||^2$
    + let $V$ be finite-dimensional vector space over field $bb(F)$, let $cal(B) = {alpha_1, dots, alpha_n}$ be basis of $V$, let $inpd(space, space)$ be inner product on $V$, let $c_1, dots, c_n in bb(F)$, then $existsunique alpha in V in.rev inpd(alpha, alpha_j) = c_j$ for all $j$
    + let $V$ be complex vector space, let $J : V -> V$ be *conjugation* satisfies \ $J(alpha + beta) = J(alpha) + J(beta), s0 J(c alpha) = overline(c) J(alpha), s0 J(J(alpha)) = alpha h0 alpha, beta in V, s0 c in bb(C)$, let $f$ be inner product on $W$, then
        + $W = {alpha in V | J alpha = alpha}$ is vector space over $bb(R)$
        + $forall alpha V existsunique beta, gamma in W in.rev alpha = beta + i gamma$
        + $J alpha = beta - i gamma$ defines a conjugation on $V$ such that $J alpha = alpha$ iff $alpha in W$
        + $J$ is the only conjugation on $V$ of this property
        + $existsunique g$ be inner product on $V$ such that $g(alpha, beta) = f(alpha, beta) h0 forall alpha, beta in W$
        + $g(J alpha, J beta) = g(beta, alpha) h0 forall alpha, beta in V$
    + let $W$ be finite-dimensional real subspace of complex vector space $V$, then $forall alpha in V existsunique beta, gamma in W in.rev alpha = beta + i gamma <=> forall cal(B)$ be basis of $W$ is also basis of $V$
]) <inner_product_exercise>

== Inner Product Spaces

#definition(title: "inner product space", [
    an *inner product space* is a real or complex vector space with a specified inner product
]) <inner_product_space_definition>

#theorem([
    if $V$ is an inner product space, then let $alpha, beta in V$ and $c in bb(F)$ then
    + $||c alpha|| = |c| ||alpha||$
    + $||alpha|| > 0 s0 forall alpha != 0$
    + $|inpd(alpha, beta)| <= ||alpha|| ||beta||$ #h0 is the *Cauchy-Schwarz inequality* only equals when $beta = (inpd(beta, alpha))/(||alpha||^2)alpha$
    + $||alpha + beta|| <= ||alpha|| + ||beta||$
]) <inner_product_norm_theorem>

#definition(title: "orthogonal and orthonormal", [
    let $alpha, beta in V$ where $V$ is a inner product space, then $alpha$ is *orthogonal* to $beta$ if $inpd(alpha, beta) = 0$, which is reflexive

    let $S subset V$ such that $forall alpha, beta in S, s0 alpha != beta, s0 inpd(alpha, beta) = 0 s0$ then $S$ is an *orthogonal set*

    let $S subset V$ be orthogonal, if $forall alpha in S, s0 ||alpha|| = 1$ then $S$ is an *orthonormal set*
]) <orthogonal_orthonormal_definition>

#theorem([
    an orthogonal set of non-zero vectors is linearly independent
]) <orthogonal_set_linear_independent_theorem>

#corollary([
    let $beta$ be a vector of linear combination of orthogonal set ${alpha_1, dots, alpha_m}$ then
    $
        beta = sum_(k = 1)^m (inpd(beta, alpha_k))/(||alpha_k||^2) alpha_k
    $
]) <orthogonal_linear_combination_corollary>

#theorem([
    let $V$ be an inner product space, let $beta_1, dots, beta_n in V$ be independent, then exists orthogonal set $S = {alpha_1, dots, alpha_k}$ be a basis of $span(beta_1 , dots, beta_k)$
    
    where $S$ is constructed by *Gram-Schmidt orthogonalization process*
    having $alpha_1 = beta_1$ and
    $
        alpha_(m + 1) = beta_(m + 1) - sum_(k = 1)^m (inpd(beta_(m+1), alpha_k))/(||alpha_k||^2) alpha_k
    $
]) <gram_schmidt_orthogonalization_process_theorem>

#corollary([
    every finite-dimensional inner product space has an orthonormal basis
]) <inner_product_space_orthonormal_basis_corollary>

#definition(title: "best approximation", [
    let $V$ be a vector space, let $W subset V$ be a vector space, let $beta in V$ and $alpha, gamma in W$ then the *best approximation* $alpha$ satisfies
    $
        ||beta - alpha|| <= ||beta - gamma|| s0 forall gamma in W
    $
]) <best_approximation_definition>

#theorem([
    let $V$ be inner product space, let $W subset V$ be a subspace, let $beta in V$ then
    + $alpha in W$ be best approximation of $beta$ iff $forall gamma in W s0 inpd(beta - alpha, gamma) = 0$
    + if best approximation to $beta$ in $W$ exists, then it is unique
    + if $W$ is finite-dimensional and ${alpha_1, dots, alpha_n}$ is any orthonormal basis of $W$ then
    $
        alpha = sum_(k = 0)^n (inpd(beta, alpha_k))/(||alpha_k||^2) alpha_k "is the unique best approximation of" beta
    $
]) <best_approximation_theorem>

#definition(title: "orthogonal complement", [
    let $V$ be an inner product space and $S subset V$ be any set, then *orthogonal complement* of $S$ is \ $S^bot = {alpha in V | forall beta in S s0 inpd(alpha, beta) = 0}$
]) <orthogonal_complement_definition>

#definition(title: "orthogonal projection", [
    the best approximation of #theref(<best_approximation_theorem>) is the *orthogonal projection of $beta$ on $W$*, if every $V$ has an orthogonal projection on $W$ then the mapping is *orthogonal projection of $V$ on $W$*
]) <orthogonal_projection_definition>

#corollary([
    let $V$ be inner product space and $W subset V$ finite-dimensional subspace, let $E$ be orthogonal projection of $V -> W$ then $beta -> beta - E beta$ is orthogonal projection of $V -> W^bot$
]) <orthogonal_complement_projection_corollary>

#theorem([
    let $V$ be inner product space, let $W subset V$ be finite-dimensional subspace, let $E$ be orthogonal projection of $V -> W$, then 
    + $E in L(V, W)$ is idempotent
    + $W^bot = null E$
    + $V = W plus.o W^bot$
]) <orthogonal_projection_subspace_direct_sum_theorem>

#corollary([
    by #theref(<orthogonal_projection_subspace_direct_sum_theorem>) then
    + $I - E$ is orthogonal projection of $V -> W^bot$
    + $I - E in L(V, W^bot)$ be idempotent
    + $I - E = null W$ 
]) <orthogonal_projection_complement_corollary>

#corollary(title: "Bessel's inequality", [
    let $V$ be inner product space, let ${alpha_1, dots, alpha_n}$ be orthogonal set of non-zero vectors, let $beta in V$ then
    $
        sum_(k = 1)^n (|inpd(beta, alpha_k)|^2)/(||alpha_k||^2) <= ||beta||^2
    $
]) <bessels_inequality_corollary>

#exercise([
    + let $V$ be inner product space, let $alpha, beta, gamma in V$, let *distance* be defined as $d(alpha, beta) = ||alpha - beta||$, then 
        + $d(alpha, beta) >= 0$
        + $d(alpha, beta) = 0 <=> alpha = beta$
        + $d(alpha, beta) = d(beta, alpha)$
        + $d(alpha, beta) <= d(alpha, gamma) + d(gamma, beta)$
    + let $V$ be inner product space, let $alpha, beta in V$, then $alpha = beta <=> inpd(alpha, gamma) = inpd(beta, gamma) s0 forall gamma in V$
    + let $V$ be finite-dimensional inner product space, let ${alpha_1, dots, alpha_n}$ be orthonormal basis of $V$, let $alpha, beta in V$, then $
        inpd(alpha, beta) = sum_(k = 1)^n inpd(alpha, alpha_k) overline(inpd(beta, alpha_k))
    $
    + let $W$ be finite-dimensional subspace of inner product space $V$, let $E in L(V, W)$ be orthogonal projection, let $alpha, beta in V$, then $inpd(E alpha, beta) = inpd(alpha, E beta)$
    + let $V$ be inner product space, let $S subset V$ be subset, then $(S^bot)^bot supset span S$, and when $V$ is finite-dimensional, then $(S^bot)^bot = span S$
    + let $V$ be finite-dimensional inner product space, let $cal(B) = {alpha_1, dots, alpha_n}$ be orthonormal basis of $V$, let $T in L(V, V)$, let $A = [T]_cal(B)$, then $A_(i j) = inpd(T alpha_j, alpha_i)$
    + let $V = W_1 plus.o W_2$ be vector space, let $f_1, f_2$ be inner products on $W_1, W_2$ respectively, then $existsunique f$ as inner product on $V$ such that
        + $W_2 = W_1^bot$
        + $f(alpha, beta) = f_k (alpha, beta) h0 alpha, beta in W_k, s0 k = 1, 2$
    + let $V$ be inner product space, let $W subset V$ be finite-dimensional subspace, if $E in L(V, W)$ such that $||E alpha|| <= ||alpha|| h0 forall alpha in V$ then $E$ is the orthogonal projection on $W$
]) <inner_product_spaces_exercise>

== Linear Functionals and Adjoints

#theorem([
    let $V$ be finite-dimensional inner product space, let $f in L(V, bb(F))$, then $existsunique beta in V$ such that \
    $f(alpha) = inpd(alpha, beta) s0 forall alpha in V$
]) <finie_dimensional_linear_functional_inner_p_theorem>

#theorem([
    let $V$ be finite-dimensional inner product space, let $T in L(V, V)$ be arbitrary, then $existsunique T^* in L(V, V)$ such that $inpd(T alpha, beta) = inpd(alpha, T^* beta) s0 forall alpha, beta in V$
]) <finite_dimensional_adjoint_existence_theorem>

#theorem([
    let $V$ be a finite-dimensional inner product space, let $T in L(V, V)$, let $cal(B) = (alpha_1, dots, alpha_n)$ be orthonormal basis of $V$, let $A = [T]_cal(B)$, then $A_(k j) = inpd(T alpha_j, alpha_k)$
]) <linear_operator_orthonormal_basis_inner_theorem>

#corollary([
    let $V$ be finite-dimensional inner product space, let $T in L(V, V)$, then in any orthonormal basis of $V$, $T^*$ is conjugate transpose of $T$
]) <adjoint_conjugate_transpose_corollary>

#definition(title: "adjoint", [
    let $V$ be inner product space, $T in L(V, V)$, then if $exists T^* in L(V, V)$ such that \
    $inpd(T alpha, beta) = inpd(alpha, T^* beta) s0 forall alpha, beta in V$ then say *$T$ has adjoint on $V$*
]) <adjoint_definition>

#theorem([
    let $V$ be finite-dimensional inner product space, let $T, U in L(V, V)$, let $c in bb(F)$ then
    + $(T + U)^* = T^* + U^*$
    + $(c T)^* = overline(c) T^*$
    + $(T U)^* = U^* T^*$
    + $(T^*)^* = T$
]) <adjoint_linear_combination_theorem>

for $T in L(V, V)$ then $T = U_1 + i U_2$ where $U_1 = U_1^*$ and $U_2 = U_2^*$, if $T = T^*$ then $T$ is *self-adjoint* or *Hermitian*

#exercise([
    + let $V$ be finite-dimensional inner product space, let $T in L(V, V)$ be invertible, then $T^*$ is invertible, and $(T^*)^(-1) = (T^(-1))^*$
    + let $V$ be finite-dimensional inner product space, let $T in L(V, V)$, then $range T^* = (null T)^bot$
    + let $V$ be inner product space, let $alpha, beta, gamma in V$, then $T alpha = inpd(alpha, beta) gamma$ defines a linear operator on $V$, and has adjoint
    + let $T, U$ be self-adjoint operator, then $T U$ is self-adjoint iff $T U = U T$
    + let $V$ be finite-dimensional inner product space, let $E in L(V, V)$ be idempotent, then $E$ is self-adjoint iff $E E^* = E^* E$
    + let $V$ be finite-dimensional complex inner product space, let $T in L(V, V)$, then $T$ is self-adjoint iff $inpd(T alpha,alpha) in bb(R) h0 forall alpha in V$
]) <linear_functionals_adjoints_exercise>

== Unitary Operations

#definition(title: "isomorphism of inner product space", [
    let $V, W$ be inner product space over field $bb(F)$, let $T in L(V, W)$, then $T$ *preserves inner product* if $inpd(T alpha, T beta) = inpd(alpha, beta) s0 forall alpha, beta in V$

    an *isomorphism* of $V -> W$ is $T: V -> W$ bijection which preserves inner product, and $V, W$ are *isomporphic*
]) <isomorphism_inner_product_space_definition>

#theorem([
    let $V, W$ be finite-dimensional inner product space over $bb(F)$, with $dim V = dim W$, let $T in L(V, W)$ then the followings are equivalent
    + $T$ preserves inner product
    + $T$ is an isomorphism
    + $T$ carries every orthonormal basis of $V$ to an orthonormal basis of $W$
    + $T$ carries some orthonormal basis of $V$ to an orthonormal basis of $W$
]) <isomorphism_inner_product_equivalent_theorem>

#corollary([
    let $V, W$ be finite-dimensional inner product space over $bb(F)$ \
    then $V, W$ are isomorphic iff $dim V = dim W$
]) <isomorphic_inner_dimension_corollary>

#theorem([
    let $V, W$ be inner product space over $bb(F)$, let $T in L(V, W)$, \
    then $T$ preserves inner product iff $||T alpha|| = ||alpha|| s0 forall alpha in V$
]) <preserve_inner_product_same_norm_theorem>

#definition(title: "unitary operator", [
    a *unitary operator* on inner product space is an isomorphism onto itself
]) <unitary_operator_definition>

#theorem([
    let $V$ be an inner product space, let $U in L(V, V)$, then $U$ is unitary iff $exists U^*$ and $U U^* = U^* U = I$
]) <unitary_adjoint_product_identity_theorem>

#definition(title: "unitary matrix", [
    a matrix $A$ is *unitary* iff $A^* A = I$
]) <unitary_matrix_definition>

#theorem([
    let $V$ be finite-dimensional inner product space, let $U in L(V, V)$, then $U$ is unitary iff $[U]_cal(B)$ is unitary matrix in some or every ordered orthonormal basis $cal(B)$ of $V$
]) <unitary_operator_matrix_orthonormal_basis_theorem>

#definition(title: "orthogonal matrix", [
    let $A in bb(R)^(n times n)$ or $A in bb(C)^(n times n)$, then $A$ is *orthogonal* if $A^t A = I$
]) <orthogonal_matrix_definition>

#definition(title: $T^+(n)$, [
    define $T^+(n) = {A in M_(n times n)(bb(C)) | (forall j) A_(j j) > 0 and (forall j < k) A_(j k) = 0}$
    which is a lower triangular matrix with positive diagonal entries
]) <lower_triangular_positive_diagonal_matrix_definition>

#definition(title: "general linear group", [
    define $GL(n) = {A in M_(n times n)(bb(C)) | det A != 0}$, which is *general linear group*, a group of invertible $n times n$ matrix
]) <genearl_linear_group>

#definition(title: "unitary group", [
    define *unitary group* $U(n) = {A in GL(n) | A^* A = I}$
]) <unitary_group>

#definition(title: "orthogonal group", [
    define *orthogonal group* $O(n) = {A in GL(n) | A^t A = I}$
]) <unitary_group>

#theorem([
    $forall B in GL(n) s0 existsunique M in T^+(n) suchthat M B$ is unitary
]) <gram_schmidt_unitary_transform_theorem>

#corollary([
    $forall B in GL(n) s0 existsunique N in T^+(n), existsunique U in U(n) suchthat B = N U$
]) <unitary_lower_triangular_decomposition_corollary>

#definition(title: "unitary/diagonal equivalent", [
    let $A, B in M_(n times n)(bb(C))$ then $B$ is *unitarily equivalent to* $A$ if $exists P in U(n) suchthat B = P^(-1) A P$

    then $B$ is *orthognoally equivalent to* $A$ if $exists P in O(n) suchthat B = P^t A P$
]) <unitary_diagonal_equivalent_definition>

#exercise([
    + let $V = bb(C)^(n times n)$ be space with inner product $inpd(A, B) = tr (A B^*)$, let $M, A in V$, let $T_M in L(V, V)$ defined as $T_M (A) = M A$, then $T_M$ is unitary iff $M$ is unitary matrix
    + let $V subset bb(C)$ be vector space over $bb(R)$, let $alpha, beta in V$, then
        + $inpd(alpha, beta) = real(alpha, overline(beta))$ defines an inner product on $V$
        + $V tilde.equiv bb(R)^2$
        + for each $gamma in V$, let $M_gamma in L(V, V)$ as $M_gamma (alpha) = gamma alpha$ then $(M_gamma)^* = M_overline(gamma)$
    + let $V = bb(R)^2$ with standard inner product, let $U in L(V, V)$ be unitary, then $ [U] = mat(cos theta, -sin theta; sin theta, cos theta) "or" mat(cos theta, sin theta; sin theta, -cos theta) $ for some $theta in bb(R)$, $0 <= theta < 2 pi$, let $U_theta$ be the first matrix, then $U_theta^* = U_(-theta)$
    + let $V$ be finite-dimensional inner product space, let $W subset V$ be subspace, then $V = W plus.o W^bot$, then $forall alpha in V s0 existsunique beta in W s0 existsunique gamma in W^bot s0 in.rev alpha = beta + gamma$, then define $U in L(V, V)$ as $U alpha = beta - gamma$ then $U$ is both self-adjoint and unitary
    + let $V$ be complex inner product space, let $T in L(V, V)$ be self-adjoint, let $alpha, beta in V$, then
        + $||alpha + i T alpha|| = ||alpha - i T alpha|| h0 forall alpha in V$
        + $alpha + i T alpha = beta + i T beta <=> alpha = beta$
        + $I plus.minus i T$ is non-singular
        + if $V$ is finite-dimensional, then $U = (I - i T) (I + i T)^(-1)$ which is the *Cayley transform* of $T$
    + let $theta in bb(R)$, then $mat(cos theta, -sin theta; sin theta, cos theta)$ is unitarily equivalent to $mat(e^(i theta), 0; 0, e^(-i theta))$
    + let $V$ be finite-dimensional inner product space, let $T in L(V, V)$ be positive, let $p_T$ be inner product on $V$ as $p_T (alpha, beta) = inpd(T alpha, beta)$, let $U in L(V, V)$, and $U^*$ be adjoint respect to $inpd(space, space)$, then $U$ is unitary respect to $p_T <=> T = U^* T U$
    + let $V$ be finite-dimensional inner product space, let $alpha, beta in V$, let $T_(alpha, beta) in L(V, V)$ as \ $T_(alpha, beta) (gamma) = inpd(gamma, beta) alpha$, then 
        + $T_(alpha, beta)^* = T_(beta, alpha)$
        + $tr T_(alpha, beta) = inpd(alpha, beta)$
        + $T_(alpha, beta) T_(gamma, delta) = T_(alpha, inpd(beta, gamma) delta)$
    + let $V$ be $n$-dimensional inner product space over field $bb(F)$, then $existsunique T in L(V, V)$ such that \ $||T_(alpha, beta)||^2 = ||alpha||^2 ||beta||^2 h0 forall alpha, beta in V$, and $L(V, V) tilde.equiv bb(F)^(n times n)$
    + let $V, W$ be finite-dimensional inner product spaces, of $dim V = dim W$, let $U in L(V, W)$ be isomorphism, then
        + $T -> U T U^(-1)$ is an isomorphism of $L(V, V) -> L(W, W)$
        + $tr (U T U^(-1)) = tr T h0 forall T in L(V, V)$
        + $U T_(alpha, beta) U^(-1) = T_(U alpha, U beta)$
        + $(U T U^(-1))^* = U T^* U^(-1)$
        + if $L(V, V)$ has inner product $inpd(T_1, T_2) = tr(T_1 T_2^*)$ and similar for $L(W, W)$, then $T -> U T U^(-1)$ is an inner product space isomorphism
    + let $V$ be inner product space, a *rigid motion* is $T : V -> V$ with $||T alpha - T beta|| = ||alpha - beta||$ for $alpha, beta in V$, then
        + let $V = bb(R)^2$ with standard inner product, and $T(0) = 0$ then $T$ is linear and unitary
        + every rigid motion in $bb(R)^2$ is either translation $->$ rotation, or translation $->$ reflection
]) <unitary_operators_exercise>

== Normal Operators

#definition(title: "normal operator", [
    let $V$ be a finite-dimensional inner product space, let $T in L(V, V)$, then $T$ is *normal* if $T T^* = T^* T$
]) <normal_operator_definition>

#theorem([
    let $V$ be inner product space, let $T in L(V, V)$ be self-adjoint, then characteristic values of $T$ are real, and characteristic vectors of $T$ associated with distinct characteristic values are orthogonal
]) <self_adjoint_characteristic_real_orthogonal_theorem>

#theorem([
    let $V$ be finite-dimensional inner product space and $dim V > 0$, then $forall T in L(V, V)$ such that $T$ is self-adjoint has a non-zero characterisitc vector
]) <self_adjoint_finite_dimensional_exists_characteristic_vector_theorem>

#theorem([
    let $V$ be finite-dimensional inner product space, let $T in L(V, V)$, let $W subset V$ be subspace invariant under $T$, then $W^bot$ is invariant under $T^*$
]) <invariant_adjoint_orthogonal_complement_theorem>

#theorem([
    let $V$ be finite-dimensional inner product space, let $T in L(V, V)$ be self-adjoint, then $exists cal(B) = {alpha_1, dots, alpha_n}$ be orthonormal basis of $V$ such that each $alpha_i$ is characteristic vector of $T$
]) <self_adjoint_orthogonal_basis_characteristic_vector_theorem>

#corollary([
    let $A in bb(C)^(n times n)$ be Hermitian, then exists $P in U(n)$ such that $P^(-1) A P$ is diagonal

    let $A in bb(R)^(n times n)$ be symmetric, then exists $P in O(n)|_bb(R)$ such that $P^(-1) A P$ is diagonal
]) <diagonal_hermitian_symmetric_similar_corollary>

#theorem([
    let $V$ be finite-dimensional inner product space, let $T in L(V, V)$ be normal, let $alpha in V$, \
    then $T alpha = c alpha <=> T^* alpha = overline(c) alpha$ for some $c in bb(C)$
]) <characteristic_value_adjoint_conjugate_theorem>

#definition(title: "normal matrix", [
    let $A in bb(C)^(n times n)$ then $A$ is *normal* if $A A^* = A^* A$
]) <normal_matrix_definition>

#theorem([
    let $V$ be finite-dimensional inner product space, let $T in L(V, V)$, let $cal(B)$ be orthonormal basis of $V$, let $A = [T]_cal(B)$ be upper-triangular, then $T$ is normal iff $A$ is diagonal
]) <normal_upper_triangular_diagonal_theorem>

#theorem([
    let $V$ be finite-dimensional inner product space, let $T in L(V, V)$, then $exists cal(B)$ be orthonormal basis of $V$ such that $[T]_cal(B)$ is upper-triangular
]) <exists_upper_triangular_orthonormal_basis_theorem>

#corollary([
    let $A in bb(C)^(n times n)$ then $exists U in U(n) suchthat U^(-1) A U$ is upper-triangular
]) <upper_triangular_unitary_similar_corollary>

#theorem([
    let $V$ be finite-dimensional complex inner product space, let $T in L(V, V)$ be normal, then $exists cal(B) = {alpha_i}$ be orthonormal basis of $V$ such that each $alpha_i$ be characteristic vectors of $T$
]) <normal_orthonormal_basis_characteristic_vector_theorem>

#corollary([
    let $A in bb(C)^(n times n)$ be normal, then $exists P in U(n) suchthat P^(-1) A P$ is diagonal
]) <normal_unitary_similar_diagonal_corollary>

#exercise([
    + let $V$ be finite-dimensional complex inner product space, let $T in L(V, V)$ be normal, then
        + $T$ is self-adjoint iff every characteristic value are in $bb(R)$
        + $T$ is positive iff every characteristic value are positive
        + $T$ is unitary iff every characteristic value $|c| = 1$
    + let $V$ be finite-dimensional inner product space, let $T in L(V, V)$ be both positive and unitary, then $T = I$
    + $T$ is normal iff $T = T_1 + i T_2$ where $T_1, T_2$ are self-adjoint operators which commutes
    + let $A in bb(R)^(n times n)$ be symmetric, then $exists B in bb(R)^(n times n) in.rev B^3 = A$
    + let $A in bb(C)^(n times n)$ be positive, then $exists B in bb(R)^(n times n) in.rev B^2 = A$
    + normal and nilpotent operator is $0$
    + if $T$ is normal operator, then characteristic vectors of $T$ associated with distinct characteristic values are orthogonal
    + let $V$ be finite-dimensional complex inner product space, let $T in L(V, V)$, then $exists f in bb(C)[x]$ such that $T^* = f(T)$
    + if $T, U$ be normal commutes, then $T U$ is normal
]) <normal_operators_exercise>

#pagebreak()

= Operators on Inner Product Spaces

== Forms on Inner Product Spaces

#definition(title: "sesqui-linear form", [
    a *sesqui-linear form* on real or complex vector space $V$ is function $f : V times V -> bb(F)$ such that
    + $f(c alpha + beta, gamma) = c f(alpha, gamma) + f(beta, gamma)$
    + $f(alpha, c beta + gamma) = overline(c) f(alpha, beta) + f(alpha, gamma)$
    $forall alpha, beta, gamma in V$ and $forall c in bb(F)$
]) <sesqui_linear_form_definition>

#theorem([
    let $V$ be finite-dimensional inner product space, let $f$ be a sesqui-linear form on $V$, then $exists T in L(V, V)$ such that $f(alpha, beta) = (T alpha | beta) s0 forall alpha, beta in V$ where $f -> T$ is an isomorphism of space of forms onto $L(V, V)$
]) <exists_linear_operator_sesqui_linear_form_theorem>

#corollary([
    $inpd(f, g) = tr (T_f T_g^*)$ defines an inner product on space of sesqui-linear forms such that 
    $
        inpd(f, g) = sum_(j, k) f(alpha_k, alpha_j) overline(g(alpha_k, alpha_j))
    $
]) <inner_product_space_sesqui_linear_form_corollary>

#definition(title: "matrix of sesqui-linear form in ordered basis", [
    let $f$ be sesqui-linear form and $cal(B) = {alpha_1, dots, alpha_n}$ be arbitrary ordered basis of $V$, let $A in M_(n times n)(bb(F))$ where $A_(j k) = f(alpha_k, alpha_j)$, then it is called *matrix of $f$ in the ordered basis $cal(B)$*
]) <matrix_of_sesqui_linear_form_in_ordered_basis_definition>

#theorem([
    let $f$ be sesqui-linear form on finite-dimensional complex inner product space $V$, then $exists cal(B)$ be orthonormal basis of $V$ such that matrix of $f$ is upper-triangular
]) <upper_triangular_orthonormal_basis_sesqui_linear_form_theorem>

#definition(title: "Hermitian sesqui-linear form", [
    let $f$ be sesqui-linear form on real or complex vector space $V$, it is *Hermitian* if \
    $f(alpha, beta) = overline(f(beta, alpha)) s0 forall alpha, beta in V$
]) <hermitian_sesqui_linear_form_definition>

#theorem([
    let $V$ be complex vector space, let $f$ be sesqui-linear form on $V$, if $f(alpha, alpha) in bb(R) s0 forall alpha$ then $f$ is Hermitian
]) <sesqui_linear_same_entry_real_hermitian_theorem>

#corollary([
    let $V$ be complex finite-dimensional inner product space, let $T in L(V, V)$  \
    then $T$ is self-adjoint iff $inpd(T alpha, alpha) in bb(R) s0 forall alpha in V$
]) <self_adjoint_sesqui_linear_form_corollary>

#theorem(title: "Principal Axis Theorem", [
    let $V$ be finite-dimensional inner product space, $forall f$ be Hermitian sesqui-linear form, $exists cal(B)$ be orthonormal ordered basis of $V$ such that matrix of $f$ in $cal(B)$ be $A = diag(c_1, dots, c_n) s0 forall c_1, dots, c_n in bb(R)$
]) <principal_axis_theorem>

#corollary([
    by #theref(<principal_axis_theorem>), let $x, y in V$ then
    $
        f(sum_j x_j alpha_j, sum_k y_k alpha_k) = sum_j c_j x_j overline(y_j)
    $
]) <principal_axis_theorem_corollary>

#exercise([
    + let $V$ be inner product space, let $f$ be sesqui-linear form, let $T_f in L(V, V) in.rev f(alpha, beta) = inpd(T alpha, beta)$, then $f$ is *non-degenerate* iff $T_f$ is non-singular
    + let $V$ be finite-dimensional vector space, let $f$ be sesqui-linear form, then $forall S in L(V, V) s0 exists S'$ such that $f(S alpha, beta) = f(alpha, S' beta) h0 forall alpha, beta in V$
]) <forms_inner_product_spaces_exercise>

== Positive Forms

#definition(title: "non-negative/positive sesqui-linear form", [
    let $f$ be a sesqui-linear form on vector space $V$ over field $bb(C)$ or $bb(R)$, $f$ is *non-negative* or if $f$ is Hermitian and $f(alpha, alpha) >= 0 s0 forall alpha in V$, $f$ is *positive* if $f$ is Hermitian and $f(alpha, alpha) > 0 s0 forall alpha != 0$
]) <non_negative_positive_sesqui_linear_form_definition>

#theorem([
    let $bb(F)$ be field of $bb(R)$ or $bb(C)$, let $A in bb(F)^(n times n)$, let $g$ be function such that $g(X, Y) = Y^* A X$ is a positive sesqui-linear form on space $bb(F)^(n times 1)$ iff $exists P in bb(F)^(n times n)$ be invertible such that $A = P^* P$
]) <positive_sesqui_linear_form_invertible_adjoint_product_theorem>

#definition(title: "principal minors", [
    let $A in bb(F)^(n times n)$, the *principal minors* of $A$ is $Delta_k (A)$ defined as
    $
        Delta_k (A) = det mat(
            A_(1 1), dots, A_(1, k);
            dots.v, dots.down, dots.v;
            A_(k 1), dots, A_(k k)
        ), h0 1<= k <= n
    $
]) <principal_minors_definition>

#lemma([
    let $A in bb(F)^(n times n)$ then the followins are equivalent
    + $exists P$ be upper-triangular and $P_(k k) = 1 s0 (1 <= k <= n)$ such that $B = A P$ is lower-triangular
    + $Delta_k (A) != 0 h0 1 <= k <= n$
]) <upper_lower_triangular_principal_minors_equivalent_lemma>

#theorem([
    let $f$ be sesqui-linear form on finite-dimensional vector space $V$, let $A$ be matrix of $f$ in ordered basis $cal(B)$, then $f$ is positive sesqui-linear form iff $A = A^* and Delta_k (A) > 0 s0 (1 <= k <= n)$
]) <positive_sesqui_linear_form_self_adjoint_principal_minors_theorem>

#definition(title: "non-negative/positive linear operator", [
    let $V$ be finite-dimensional inner product space, let $T in L(V, V)$, then \
    $T$ is *non-negative linear operator* if $T = T^* and inpd(T alpha, alpha) >= 0 s0 forall alpha in V$ \
    $T$ is *positive linear operator* if $T = T^* and inpd(T alpha, alpha) > 0 s0 forall alpha != 0$
]) <non_negative_positive_linear_operator_definition>

#theorem([
    let $A in bb(C)^(n times n)$ then the followings are equivalent
    + $A$ is *positive*, such that $sum_j sum_k A_(k j) x_j overline(x_k) > 0 h0 forall x_1, dots, x_n in bb(C)$ not all $0$
    + $inpd(X, Y) = Y^* A X$ is an inner product on $bb(C)^(n times 1)$
    + for standard inner product $inpd(X, Y) = Y^* X$ on $bb(C)^(n times 1)$, $T in L(V, V) s0 T : X -> A X$ is positive
    + $exists P in bb(C)^(n times n)$ be invertible such that $A = P^* P$
    + $A = A^* and Delta_k (A) > 0 h0 (1 <= k <= n)$

    let $A in bb(R)^(n times n)$ then the followings are equivalent
    + $A = A^t$ and $sum_j sum_k A_(k j) x_j x_k > 0 h0 forall x_1, dots, x_n in bb(R)$ not all $0$
    + $inpd(X, Y) = Y^t A X$ be inner product on $bb(R)^(n times 1)$
    + for standard inner product $inpd(X, Y) = Y^t X$ on $bb(R)^(n times 1)$, $T in L(V, V) s0 T : X -> A X$ is positive
    + $exists P in bb(R)^(n times n)$ be invertible such that $A = P^t P$
]) <positive_matrix_equivalent_theorem>

#exercise([
    + let $bb(F)$ be a field, let $A in bb(F)^(n times n)$ be positive, then $A_(i i) > 0 h0 i = 1, dots, n$
    + let $V$ be finite-dimensional inner product space, let $T, U in L(V, V)$, then denote $T < U$ if $U - T$ is positive, then
        + $T < U and U < T equiv F_0$
        + $T < U and U < S -> T < S$
        + $T < U and 0 < S arrow.not S T < S U$
    + let $V$ be finite-dimensional inner product space, let $W subset V$ be subspace, let $E in L(V, W)$ be orthogonal projection, then $forall c > 0 s0 c I + E$ is positive
    + let $A in bb(C)^(n times n)$ be self-adjoint, then $exists c in bb(R) in.rev c I + A$ is positive
    + let $V$ be finite-dimensional inner product space, let $T, U in L(V, V)$ be positive, then
        + $T U$ is positive iff $U T = T U$
        + $(T + U)$ is positive
        + characteristic value of $S T$ is positive
]) <positive_forms_exercise>

== More on Forms

#theorem([
    let $V$ be complex vector space, let $f$ be sesqui-linear form on $V$, let $cal(B) = {alpha_1, dots, alpha_r}$ be basis of finite-dimensional subspace $W subset V$, let $M in bb(C)^(r times r) suchthat M_(j k) = f(alpha_k, alpha_j)$ and \
    $W' = {beta in V | f(alpha, beta) = 0}$, then $W' subset V$ is a subspace and $W inter W' = {0}$ iff $exists M^(-1)$, if so, then \
    $V = W plus.o W'$
]) <sesqui_linear_orthogonal_subspace_direct_sum_theorem>

#definition(title: "projection in sesqui-linear form", [
    let $E in L(V, W)$, let $alpha in W$ and $alpha' in W'$, define *projection of $V$ on $W$* determined by \
    $V = W plus.o W'$ such that $E alpha = alpha$ and $E alpha' = 0$

    $E$ is orthogonal projection iff $W' = W^bot$
]) <projection_sesqui_linear_definition>

#theorem([
    let $V$ be complex vector space, let $f$ be sesqui-linear form on $V$, let $A in bb(C)^(n times n)$ in ordered basis \
    $cal(B) = {alpha_1, dots, alpha_n}$ of $V$, if $Delta_k (A) != 0$ for $1 <= k <= n$ then $existsunique P$ be upper-triangular such that
    + $P_(k k) = 1 h0 1 <= k <= n$
    + $P^* A P$ is upper-triangular
]) <upper_triangular_principal_minor_upper_triangular_sim_theorem>

== Spectral Theory

#theorem(title: "Spectral Theorem", [
    let $V$ be finite-dimensional complex inner product space, let $T$ be normal operator on $V$ \
    or let $V$ be finite-dimensional real inner product space, let $T$ be self-adjoint operator on $V$

    let $c_1, dots, c_k$ be distinct characteristic values of $T$, let $W_j$ be characteristic space associated with $c_j$, let $E_j in L(V, W_j)$ be orthogonal projection, then
    + $W_j bot W_i$ when $i != j$
    + $V = W_1 plus.o dots plus.o W_k$
    + $T = c_1 E_1 + dots + c_k E_k$
]) <spectral_theorem>

#definition(title: "spectral resolution", [
    by #theref(<spectral_theorem>), the *spectral resolution* of $T$ is $T = c_1 E_1 + dots + c_k E_k$ \
    the *spectrum* of $T$ is $c_1, dots, c_k$ \
    the family of projections ${E_1, dots, E_k}$ is *resolution of the identity defined by $T$* where \
    $I = E_1 + dots + E_k$
]) <spectral_resolution_definition>

#corollary([
    if $e_j = product_(i != j) ((x - c_i) / (c_j - c_i))$ then $E_j = e_j (T) h0 1 <= j <= k$
]) <spectral_projection_polynomial_corollary>

#definition(title: "function on diagonalizable normal operator", [
    let $T$ be diagonalizable normal operator on finite-dimensional inner product space $V$ over field $bb(F)$ and \
    $T = sum_(j = 1)^k c_j E_j$ is the spectral resolution, let $f$ be a function such that domain of $f$ includes spectrum of $T$ with values in $bb(F)$, then $f(T) in L(V, V)$ is defined by
    $
        f(T) = sum_(j = 1)^k f(c_j) E_j
    $
]) <function_diagonalizable_normal_operator_definition>

#theorem([
    let $V$ be finite-dimensional inner product space $V$ over field $bb(F)$, let $T in L(V, V)$ be diagonalizable normal operator with spectrum $S$, let $f$ be function having domain contains $S$ with values in $bb(F)$, then $f(T)$ is diagonalizable normal operaotr with spectrum $f(S)$

    let $U : V -> V'$ be unitary, and $T' = U T U^*$ then $S$ is spectrum of $T'$ and $f(T') = U f(T) U^*$
]) <dig_normal_function_eq_spectrum_unitary_transform_theorem>

#corollary([
    following #theref(<dig_normal_function_eq_spectrum_unitary_transform_theorem>), let $cal(B) = {alpha_1, dots, alpha_n}$ be ordered basis of $V$ such that \
    $D = [T]_cal(B) = diag(d_1, dots, d_n)$, then $[f(T)]_cal(B) = f(D) = diag(f(d_1), dots, f(d_n))$, if $cal(B)' = {alpha'_1, dots, alpha'_n}$ be other ordered basis of $V$, let $P in bb(C)^(n times n) suchthat alpha'_j = sum_i P_(i j) alpha_i$ then $[f(T)]_cal(B)' = P^(-1) f(D) P$
]) <diagonal_normal_function_matrix_corollary>

#definition(title: "function on matrix", [
    by #corref(<diagonal_normal_function_matrix_corollary>), let $A = P^(-1) D P$ then define $f(A) = P^(-1) f(D) P$
]) <function_on_matrix_definition>

#theorem([
    let $A in bb(C)^(n times n)$ be normal and $c_1, dots, c_k$ be distinct complex roots of $det(x I - A)$, let
    $
        e_i = product_(j != i) ((x - c_j) / (c_i - c_j)) h0 1 <= i <= k
    $
    and $E_i = e_i (A)$, then $E_i E_j = 0$ for $i != j$ and $E_i^2 = E_i, s0 E_i^* = E_i, s0 I = E_1 + dots + E_k$

    let $f$ be complex valued function with domain includes $c_1, dots, c_k$ then
    $
        f(A) = f(c_1) E_1 + dots + f(c_k) E_k \
        A = c_1 E_1 + dots + c_k E_k
    $
]) <normal_matrix_projection_property_theorem>

#theorem([
    let $T$ be diagonalizable normal operator on finite-dimensional inner product space $V$ then
    + $T$ is self-adjoint iff each characteristic value of $T$ is real
    + $T$ is non-negative iff each characteristic value of $T$ is non-negative
    + $T$ is unitary iff each characteristic value of $T$ has absolute value $1$
]) <diagonalizable_normal_characteristic_self_ad_nonn_unitary_theorem>

#theorem([
    let $V$ be finite-dimensional inner product space, let $T in L(V, V)$ be non-negative, then \
    $existsunique N in L(V, V)$ be non-negative such that $N^2 = T$
]) <non_negative_operator_unique_sqrt_theorem>

#theorem([
    let $V$ be finite-dimensional inner product space, let $T in L(V, V)$, then $exists U in L(V, V)$ be unitary and $existsunique N in L(V, V)$ be non-negative such that $T = U N$, if $exists T^(-1)$ then $U$ is unique
]) <polar_decomposition_linear_operator_theorem>

#definition(title: "root of family of operators", [
    let $cal(F)$ be family of operators on inner product space $V$ over field $bb(F)$, let $r : cal(F) -> bb(F)$ with values in $bb(F)$, then $r$ is *root of $cal(F)$* if $exists alpha in V, alpha!= 0 suchthat T alpha = r(T) alpha h0 forall T in cal(F)$

    for $r : cal(F) -> bb(F)$, then define $V(r) = {alpha in V | T alpha = r(T) alpha h0 forall T in cal(F)}$
]) <root_of_family_of_operators_definition>

#theorem([
    let $cal(F)$ be commutating family of diagonalizable normal operators on finite-dimensional inner product space $V$ over field $bb(F)$, then $cal(F)$ on ly have finite numbers of roots, let $r_1, dots, r_k$ be distinct roots of $cal(F)$
    + $V(r_i) bot V(r_j) h0 i != j$
    + $V = V(r_1) plus.o dots plus.o V(r_k)$
]) <commutative_diagonalizable_normal_family_root_characteristic_vector_set_orthogonal_theorem>

#corollary([
    by #theref(<commutative_diagonalizable_normal_family_root_characteristic_vector_set_orthogonal_theorem>), let $P_j in L(V, V(r_k))$ be orthogonal projection for $1 <= j <= k$ then
    + $P_i P_j = 0$ when $i != j$
    + $I = P_1 + dots + P_k$
    + $forall T in cal(F)$ is as form $T = sum_j r_j (T) P_j$
]) <orthogonal_projection_family_com_diag_nor_root_corollary>

#definition(title: "resolution of identity of family", [
    the family of orthogonal projections ${P_1, dots, P_k}$ is *resolution of the identity determined by $cal(F)$*

    *spectral resolution of $T$ in terms of $cal(F)$* is $T = sum_j r_j (T) P_j$
]) <resolution_of_identity_of_family_definition>

#definition(title: "self-adjoint algebra of operators", [
    *self-adjoint algebra of operators* on inner product space $V$ is linear subalgebra $cal(A) subset L(V, V)$ such that if $T in cal(A)$ then $T^* in cal(A)$
]) <self_adjoint_algebra_of_operators_definition>

#definition(title: "self-adjoint algebra generated by family", [
    let $V$ be finite-dimensional inner product space, let $cal(F)$ be family of linear operators on $V$, *self-adjoint algebras generated by $cal(F)$* is the smallest self-adjoint algebra contains $cal(F)$
]) <self_adjoint_algebra_generated_family_definition>

#theorem([
    let $V$ be finite-dimensional inner product space, let $cal(F)$ be commuting family of diagonalizable normal operators on $V$ over field $bb(F)$, let $cal(A)$ be self-adjoint algebra generated by $cal(F) union {I}$, let ${P_1, dots, P_k}$ be resolution of identity defined by $cal(F)$, then $cal(A) = {T in L(V, V) | T = sum_(j = 1)^k c_j P_j}$, let $c_1, dots, c_k in bb(F)$
]) <self_adjoint_family_generated_algebra_theorem>

#corollary([
    by #theref(<self_adjoint_family_generated_algebra_theorem>), $exists T in cal(A) suchthat (forall T' in cal(A) s0 exists p in bb(F)[x] ) in.rev T' = p(T)$
]) <self_adjoint_family_genertated_algebra_polynomail_corollary>

#exercise([
    let $bb(F)$ be a field of $bb(R)$ or $bb(C)$
    + let $A in bb(F)^(n times n)$ be non-negative, then $exists B in bb(F)^(n times n)$ be non-negative such that $B^2 = A$
    + let $A in bb(C)^2 in.rev A^* = -A$, let $B = e^A$, then
        + $det B = e^(tr A)$
        + $B^* = e^(-A)$
        + $B$ is unitary
    + let $V$ be finite-dimensional inner product space, let $T, U in L(V, V)$ be normal and commutes, then $(T + U)$ and $U T$ are normal
    + let $V$ be finite-dimensional complex inner product space, let $T in L(V, V)$, then the followings are equivalent
        + $T$ is normal
        + $||T alpha|| = ||T^* alpha|| h0 forall alpha in V$
        + $T = T_1 + i T_2 h0 T_1, T_2 in L(V, V)$ be self-adjoint and $T_1 T_2 = T_2 T_1$
        + $alpha in V s0 c in bb(F) s0 T alpha = c alpha -> T^* alpha = overline(c) alpha$
        + there is orthonormal basis of $V$ consisting of characteristic vectors of $T$
        + there is orthonormal basis $cal(B)$ of $V$ such that $[T]_cal(B)$ is diagonal
        + three is $g in bb(C)[x]$ such that $T^* = g(T)$
        + $forall W subset V$ be subspace invariant under $T$ is invariant under $T^*$
        + $existsunique N, U in L(V, V)$ such that $N$ is non-negative, $U$ is unitary, and $T = N U$
        + $T = c_1 E_1 + dots + c_k E_k$ where $I = E_1 + dots + E_k, s0 E_i E_j = 0$ for $i != j$, and $E_j^2 = E_j = E^*_j$
    + any commuting family of normal operators on finite-dimensional inner product space generates a commutative self-adjoint algebra of normal operators
    + let $V$ be finite-dimensional complex inner product space, let $U in L(V, V)$ be unitary such that $U alpha = alpha -> alpha = 0$, let $f(z) = i (1 + z)/(1 - z)$ for $z != 1$, then
        + $f(U) = i(I + U) (I - U)^(-1)$
        + $f(U)$ is self-adjoint
        + $forall T in L(V, V) s0 U = (T - i I) (T + i I)^(-1)$ is unitary and $T = f(U)$
    + let $V = bb(C)^(n times n)$ be vector space with inner product $inpd(A, B) = tr(A B^*)$, then let $A, B in V$, then let each family below varies $B$ over all diagonal matrices are commutative self-adjoint algebra
        + $L_B (A) = B A$
        + $R_B (A) = A B$ in this case $L_B$ is unitarily equivalent to $R_B'$
        + $T_B (A) = B A - A B$
    + let $V = bb(C)^(n times n)$ be vector space with inner product $inpd(A, B) = tr(A B^*)$, let $G$ be the group of unitary matrices $V$, let $B, B_1, B_2 in G$, let $C_B in L(V, V)$ as $C_B (A) = B A B^(-1)$, then
        + $C_B$ is unitary
        + $C_(B_1 B_2) = C_B_1 C_B_2$
        + $exists.not U in L(V, V)$ be unitary such that $U L_B U^(-1) = C_B h0 forall B in G$
    + let $V$ be finite-dimensional inner product space, let $cal(F)$ be family of linear operators on $V$ over field $bb(F)$, let $cal(A)$ be self-adjoint algebra generated by $cal(F)$, then
        + each root of $cal(A)$ defines a root of $cal(F)$
        + each root $r$ of $cal(A)$ is multiplicative function on $cal(A)$, let $T, U in cal(A)$, let $c in bb(F)$, then
            - $r(T U) = r(T) r(U)$
            - $r(c T + U) = c r(T) + r(U)$
    + let $V$ be finite-dimensional inner product space, let $cal(F)$ be commuting family of diagonalizable normal operators on $V$, let $cal(A)$ be self-adjoint algebra generated by $cal(F) union {I}$, then each root $s$ of $cal(A)$ is different from $0$ and for each root $r$ of $cal(F)$ exists root $s$ of $cal(A)$ such that $s(T) = r(T) h0 forall T in cal(F)$
    + let $V$ be finite-dimensional inner product space, let $cal(F)$ be commuting family of diagonalizable normal operators on $V$ over field $bb(F)$, let $cal(A)_0$ be self-adjoint algebra generated by $cal(F)$, let $cal(A)$ be self-adjoint algebra generated by $cal(F) union {I}$, then
        + $cal(A) = {c I + T | c in bb(F) s0 T in cal(A)_0}$
        + exists at most $1$ root $r$ of $cal(A)$ such that $r(T) = 0 h0 forall T in cal(A)_0$
        + if exists root of $cal(A)$ be $0$ in $cal(A)_0$, then let $P_1, dots, P_k$ be resolution of identity defined by $cal(F)$, then it may be index as the way $cal(A)_0$ represented as $
            T = sum_(j = 2)^k c_j P_j
        $
        + $cal(A) = cal(A)_0 <=> $ each root $r$ of $cal(A)$ exists $T in cal(A)_0 in.rev r(T) != 0$
]) <spectral_theory_exercise>

== Further Properties on Normal Operators

#lemma([
    let $W$ be an inner product space, let $N in L(W, W)$ be normal, then $null N = (range N)^bot$
]) <normal_operator_null_range_orthogonal_complement_lemma>

#lemma([
    let $W$ be inner product space, let $N in L(W, W)$ be normal, let $alpha in W$, if $N^2 alpha = 0$ then $N alpha = 0$
]) <normal_operator_null_square_lemma>

#lemma([
    let $W$ be inner product space over field $bb(F)$, let $T in L(W, W)$ be normal, let $f in bb(F)[x]$ then $f(T)$ is also normal
]) <normal_polynomail_normal_lemma>

#lemma([
    let $W$ be inner product space over field $bb(F)$, let $T in L(W, W)$ be normal, let $f, g in bb(F)[x]$ such that $gcd(f, g) = 1$, let $alpha, beta in W$ such that $f(T) alpha = 0$ and $g(T) beta = 0$ then $inpd(alpha, beta) = 0$
]) <relatively_prime_polynomial_null_orthogonal_lemma>

#theorem([
    let $V$ be finite-dimensional inner product space over field $bb(F)$, let $T in L(V, V)$ be normal, \
    let $p = p_1 dots p_k$ be minimal polynomial of $T$ each $p_j$ be prime and $deg p_j = 1, 2$ with multiplicity $1$, let $W_j$ be $null p_j (T)$ then
    + $W_j bot W_k h0 j != k$
    + $V = W_1 plus.o dots plus.o W_k$
    + $W_j$ is invariant under $T$ and $p_j$ is minimal polynomail of $T|_W_j$
    + $forall j s0 exists e_j in bb(F)[x] suchthat e_j (T) in L(V, W_j)$ be orthogonal projection
]) <normal_invariant_decomposition_minimal_poly_theorem>

#definition(title: "primary components of inner product space under linear operator", [
    by #theref(<normal_invariant_decomposition_minimal_poly_theorem>), each $W_j$ are *primanry components of $V$ under $T$*
]) <primary_components_linear_product_space_linear_operator_definition>

#corollary([
    let $V$ be finite-dimensional inner product space, let $T in L(V, V)$ be normal, let $W_1, dots, W_k$ be primary components of $V$ under $T$, let $W subset V$ be subspace, then
    $
        W = sum_(j = 1)^k (W inter W_j)
    $
]) <sum_of_inter_primary_components_subspace_corollary>

#lemma([
    let $V$ be inner product space over field $bb(R)$, let $S in L(V, V)$ be normal such that $S^2 + I = 0$, \
    let $alpha, beta in V$ such that $S alpha = beta$ then
    + $S^* alpha = -beta$
    + $S^* beta = alpha$
    + $inpd(alpha, beta) = 0$
    + $||alpha|| = ||beta||$
]) <normal_operator_square_eq_minus1_property_lemma>

#theorem([
    let $V$ be finite-dimensional inner product space over field $bb(R)$, let $T in L(V, V)$ be normal, let minimal polynomial of $T$ be $p = (x - a)^2 + b^2, s0 a, b in bb(R) s0 b != 0$ then $exists s in bb(N) in.rev p^s$ is characteristic polynomial of $T$, then $exists s0 V_1, dots, V_s subset V$ be subspaces such that
    + $V_j bot V_k h0 j != k$
    + $V = V_1 plus.o dots plus.o V_s$
    + $exists cal(B)_j = {alpha_j, beta_j}$ be orthonormal basis of $V_j$ such that
    $
        & T alpha_j = a alpha_j + b beta_j \
        & T beta_j = -b alpha_j + a beta_j
    $
]) <real_inner_product_space_primary_components_decomposition_theorem>

#corollary([
    by condition from #theref(<real_inner_product_space_primary_components_decomposition_theorem>), $T$ is invertible and $T^* = (a^2 + b^2) T^(-1)$
]) <invertible_normal_operator_adjoint_corollary>

#theorem([
    let $V$ be finite-dimensional inner product space, let $T in L(V, V)$ be normal, let $U in L(V, V)$ such that $T U = U T$ then $T^* U = U T^*$ and every subspace invariant under $T$ is invariant under $T^*$
]) <commute_normal_operator_adjoint_invariant_theorem>

#theorem([
    let $V$ be finite-dimensional inner product space over field $bb(F)$, let $T in L(V, V)$ be normal, \
    $exists alpha_1, dots, alpha_r in V$ be non-zero and $T$-annihilators $e_1, dots, e_r in bb(F)[x]$ such that
    + $V = Z(alpha_1, T) plus.o dots plus.o Z(alpha_r, T)$
    + $e_(k + 1) | e_k h0 1 <= k <= r - 1$
    + $Z(alpha_j, T) bot Z(alpha_k, T)$
]) <primary_decomposition_normal_operation_theorem>

#corollary([
    let $A in bb(R)^(n times n)$ be normal, then $exists P in O(n) in.rev P^(-1) A P$ is rational canonical form

    let $A in bb(C)^(n times n)$ be normal, then $exists P in U(n) in.rev P^(-1) A P$ is rational canonical form
]) <unitarily_orthogonally_equiv_rational_canonical_form_corollary>

#definition(title: "unitary transformation", [
    let $V, V'$ be inner product space over $bb(F)$, let $U in L(V, V')$ is *unitary transformation* if $U$ is an isomorphism

    if $T in L(V, V)$ and $T' in L(V', V')$ then $T, T'$ are *unitarily equivalent* if $exists U in L(V, V')$ be unitary such that $U T U^-1 = T'$
]) <unitary_transformation_definition>

#lemma([
    let $V, V'$ be finite-dimensional inner product space over field $bb(F)$, let $T in L(V, V)$ and $T' in L(V', V')$ then $T$ is unitarily equivalent to $T'$ iff $exists cal(B)$ be orthonormal basis of $V$, $exists cal(B)'$ be orthonormal basis of $V'$ such that $[T]_cal(B) = [T']_cal(B)'$
]) <unitary_equivalent_orthonoraml_basis_eq_lemma>

#theorem([
    let $V, V'$ be finite-dimensional inner product space over field $bb(F)$, let $T in L(V, V)$ be normal, \
    let $T' in L(V', V')$ be normal, then $T$ is unitarily equivalent to $T'$ iff $T$ and $T'$ have same characteristic polynomial
]) <same_characteristic_polynomail_unitarily_equivalent_theorem>

== Singular Value Decomposition and Pseudoinverse

#theorem([
    let $bb(F)$ be a field, let $M in bb(F)^(n times m)$, then $range M = (null M^*)^bot$ and $range M^* = (null M)^bot$
]) <matrix_range_null_adjoint_orthogonality_theorem>

#theorem(title: "singular value decomposition", [
    let $V, W$ be finite-dimensional inner product space of $dim V = n, s0 dim W = m$, let $T in L(V, W)$ such that $rank T = r$, then $exists cal(B) = {alpha_1, dots, alpha_n}, s0 exists cal(B)' = {beta_1, dots, beta_m}$ each be orthonormal basis of $V, W$, then $exists sigma_1 >= dots >= sigma_r$ such that
    $
        T(alpha_j) = cases(
            sigma_j beta_j h0 & 1 <= j <= r,
            0 & r < j <= n
        )
    $
    then $sigma^2_j$ is the characteristic vectors of $T^* T$
]) <singular_value_decomposition_definition>

#definition(title: "singular value", [
    from #theref(<singular_value_decomposition_definition>), the values $sigma_1, dots, sigma_r, dots, sigma_n$ are the *singular value* where $sigma_j = 0$ when $j > r$, define the singular values of matrix $T$ in any basis be the same as singular values of $T$
]) <singular_value_definition>

#theorem(title: "singular value decomposition for matrix", [
    let $A in bb(C)^(n times m)$ such that $rank A = r$ with singular values $sigma_1 >= dots >= sigma_r > 0$, then define $Sigma in bb(R)^(n times m)$ as
    $
        Sigma_(j k) = cases(
            sigma_j h0 & j = k <= r,
            0 & "otherwise"
        )
    $
    then $exists U in bb(C)^(n times n), exists V in bb(C)^(m times m)$ be column matrix of basis $cal(B), cal(B)'$ of #theref(<singular_value_decomposition_definition>) such that
    $
        A = U Sigma V^*
    $
]) <singular_value_decompostion_matrix_theorem>

#theorem(title: "polar decomposition", [
    let $A in bb(C)^(n times n)$, then $existsunique U in bb(C)^(n times n)$ be unitary and $existsunique P in bb(C)^(n times n)$ be positive semi-definite such that
    $
        A = U P
    $
]) <matrix_polar_decomposition_theorem>

#definition(title: "pseudoinverse", [
    let $V, W$ be finite-dimensional inner product space over field $bb(F)$, let $T in L(V, W)$, let $L = T|_(coim T)$, then *pseudoinverse* of $T$ denoted as $T^dagger$ is
    $
        T^dagger (alpha) = cases(
            L^(-1) (alpha) h0 & alpha in coim T,
            0 & alpha in null T
        )
    $
]) <pseudoinverse_definition>

#theorem([
    let $V, W$ be finite-dimensional inner product space over field $bb(F)$, let $T in L(V, W)$, \
    let $cal(B) = {alpha_1, dots, alpha_n}$ be orthonormal basis of $V$, let $cal(B)' = {beta_1, dots, beta_m}$ be orthonormal basis of $W$, let $sigma_1 >= dots >= sigma_r > 0$ be singular values of $T$, then 
    $
        T^dagger (beta_j) = cases(
            1/sigma_j alpha_j h0 & 1 <= j <= r,
            0 & r < j
        )
    $
]) <pseudoinverse_singular_value_theorem>

#corollary([
    let $A in bb(C)^(n times m)$ which $rank A = r$ with singular values $sigma_1 >= dots >= sigma_r > 0$ by singular value depomposition $A = U Sigma V^*$, then pseudoinverse of $A$ is $A^dagger = V Sigma^dagger U^*$ such that
    $
        Sigma^dagger_(j k) = cases(
            1 / sigma_j delta_(j k) h0 & 1 <= j <= r,
            0 & r < j
        )
    $
]) <pseudoinverse_matrix_corollary>

#lemma([
    let $V, W$ be finite-dimensional inner product space over field $bb(F)$, let $T in L(V, W)$, then 
    + $T^dagger T in L(V, coim T)$ be orthogonal projection
    + $T T^dagger in L(W, range T)$ be orthogonal projection
]) <pseudoinverse_self_orthogonal_projection_lemma>

#theorem([
    let $V, W$ be finite-dimensional inner product space over field $bb(F)$, let $T in L(V, W)$, let $alpha in V, beta in W$ such that $alpha = T^dagger beta$ then
    + if $exists T^(-1)$ then if $exists alpha' in V in.rev T alpha' = beta => ||alpha|| <= ||alpha'||$ with equal iff $alpha = alpha'$
    + if $exists.not T^(-1)$ then $||T alpha - beta|| <= ||T alpha' - beta|| s0 forall alpha' in V$ with equal iff $alpha = alpha'$
]) <pseudoinverse_self_best_approximation_theorem>

#definition(title: "matrix norms", [
    let $bb(F)$ be a field, let $A in bb(F)^(n times m)$, then the *operation norm* of $A$ is
    $
        ||A||_"op" = sup_(||x|| = 1) ||A x||
    $
    is the largest singular value, and the *Frobenius norm* is 
    $
        ||A||_F = sqrt(sum_(j = 1)^m sum_(k = 1)^n |A_(j k)|^2) = sqrt(tr(A^* A))
    $
]) <matrix_norms_definition>

#definition(title: "Schmidt decomposition", [
    let $bb(F)$ be a field, let $A in bb(F)^(n times m)$, let singular value decomposition of $A$ be $A = U Sigma V^*$ where \ $rank A = r$, let $U$ be composed of column vectors $alpha_1, dots, alpha_n$, let $V^*$ be composed of column vectors $beta_1, dots, beta_m$, then the *Schmidt decomposition* of $A$ is
    $
        A = sum_(k = 1)^r sigma_k alpha_k beta_k 
    $
]) <schmidt_decompostition_definition>

#theorem([
    let $A in bb(C)^(n times m) in.rev null A = {0}$, then the projection $P_(range A) in bb(C)^(n times n)$ is given as
    $
        P_(range A) = A (A^* A)^(-1) A^*
    $
]) <range_projection_full_column_rank_matrix_calculation_theorem>

#pagebreak()

= Bilinear Forms

== Bilinear Forms

#definition(title: "bilinear form", [
    let $V$ be vector space over field $bb(F)$, then *bilinear form* $f$ is defined as $f : V times V -> bb(F)$ in bilinear form space $L(V, V, bb(F))$ such that
    + $f(alpha + c beta, gamma) = f(alpha, gamma) + c f(beta, gamma)$
    + $f(alpha, beta + c gamma) = f(alpha, beta) + c f(alpha, gamma)$
    $alpha, beta, gamma in V, s0 c in bb(F)$
]) <bilinear_form_definition>

#definition(title: "matrix of bilinear form", [
    let $V$ be finite-dimensional vector space over field $bb(F)$, let $cal(B) = {alpha_1, dots, alpha_n}$ be ordered basis of $V$, let $f in L(V, V, bb(F))$, then *matrix of $f$ in ordered basis $cal(B)$* is $A in bb(F)^(n times n)$ such that $A_(i j) = f(alpha_i, alpha_j)$ denoted as $[f]_cal(B)$
]) <matrix_bilinear_form_definition>

#theorem([
    let $V$ be finite-dimensional vector space over field $bb(F)$, $forall cal(B)$ be basis of $V$ such that \
    $Phi_cal(B) : L(V, V, bb(F)) -> bb(F)^(n times n)$ is an isomorphism
]) <bilinear_matrix_isomorphism_theorem>

#corollary([
    let $V$ be finite-dimensional vector space over field $bb(F)$, let $cal(B) = {alpha_1, dots, alpha_n}$ be ordered basis of $V$, let $cal(B)^* = {L_1, dots, L_n}$ be ordered basis of $V^*$, then $f_(i j) (alpha, beta) = L_i (alpha) L_j (beta) s0 alpha, beta in V$ is a basis of $L(V, V, bb(F))$ such that $dim L(V, V, bb(F)) = n^2$
]) <bilinear_form_space_dimension_corollary>

#theorem([
    let $V$ be finite-dimensional vector space over field $bb(F)$, let $f in L(V, V, bb(F))$, let $L_f, R_f in L(V, V^*)$ such that $(L_f alpha) (beta) = f(alpha, beta) = (R_f beta) alpha$ then $rank L_f = rank R_f$
]) <bilinear_form_left_right_rank_equiv_theorem>

#definition(title: "rank of bilinear form", [
    let $V$ be a finite-dimensional vector space over field $bb(F)$, let $f in L(V, V, bb(F))$ then the *rank* of $f$ is defined as $rank f = rank L_f = rank R_f$
]) <bilinear_form_rank_definition>

#corollary([
    rank of bilinear form is equal to rank of matrix of the form in any ordered basis
]) <bilinear_rank_ordered_basis_corollary>

#corollary([
    let $V$ be $n$-dimensional vector space over field $bb(F)$, let $f in L(V, V, bb(F))$ then the following are equivalent
    + $rank f = n$
    + $forall alpha in V s0 exists beta in V in.rev f(alpha, beta) != 0$
    + $forall beta in V s0 exists alpha in V in.rev f(alpha, beta) != 0$
]) <full_rank_bilinear_form_corollary>

#definition(title: "non-degenerate bilinear form", [
    let $V$ be vector space over field $bb(F)$, let $f in L(V, V, bb(F))$ then $f$ is *non-degenerate* or *non-singular* iff $exists cal(B)$ be ordered basis of $V$ such that $[f]_cal(B)$ is non-singular
]) <non_degenerate_bilinear_form_definition>

#exercise([
    let $bb(F)$ be a field
    + let $n in bb(Z)^+$, let $V = bb(C)^(n times n)$ be vector space, let $f in L(V, V, bb(C))$ as \ $f(A, B) = n tr(A B) - tr(A) tr(B)$, then
        + let $V_1 = {A in V | tr A = 0}$, let $f_1 = f|_V_1$, then $f_1$ is non-degenerate
        + let $V_2 = {A in V | tr A = 0 and A^* = -A}$, let $f_2 = f|_V_2$, then $f_2$ is negative definite
        + let $W = {A in V | f(A, B) = 0 s0 forall B in V}$, then $W$ is subspace of $V$
    + let $V$ be finite-dimensional vector space, let $W = {beta in V | f(alpha, beta) = 0 s0 forall alpha in V}$ be subspace, then $rank f = dim V - dim W$
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $f in L(V, V, bb(F))$, let $V_1 subset V$ be subset such that $f|_V_1$ is non-degenerate, then $rank V >= dim V_1$
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $f, g in L(V, V, bb(F))$, let $g$ be non-singular, then $exists T_1, T_2 in L(V, V) in.rev f(alpha, beta) = g(T_1 alpha, beta) = g(alpha, T_2 beta) h0 forall alpha, beta in V$
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $f in L(V, V, bb(F))$, then $exists L_1, L_2 in V^*$ such that $f(alpha, beta) = L_1(alpha) L_2(beta) <=> rank f = 1$
]) <bilinear_forms_exercise>

== Symmetric Bilinear Forms

#definition(title: "symmetric bilinear form", [
    let $V$ be vector space over field $bb(F)$, let $f in L(V, V, bb(F))$ then $f$ is *symmetric* if \
    $f(alpha, beta) = f(beta, alpha) s0 forall alpha, beta in V$
]) <symmetric_bilinear_form_definition>

#definition(title: "quadratic form of symmetric bilinear form", [
    let $V$ be vector space over field $bb(F)$, let $f in L(V, V, bb(F))$ be symmetric, then *quadratic form associated with $f$* is defined as $q(alpha) = f(alpha, alpha)$

    the *polarization identity* is $f(alpha, beta) = 1 / 4 q (alpha + beta) - 1 / 4 q (alpha - beta)$
]) <quadratic_form_symmetric_bilinear_form_definition>

#theorem([
    let $V$ be finite-dimensional vector space over characteristic $0$ field $bb(F)$, let $f in L(V, V, bb(F))$ be symmetric, then $exists cal(B)$ be ordered basis of $V$ such that $[f]_cal(B)$ is diagonal matrix
]) <symmetric_bilinear_form_diagonal_matrix_theorem>

#corollary([
    let $bb(F)$ be subfield of $bb(C)$, let $A in bb(F)^(n times n)$ be symmetric, then $exists P in bb(F)^(n times n)$ be invertible such that $P^t A P$ is diagonal
]) <symmetric_matrix_diagonal_corollary>

#theorem([
    let $V$ be finite-dimensional vector space over $bb(C)$, let $f in L(V, V, bb(C))$ be symmetric of rank $r$, then \
    $exists cal(B) = {beta_1, dots, beta_n}$ an ordered basis of $V$ such that
    + $[f]_cal(B)$ is diagonal
    + $f(beta_j, beta_j) = cases(
        1 h0 1 <= j <= r,
        0 h0 j > r
    )$
]) <symmetric_bilinear_form_diagonalize_complex_theorem>

#theorem([
    let $V$ be $n$-dimensional vector space over $bb(R)$, let $f in L(V, V, bb(R))$ be symmetric of rank $r$, then \
    $exists cal(B) = {beta_1, dots, beta_n}$ an ordered basis of $V$ such that
    + $[f]_cal(B)$ is diagonal
    + $f(beta_j, beta_j) = cases(
        plus.minus 1 h0 & 1 <= j <= r,
        0 h0 & j > r
    )$
    + number of $beta_j$ such that $f(beta_j, beta_j) = 1$ is independent of choice of basis

    let $V = V^+ plus.o V^- plus.o V^bot$, where $V^+ = {alpha in V | f(alpha, alpha) > 0}$, $V^- = {alpha in V | f(alpha, alpha) < 0}$, \
    $V^bot = {alpha in V | f(alpha, alpha) = 0}$, then the *signature* of $f$ is $dim V^+ - dim V^-$
]) <symmetric_bilinear_form_diagonalize_real_theorem>

#exercise([
    + let $bb(F) subset bb(C)$ be field, let $V$ be finite-dimensional vector space over $bb(F)$, let $S$ be set of symmetric bilinear forms on $V$, let $Q$ be set of all quadratic forms on $V$, then
        + $S subset L(V, V, bb(F))$ is a subspace
        + $Q subset {f : V -> bb(F)}$ is a subspace
        + $Q tilde.equiv S$
        + let $U in L(V, V)$, let $q in Q$, then $(U^dagger q)(alpha) = q (U alpha)$ defines a quadratic form $U^dagger q$ on $V$
        + $U^dagger in Q$
        + $U^dagger$ is invertible iff $U$ is invertible
    + let $A in bb(R)^(n times n)$, let $q$ be quadratic form on $bb(R)^n$ as $q(x_1, dots, x_n) = sum_(i, j) A_(i j) x_i x_j$, then \ $exists U in L(bb(R)^n, bb(R)^n)$ such that $
        (U^dagger q)(x_1, dots, x_n) = sum_(i = 1)^n c_i x_i^2
    $ where $c_i = 1, -1, 0 h0 i = 1, dots, n$
    + let $f in L(bb(R)^n, bb(R)^n, bb(R))$ be symmetric, then $exists cal(B)$ be ordered basis of $bb(R)$ such that $[f]_cal(B)$ is diagonal
    + let $V = {A in bb(C)^(2 times 2) | A^* = A}$ be space over $bb(R)$, then
        + $q(A) = det A$ defines a quadratic form $q$ on $V$
        + let $W = {A in V | tr A = 0}$, then $f in L(V, V, bb(R))$ determined by $q$ is negative definite on $W$
    + let $V$ be finite-dimensional vector space over field $bb(F)$, let $f in L(V, V, bb(F))$ be non-degenerate symmetric, then $forall T in L(V, V) s0 exists T' in V in.rev f(T alpha, beta) = f(alpha, T' beta) h0 forall alpha, beta in V$ and
        - $(T_1 T_2)' = T'_2 T'_1$
        - $(c_1 T_1 + c_2 T_2)' = c_1 T'_1 + c_2 T'_2$
        - $(T')' = T$
    + let $V$ be finite-dimensional vector space over field $bb(F)$, let $f in L(V, V, bb(f))$ be non-degenerate symmetric, associate $f$ with $L_f$ as isomorphism of $V tilde.equiv V^*$, then for each $cal(B) = {alpha_1, dots, alpha_n}$ be basis of $V$, $existsunique cal(B)' = {alpha'_1, dots, alpha'_n}$ be basis of $V$ such that $f(alpha_i, alpha'_j) = delta_(i j)$, and $forall alpha in V$ that $
        alpha = sum_(i = 1)^n f(alpha, alpha'_i) alpha_i = sum_(i = 1)^n f(alpha_i, alpha) alpha'_i
    $ let $T, T' in L(V, V)$, let $[f]_cal(B) = A$, then
        + $[T']_cal(B)' = [T]^t_cal(B)$
        + $tr T = tr (T') = sum_i f(T alpha_i, alpha'_i)$
        + $alpha'_i = sum_j (A^(-1))_(i j) alpha_j = sum_j (A^(-1))_(j i) alpha_j$
    + let $bb(F)$ be a field, let $V = bb(F)^(n times 1)$, let $A in bb(F)^(n times n)$ be invertible, let $f in L(V, V, bb(F))$ as $f(X, Y) = X^t A Y$, let $P in bb(F)^(n times n)$, let $cal(B)$ be basis of $V$ of column $P$, let $cal(B)'$ defined similar, then $cal(B)'$ consists of columns of $A^(-1) (P^t)^(-1)$
    + let $V$ be finite-dimensional vector space over field $bb(F)$, let $f in L(V, V, bb(F))$, let $W subset V$ be subspace, let $W^bot = {alpha in V | f(alpha, beta) = 0 h0 forall beta in V}$, then
        + $W^bot$ is a subspace
        + $V = {0}^bot$
        + $V^bot = {0} <=> f$ is non-degenerate
        + $rank f = dim V - dim V^bot$
        + if $dim V = n$ and $dim W = m$, then $dim W^bot >= n - m$
        + $f|_W$ is non-degenerate iff $W inter W^bot = {0}$
        + $V = W plus.o W^bot$ iff $f|_W$ is non-degenerate
    + let $V$ be finite-dimensional vector space over $bb(C)$, let $f in L(V, V, bb(C))$ be non-degenerate symmetric, then $exists cal(B)$ be basis of $V$ such that $cal(B)' = cal(B)$ 
]) <symmetric_bilinear_forms_exercise>

== Skew-Symmetric Bilinear Forms

#definition(title: "skew-symmetric bilinear form", [
    let $bb(F) subset bb(C)$ be a field, let $V$ be vector space over $bb(F)$, let $f in L(V, V, bb(F))$, then $f$ is *skew-symmetric* if $f(alpha, beta) = -f(beta, alpha) h0 alpha, beta in V$
]) <skew_symmetric_bilinear_form_definition>

#theorem([
    let $V$ be vector space over field $bb(F) subset bb(C)$, let $f in L(V, V, bb(F))$ be skew-symmetric, then $exists alpha_1, beta_1, dots, alpha_k, beta_k$ such that
    + $f(alpha_j, beta_j) = 1 h0 j = 1, dots, k$
    + $f(alpha_i, beta_j) = f(alpha_i, alpha_j) = f(beta_i, beta_j) = 0 h0 i != j$
    + let each $W_i = span(alpha_i, beta_i)$ and $f|_W_0 = 0$ then 
    $
        V = W_1 plus.o dots plus.o W_k plus.o W_0
    $
]) <skew_symmetric_bilinear_form_direct_sum_theorem>

#theorem([
    let $V$ be $n$-dimensional vector space over field $bb(F) subset bb(C)$, let $f in L(V, V, bb(F))$ be skew-symmetric, then
    + $rank f = 2 k h0 k in bb(N)$
    + $exists cal(B)$ be ordered basis of $V$ such that $
        [f]_cal(B) = ( op(plus.o, limits: #true)_(i=1)^k mat(0, 1; -1, 0) ) plus.o 0_((n - 2 k) times (n - 2 k))
    $
    + if $dim V = 2 k$ then exists $cal(B)$ be ordered basis of $V$ such that$
        [f]_cal(B) = mat(0, J; -J, 0) h0 suchthat J = mat(
            0, dots, 0, 1;
            0, dots, 1, 0;
            dots.v, dots.down, dots.v, dots.v;
            1, dots, 0, 0
        )
    $
]) <skew_symmetric_bilinear_form_matrix_theorem>

#exercise([
    let $bb(F)$ be a field
    + let $V$ be vector space over $bb(F)$, let $S = {f in L(V, V, bb(F)) | f(alpha, beta) = -f(beta, alpha) h0 forall alpha, beta in V}$, then $S subset L(V, V, bb(F))$ be subset
    + let $f, g in L(bb(C)^n, bb(C)^n, bb(C))$ with $f$ symmetric and $g$ skew-symmetric, if $f + g = 0 => f = g = 0$
    + let $V$ be $n$-dimensional vector space over $bb(F) subset bb(C)$, then
        + $(P f)(alpha, beta) = 1/2 f(alpha, beta) - 1/2 f(beta, alpha)$ defines $P in L(L(V, V, bb(F)), L(V, V, bb(F)))$
        + $P^2 = P$ is a projection
        + $rank P = (n (n - 1))/2 h0 nullity P = (n (n + 1))/2$
        + let $U in L(V, V)$, then $(U^dagger f)(alpha, beta) = f(U alpha, U beta)$ defines $U^dagger in L(L(V, V, bb(F)), L(V, V, bb(F)))$
    + let $V$ be vector space over field $bb(F)$, let $f in L(V, V, bb(F))$, let $L_f, R_f in V^*$ such that \ $f(alpha, beta) = L_f (alpha)(beta) = R_f (beta)(alpha)$, then $f$ is skew-symmetric iff $L_f = -R_f$
    + let $V$ be finite-dimensional vector space over $bb(F)$, let $L_1, L_2 in L(V, V, bb(F))$, then \ $f(alpha, beta) = L_1 (alpha) L_2 (beta) - L_1 (beta) L_2 (alpha)$ defines a skew-symmetric bilinear form on $V$, and $f = 0$ iff $L_1, L_2$ are linearly dependent
    + let $V$ be finite-dimensional vector space over $bb(F) subset bb(C)$, let $f in L(V, V, bb(F))$ be skew-symmetric, then $rank f = 2 <=> exists L_1, L_2 in V^*$ be linearly independent such that $f$ is defined as previous formula
    + let $f in L(bb(R)^3, bb(R)^3, bb(R))$, then $f$ can be defined as prevous formula
    + let $V$ be finite-dimensional vector space over $bb(F) subset bb(C)$, let $f, g in L(V, V, bb(F))$ be skew-symmetric, then $exists T in L(V, V)$ be invertible, such that $f(T alpha, T beta) = g(alpha, beta) h0 forall alpha, beta in V$ iff \ $rank f = rank g$
]) <skew-symmetric_bilinear_form_exercise>

== Groups Preserving Bilinear Forms

#definition(title: "preservation in bilinear form", [
    let $V$ be vector space over field $bb(F)$, let $f in L(V, V, bb(F))$, let $T in L(V, V)$ then $T$ *preserves* $f$ if \
    $f(T alpha, T beta) = f(alpha, beta) h0 forall alpha, beta in V$

    if $S, T$ preserves $f$ then $S T$ preserves $f$
]) <preserve_bilinear_form_definition>

#theorem([
    let $V$ be finite-dimensional vector space over field $bb(F)$, let $f in L(V, V, bb(F))$ be non-degenerate then \
    $S = {T in L(V, V) | f(T alpha, T beta) = f(alpha, beta) s0 forall alpha, beta in V}$ is a group under linear operation composition
]) <bilinear_form_preserve_linear_operator_group_theorem>

#corollary([
    let $V$ be finite-dimensional vector space over field $bb(F)$, let $f in L(V, V, bb(F))$ be non-degenerate, let $cal(B)$ be ordered basis of $V$, let $q(alpha) = f(alpha, alpha) s0 forall alpha in V$ be quadratic form, then
    + $T$ preserves $f <=> [T]^t_cal(B) [f]_cal(B) [T]_cal(B) = [f]_cal(B)$
    + $T$ preserves $f <=> T$ preserves $q$
]) <bilinear_form_perserve_linear_operator_corollary>

#definition(title: "orthogonal group", [
    let $V$ be $n$-dimensional vector space over field $bb(F) = bb(C)$ or $bb(R)$, let $f(alpha, beta) = sum_(j=1)^n x_i y_i$ then the group preserving $f$ is the *orthogonal group*, its matrix is *orthogonal matrix* $M in bb(F)^(n times n) in.rev M^t M = I$, the orthogonal group is denoted as $O(n, bb(F))$
]) <orthogonal_group_definition>

#definition(title: "pseudo-orthogonal group", [
    let $V$ be $n$-dimensional vector space over field $bb(R)$, let $f in L(V, V, bb(R))$ be symmetric with quadratic form
    $
        q(x_1, dots, x_n) = sum_(j = 1)^p x_j^2 - sum_(j = p + 1)^n x_j^2 h0 p in bb(N)
    $
    then the group preserves $f$ is the *pseudo-orthogonal group*

    when $p = n$ then we have $O(n, bb(R))$, if $p = r$ or $p = n - r$ we each are negative, hence the number of groups of $f$ is
    $
        cases(
            (n + 1) / 2 h0 n "is odd",
            (n + 2) / 2 h0 n "is even"
        )
    $
]) <pseudo_orthogonal_group_definition>

#theorem([
    let $V$ be $n$-dimensional vector space over $bb(C)$, let $f in L(V, V, bb(C))$ be non-degenerate symmetric, then group preserves $f$ is isomorphic to $O(n, bb(C))$
]) <bilinear_preserve_group_isomorphic_complex_orthogonal_theorem>

#theorem([
    let $V$ be $n$-dimensional vector space over $bb(R)$, let $f in L(V, V, bb(R))$ be non-degenerate symmetric, then group preserves $f$ is isomorphic to pseudo-orthogonal group of $bb(C)^(n times n)$
]) <bilinear_presere_group_isomorphic_real_pseudo_orthogonal_theorem>

#definition(title: "Lorentz group", [
    let $f in L(bb(R)^4, bb(R)^4, bb(R))$ with quadratic form
    $
        q(x, y, z, t) = t^2 - x^2 - y^2 - z^2
    $
    then $T in L(bb(R)^4, bb(R)^4)$ preserves $f$ is *Lorentz Trnasformation*, the group preserves $f$ is *Lorentz group*

    let $H = {A in bb(C)^(2 times 2) | A^* = A}$ is a group, then
    $
        Phi(x, y, z, t) = mat(
            t + x, y + i z;
            y - i z, t - x
        )
    $
    is an isomorphism from $bb(R)^4 -> H$, and $q(alpha) = det Phi(alpha)$

    let $U_M (A) = M A M^*, s0 A in H$ then $U_M$ preserves determinant iff $|det U_M| = 1$, then
    + let $M_1, M_2 in bb(C)^(2 times 2)$, then $U_M_1 = U_M_2 <=> M_2 = c M_1$ for some $c$
    + not all Lorentz transformation is obtained from $U_M$
]) <lorentz_group_definition>

#exercise([
    + let $M in O(n, bb(C))$, then $M^t, overline(M), M^* in O(n, bb(C))$
    + let $M in O(n, bb(C))$, let $M' tilde M$, then $M' in O(n, bb(C))$
    + let $M in O(n, bb(C))$, let $y_j = sum_(k = 1)^n M_(j k) x_k$ then $sum_(j = 1)^n y_j^2 = sum_(j = 1)^n x_j^2$
    + let $M in bb(C)^(n times n)$ with columns $M_1, dots, M_n$, then $M in O(n, bb(C)) <=> M^t_j M_k = delta_(j k) h0 1 <= j, k <= n$
    + let $X in bb(C)^(n times 1) in.rev X^t X = 1$, then $forall j s0 exists M in O(n, bb(C)) in.rev M X = I_(. j)$
    + let $V = bb(C)^(n times 1)$ be vector space, let $A in bb(C)^(n times n)$, let $f in L(V, V, bb(C))$ as $f(X, Y) = X^t A Y$, then $f$ is invariant under $O(n, bb(C))$ iff $forall M in O(n, bb(C)) s0 A M = M A$
    + let $S subset bb(C)^(n times n)$ be any set, let $S' = {A in bb(C)^(n times n) | A B = B A s0 forall B in S}$, then $S'$ is a linear algebra over $bb(C)$
    + let $bb(F) subset bb(C)$ be field, let $V$ be finite-dimensional vector space over $bb(F)$, let $f in L(V, V, bb(F))$ be non-singular, let $T in L(V, V)$, then $T$ preserves $f$ iff $det T = plus.minus 1$
    + let $bb(F) subset bb(C)$ be field, let $A in bb(F)^(n times n)$ be invertible, let $f in L(bb(F)^n, bb(F)^n, bb(F))$ be $f(X, Y) = X^t A Y$, let \ $M in bb(F)^(n times n)$, then $M$ preserves $f$ iff $A^(-1) M^t A = M^(-1)$
]) <groups_perserving_bilinear_forms_exercise>

== Additional Topics

#definition(title: "Hessian matrix", [
    let $f : bb(R)^n -> bb(R) suchthat f in C^(3-)$ let $p = (p_1, dots, p_n)$ then define *Hessian matrix* be $H in bb(R)^(n times n)$
    $
        H_(i j) (p) = (partial^2 f (p))/((partial x_i) (partial x_j))
    $
]) <hessian_matrix_definition>

#theorem(title: "the second derivative test", [
    let $f : bb(R)^n -> bb(R) suchthat f in C^(3-)$, let $p = (x_1, dots, x_n)$ be critical point of $f$, let $A(p)$ be Hessian of $f$ on $p$ of characteristic values $c_1, dots, c_n$ if $rank A = n$
    + if $c_i > 0 h0 i = 1, dots, n$ then $f$ has local minimum at $p$
    + if $c_i < 0 h0 i = 1, dots, n$, then $f$ has local maximum at $p$
    + if $exists c_i < 0 and exists c_j > 0$, then $f$ has saddle point at $p$
    + if $rank(A) != n$ and $exists.not c_i < 0 and exists.not c_j > 0$, then the test is inconslusive
]) <the_second_derivative_test_theorem>

