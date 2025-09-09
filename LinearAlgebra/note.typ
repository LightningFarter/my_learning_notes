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

#show heading.where(level:1): it => {
    c-ch.step()
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

Let $F$ be a field, must satisfy:

#definition([
    $ x + y = y + x  h1 forall x , y in F $
    $ x + (y + z) = (x + y) + z h1 forall x, y, z in F $
    $ exists excl s0 0 in F suchthat x + 0 = x h1 forall x in F $
    $ forall x in F s0 exists s0 (-x) suchthat x + (-x) = 0 $
    $ x y = y x h0 forall x, y in F $
    $ x (y z) = (x y) z h0 forall x, y, z in F $
    $ exists excl s0 1 in F suchthat x 1 = x h0 forall x in F $
    $ forall x eq.not 0, x in F, s0 exists s0 x^(-1) suchthat x x^(-1) = 1 $
    $ x (y + z) = x y + x z h0 forall x, y, z in F $
]) <field_axioms>

== Systems of Linear Equations

*Linear equations* has form of:

#example([
    $ A_(1 1) x_1 + A_(1 2) x_2 + dots + A_(1 n) x_n = y_1 $
    $ A_(2 1) x_1 + A_(2 2) x_2 + dots + A_(2 n) x_n = y_2 $
    $ dots.v h1 dots.v h3 h1 dots.v h1 dots.v $
    $ A_(m 1) x_1 + A_(m 2) x_2 + dots + A_(m n) x_n = y_m $
]) <linear_equation_example>

If $y_1 = y_2 = dots = y_m = 0$ is a solution, the system is *homogeneous*.

*Linear Combination* has form of:

#example([
    $ ( c_1 A_(1 1) + dots + c_m A_(m 1) ) x_1 + dots + (c_1 A_(1 n) + dots + c_m A_(m n) ) x_n = c_1 y_1 + dots + c_m y_m $
]) <linear_combination_example>

Linear equations are *equivalent* if each equation is linear combination of other in each system.

#theorem([
    Equivalent systems of linear equations have exactly the same solutions.
]) <linear_equation_equivilance_theorem>

#pagebreak()

== Matrics and Elementary Row Operations

We could abbreviate Linear system of #exref(<linear_equation_example>) as:
$ bold(A) bold(X) = bold(Y) $
where
$
    bold(A) = mat(A_(1 1), dots, A_(1 n) ; 
        dots.v , , dots.v ;
        A_(m 1), dots, A_(m n)
    ) h1
    bold(X) = vec(x_1, dots.v, x_n) h1
    bold(Y) = vec(y_1, dots.v, y_n)
$
$bold(A)$ is the *matrix of coefficients*

#definition(title: "Elementary Row Operation", [
    + $e(bold(A))_(i j) = bold(A)_(i j) h0 mif i eq.not r h0 e(bold(A))_(r j) = c bold(A)_(r j)$
    + $e(bold(A))_(i j) = bold(A)_(i j) h0 mif i eq.not r h0 e(bold(A))_(r j) = bold(A)_(r j) + c bold(A)_(s j)$
    + $e(bold(A))_(i j) = bold(A)_(i j) h0 mif i eq.not r and i eq.not s h0 e(bold(A))_(r j) = bold(A)_(s j) h0 e(bold(A))_(s j) = bold(A)_(r j)$
]) <elementary_row_operation_definition>

#theorem([
    $
        "let" E "be set of all elementary row operations" \
        forall e in E s0 exists s0 e' in E suchthat e'(e(bold(A))) = e(e'(bold(A))) = bold(A)
    $
]) <elementary_row_operation_exists_inverse_theorem>

#definition(title: "Row-Equivalent", [
    for $bold(A), bold(B) in F^(m times n)$, $bold(B)$ is row-equivalent to $bold(A)$ if $bold(B)$ is obtainable from a series of elementary row operations from $bold(A)$
]) <row_equivalent_definition>

#theorem([
    if $bold(A), bold(B) in F^(m times n)$ are row-equivalent, then homogeneous system $bold(A) bold(X) = bold(0) h0 bold(B) bold(X) = bold(0)$ has exact same solution
]) <homogeneous_row_equivalent_theorem>

#definition(title: "Row-Reduced", [
    + first non-zero entry in each non-zero row is equal to $1$
    + column having some row's first non-zero entry must have all other entries $0$
]) <row_reduced_definition>

#definition(title: "Identity Matrics", [
    $ I_(i j) = delta_(i j) = cases(
        1 mif i = j \
        0 mif i eq.not j
    ) $
    the $delta$ is called *Kronecker Delta*
]) <identity_matrics_definition>

#theorem([
    every $m times n$ matrix over $F$ is row-equivalent to a row-reduced matrix
]) <row_reduced_equivalent_theorem>

== Row-Reduced Echelon Matrics

#definition(title: "Row-Reduced Echelon", [
    for $bold(R) in F^(m times n)$ to be row-reduced echelon:
    + $bold(R)$ is row-reduced
    + all row of full $0$ entries is below any non-zero row
    + if there are $r$ non-zero rows in $R$, where the leading non-zero entry of row $i$ occurs in $k_i$, $i = 1, dots, r$ then $k_1 < k_2 < dots < k_r$
]) <row_reduced_echelon_definition>

#theorem([
    every $bold(A) in F^(m times n)$ is row-equivalent to a row-reduced echelon
]) <row_echelon_equivalence_theorem>

#theorem([
    for matrix $bold(A) in F^(m times n)$ if $m < n$ then $bold(A) bold(X) = bold(0)$ has non-trivial solution
]) <non_trivial_solution_homogeneous_theorem>

#theorem([
    a homogeneous equation $bold(A) bold(X) = bold(0)$ is row-equivalent to $bold(I)$ iff it has only trivial solution
]) <homogeneous_trivial_solution_identity_theorem>

== Matrix Multiplication

#definition(title: "Matrix Multiplication", [
    $
        "let" bold(A) in F^(m times n) , s0 bold(B) in F^(n times p), s0 bold(A) bold(B) = bold(C), " where " bold(C) in F^(m times p) \
        "then " C_(i j) = sum_(r = 1)^n A_(i r) B_(r j)
    $
]) <matrix_multiplication_definition>

#theorem([
    if $bold(A), bold(B), bold(C)$ are matrices over field $F$ has product $bold(B) bold(C), bold(A)(bold(B) bold(C))$ defined, then so are
    $bold(A B), bold((A B) C)$, #s0 moreover, $bold(A (B C) = (A B) C)$
]) <matrix_product_defined_associative_theorem>

#definition(title: "Elementary Matrix", [
    a matrix is said to be *elementary matrix* if it could be obtainable by Identity matrix through a series of elementary row operations
]) <elementary_matrix_definition>

#theorem([
    let $e$ be elementary row operation, and $bold(E) = e(bold(I))$ then for every $bold(A)_(m times n)$, #s0 $e(bold(A)) = bold(E A)$
]) <elementary_row_operation_matrix_equivalence_theorem>

#corollary([
    let $bold(A), bold(B) in F^(m times n)$ then $bold(B)$ is row-equivalent to $bold(A)$ iff $bold(B = P A)$ where $bold(P)$ is product of a series of elementary row operation
]) <row_equivalent_elementary_row_operation_corollary>

== Invertible Matrix

#definition([
    let $bold(A), bold(B) in F^(n times n)$ if $bold(A B = I)$, $bold(A)$ is the *left inverse* of $bold(B)$ and $bold(B)$ is the *right inverse* of $bold(A)$, if $bold(A B = B A = I)$ then it is a *two-sided inverse* and $bold(A)$ is said to be invertible
]) <matrix_inverse_definition>

#lemma([
    if $bold(A)$ has left inverse $bold(B)$ and right inverse $bold(C)$, then $bold(B = C)$
]) <matrix_left_right_inverse_lemma>

#theorem([
    let $bold(A), bold(B) in F^(n times n)$
    + if $bold(A)$ is invertible, so is $bold(A)^(-1)$ and $(bold(A)^(-1))^(-1) = bold(A)$
    + if both $bold(A), bold(B)$ are invertible, so is $bold(A B)$ and $(bold(A B))^(-1) = bold(B)^(-1) bold(A)^(-1)$
]) <matrix_inverse_product_invertibility_theorem>

#corollary([
    product of invertible matrices are invertible
]) <matrix_product_invertibility_corollary>

#theorem([
    an elementary matrix is invertible
]) <elementary_matrix_invertibility_theorem>

#theorem([
    for $bold(A) in F^(n times n)$, the following are equivalent
    + $bold(A)$ is invertible
    + $bold(A)$ is row-equivalent to identity matrix
    + $bold(A)$ is product of elementary matrics
    + homogeneous system $bold(A X = 0)$ has only trivial solution
    + $bold(A X = Y)$ has solution $bold(X)$ for each $bold(Y)_(n times 1)$
]) <invertible_row_equivalence_identity_elementary_product_relation_theorem>

#corollary([
    + let $bold(A) in F^(n times n)$, if a $bold(E)_k dots bold(E)_1 bold(A) = bold(I)$ then $bold(E)_k dots bold(E)_1 bold(I) = bold(A)^(-1)$ \
    + let $bold(A), bold(B) in F^(m times n)$ then $bold(B)$ is row-equivalent to $bold(A)$ iff $bold(B = P A)$ where $bold(P)$ is an invertible $m times m$ matrix \
    + a square matrix with left or right inverse is invertible \
    + let $bold(A = A_1 dots A_k)$ where $bold(A_1), dots, bold(A_k)$ are square matrics, then $bold(A)$ is invertible iff all $bold(A_1), dots, bold(A_k)$ are invertible
]) <inverse_elementary_row_operation_corollary>

#pagebreak()

= Vector Spaces

== Vector Spaces

#definition(title: "Vector Space", [
    a vector space consists of:
    + a field $F$ of scalars
    + a set $V$ of vectors
    + an addition operation on a pair of vectors, say $alpha , beta, gamma in V$
        - $alpha + beta in V$
        - $alpha + beta = beta + alpha$
        - $alpha + (beta + gamma) = (alpha + beta) + gamma$
        - $existsunique 0 in V suchthat alpha + 0 = alpha h0 forall alpha in V$
        - $forall alpha in V s0 existsunique -alpha in V suchthat alpha + (-alpha) = 0$
    + a scalar multiplation operator, say $alpha, beta in V$, and $c, c_1, c_2 in F$
        - $1 alpha = alpha h0 forall alpha in V$
        - $(c_1 c_2) alpha = c_1 (c_2 alpha)$
        - $c (alpha + beta) = c alpha + c beta$
        - $(c_1 + c_2) alpha = c_1 alpha + c_2 alpha$
]) <vector_space_definition>

#definition(title: "Linear Combination", [
    vector $beta in V$ is said to be linear combination of $alpha_1 , dots, alpha_n in V$ provided scalars $c_1, dots, c_n in F$ iff
    $ beta = c_1 alpha_1 + dots + c_n alpha_n = sum^n_(k=1) c_k alpha_k $
]) <linear_combination_definition>

== Subspaces

#definition(title: "Subspace", [
    let $V$ be a vector space over field $F$, the subspace $W$ over field $F$ is a subset of $V$ which itself is a vector space with the same operators
]) <subspace_definition>

#theorem([
    a non-empty subset $W$ of $V$ is a subspace of $V$ over field $F$ iff $s0 forall alpha, beta in W, s0 c in F, s0 c alpha + beta in W$
]) <subspace_definition_equivalence_theorem>

a *Hermitian matrix* is a square matrix over complex number where $A_(j k) = overline(A_(k j))$

#lemma([
    $
        "let" bold(A) in F^(m times n), s0 bold(B), bold(C) in F^(n times p), s0 d in F \
        bold(A) (d bold(B) + bold(C)) = d ( bold(A B) ) + bold(A C)
    $
]) <matrix_is_vector_space_lemma>

#theorem([
    let $V$ be a vector space over $F$, the intersection of any collection of subspace of $V$ is a subspace of $V$
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
    $ alpha_1 + dots + alpha_n, h0 alpha_1 in S_1, s0 dots , s0 alpha_n in S_n $
    is denoted as
    $ S_1 + dots + S_n = sum_(k = 1)^n S_k $
]) <subset_sum_definition>

the subspace of $F^n$ over field $F$ spanned by row vectors of matrix $A in F^(m times n)$ is called *row space* of $A$

== Bases and Dimension

#definition([
    for vector space $V$ over field $F$, a subspace $S$ is *linear dependent* iff
    $
        exists s0 alpha_1, dots, alpha_n in S, s0 c_1, dots, c_n in F suchthat sum_(k = 1)^n c_k alpha_k = 0
    $
    otherwise it is called *linear independent*
]) <linear_dependent_definition>

#definition(title: "basis", [
    let $V$ be a vector space, a *basis* is a linear independent set that spans $V$ \
    the space $V$ is *finite-dimensional* if it has finite basis \
]) <basis_definition>

#example([
    a standard basis of $F^n$ has form of:
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
    let $bold(A) in F^(n times n)$ has its row vectors linear independent, then $bold(A)$ is invertible
]) <row_vector_independence_invertible_matrix_corollary>

#theorem([
    if $W_1 , W_2$ are subspaces of finite-dimensional vector space $V$ then $W_1 + W_2$ are finite-dimensional and $dim W_1 + dim W_2 = dim (W_1 inter W_2) + dim (W_1 + W_2)$
]) <dimension_of_sum_subspaces_theorem>

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
    let $bold(P)_(n times n)$ be invertible matrix over $F$, $V$ be an $n$-dimensional vector space with ordered basis $cal(B)$. there is a unique ordered basis $cal(B)'$ for each $alpha$ such that
    $
        [alpha]_cal(B) = bold(P) [alpha]_cal(B)' \
        [alpha]_cal(B)' = bold(P)^(-1) [alpha]_cal(B) \
        bold(P) = mat([alpha'_1]_cal(B), dots, [alpha'_n]_cal(B))
    $
]) <ordered_basis_transforming_theorem>

== Summary of Row-Equivalences

#theorem([
    Row-Equivalent matrices have the same row space
]) <row_equivalent_same_row_space_theorem>

#theorem([
    let $bold(R)$ be a row-reduced echelon matrix, then the non-zero rows of $bold(R)$ forms a basis of row space of $bold(R)$
]) <row_reduced_echelon_non_zero_row_space_theorem>

#theorem([
    $"let" m, n > 0 s0 m, n in N, s0 F "be a field", s0 W "be a subspace of " F^n "and" dim W <= m$ \
    then exists unique row-reduced echelon matrix over $F$ which has $W$ as its row space
]) <row_space_unique_row_reduced_echelon_theorem>

#corollary([
    each $m times n$ matrix is row-equivalent to one and only one row-reduced echelon matrix
]) <any_matrix_row_reduced_echelon_uniqueness_corollary>

#corollary([
    let $bold(A), bold(B) in F^(m times n)$, then $bold(A)$ and $bold(B)$ are row-equivalent iff they have the same row space
]) <same_row_space_row_equivalence_corollary>

#pagebreak()

= Linear Transformations

== Linear Transformations

#definition(title: "Linear Transformation", [
    let $V, W$ be vector spaces over field $F$, a linear transformation from $V$ to $W$ is a function \
    $T: V arrow W$ such that $T(c alpha + beta) = c(T alpha) + T beta$
]) <linear_transformation_definition>

if $V$ is a vector space, an *identity transformation* $I$ is defined by $I alpha = alpha$ for $alpha in V$ \
an *zero transformation* $0$ is defined by $0 alpha = 0$ 

#theorem([
    let $V$ be a finite-dimensional vector space over field $F$, let ${alpha_1, dots, alpha_n}$ be an ordered basis of $V$, let $W$ be a vector space over $F$, and let $beta_1, dots, beta_n$ be any vectors in $W$, then
    $
        existsunique T : V arrow W suchthat T alpha_i = beta_i, h0 i = 1, dots, n
    $
]) <exists_unique_linear_transformation_theorem>

#definition([
    let $V, W$ be vector spaces over field $F$, let $T : V -> W$, the *null space* of $T$ is the set of all vectors $alpha$ such that $T alpha = 0$ \
    let $V$ be a finite-dimensional vector space, the *rank* of $T$ is the dimension of range of $T$, the *nullity* of $T$ is the dimension of null space of $T$
]) <null_space_rank_nullity_definition>

#theorem([
    let $V$ be finite-dimensional and $W$ be any vector space over $F$, let $T : V -> W$ be a linear transformation, then
    $
        rank T + nullity T = dim V
    $
]) <rank_nullity_dim_relation_theorem>

#theorem([
    if $bold(A) in F^(m times n)$ then $ "row" rank bold(A) = "column" rank bold(A) $
]) <row_column_rank_equality_theorem>

== The Algebra of Linear Transformation

#theorem([
    let $V, W$ be vector spaces over field $F$, #s0 $T, U$ be linear transformations from $V$ into $W$ then functions $ (T + U)(alpha) := T alpha + U alpha$, #s0 $(c T)(alpha) := c (T alpha)$ where the set of linear transformations $ T, U$ spanned form a vector space over field $F$
]) <linear_transformation_set_vector_space_theorem>

#theorem([
    let $V$ be $n$-dimensional and $W$ be $m$-dimensional vector space over $F$, then the linear transformation vector space $L(V, W)$ is finite-dimensional and has dimension $m n$
]) <linear_transformation_dimension_relation_theorem>

#theorem([
    let $V, W, Z$ be vector spaces over field $F$, #s0 let linear transformations $T : V -> W, s0 U : W -> Z$ then $(U T)(alpha) := U(T(alpha))$ is a linear transformation such that $U T : V -> W$
]) <composed_linear_transformation_theorem>

#definition(title: "linear operator", [
    let $V$ be a vector space over field $F$, then $T : V -> V$ is a *linear operator* on $V$
]) <linear_operator_definition>

#lemma([
    let $V$ be a vector space over field $F$, $s0$ let $U, T_1, T_2$ be linear operators on $V$, $s0$ let $c in F$
    + $I U = U I = U$
    + $U (T_1 + T_2) = U T_1 + U T_2 h0 (T_1 + T_2) U = T_1 U + T_2 U$
    + $c (U T_1) = (c U) T_1 = U (c T_1)$
]) <linear_operator_lemma>

#theorem([
    let $V, W$ be vector spaces over field $F$, let $T : V -> W$ be linear transformation \
    if $T$ is invertible, then $T^(-1) : W -> V$ is linear transformation
]) <linear_transformation_inverse_theorem>

for a linear transformation $T$ to be *non-singular* is $T alpha = 0$ implies $alpha = 0$

#theorem([
    let $T : V -> W$ be linear transformation, then $T$ is non-singular iff $T$ maps each linearly independent subset of $V$ onto a linearly independent subset of $W$
]) <non_singularity_linear_independent_subset_theorem>

#theorem([
    let $V, W$ be finite-dimensional vector spaces over field $F$ such that $dim V = dim W$, let $T : V -> W$ be linear transformation then the followings are equivalent
    + $T$ is invertible
    + $T$ is non-singular
    + $T$ is onto
    + if ${alpha_1, dots, alpha_n}$ is basis of $V$, then ${T alpha_1, dots, T alpha_n}$ is a basis for $W$
    + $exists "basis" {alpha_1, dots, alpha_n} "for" V suchthat {T alpha_1, dots, T alpha_n}$ is basis of $W$ 
]) <equal_dimension_linear_transform_equivalency_theorem>

== Isomorphism

if $V, W$ are vector spaces over field $F$, any bijection transformation $T : V -> W$ is called *isomorphism* of $V$ onto $W$

#theorem([
    every $n$-dimensional vector space over field $F$ is isomorphic to space $F^n$
]) <n_dimensional_n_tuple_isomorphism_theorem>

== Representation of Transformations by Matrices

#theorem([
    let $V$ be $n$-dimensional, $W$ be $m$-dimensional vector spaces over field $F$, let $cal(B)$ be ordered basis of $V$, and $cal(B)'$ be ordered basis of $W$
    $
        forall s0 T : V -> W s0 exists bold(A) in F^(m times n) suchthat [T alpha]_(cal(B)') 
        = bold(A) [alpha]_(cal(B)) h0 forall alpha in V
    $
    furthermore, $T -> A$ is a bijection between $L(V, W)$ and $F^(m times n)$
]) <linear_transformation_matrices_representation_existence_theorem>

$bold(A)$ in #theref(<linear_transformation_matrices_representation_existence_theorem>) is called *matrix of * $T$ * relative to the ordered bases * $cal(B), cal(B)'$ deonted as $[T]_cal(B)^cal(B)'$

#theorem([
    let $V, W, Z$ be finite-dimensional vector space over field $F$, let $cal(B), cal(B)', cal(B)''$ be ordered basis of $V, W, Z$ respectively, let $T : V -> W, s0 U : W -> Z$, if $bold(A)$ be matrix of $T$ relative to $(cal(B), cal(B)')$, and $bold(B)$ be matrix of $U$ relative to $(cal(B)', cal(B)'')$, then matrix of $U T$ relative to $(cal(B), cal(B)'')$ be $bold(C) = bold(B) bold(A)$
]) <linear_transformation_composition_matrix_representation_theorem>

#definition([
    let $bold(A), bold(B) in F^(n times n)$, then $bold(B)$ is similar to $bold(A)$ over $F$ if exists invertible $bold(P) in F^(n times n)$ such that $bold(B) = bold(P)^(-1) bold(A) bold(P)$
]) <similar_matrix_definition>

#theorem([
    let $V$ be finite-dimensional vector space over field $F$ let $cal(B) = {alpha_1, dots, alpha_n}$ and $cal(B)' = {alpha'_1, dots, alpha'_n}$ be ordered basis of $V$; let $T$ be linear operator on $V$, if $bold(P) = [ [alpha'_1]_cal(B), dots, [alpha'_n]_cal(B) ]$ be $n times n$ matrix, then
    $
        [T]_cal(B)' = bold(P)^(-1) [T]_cal(B) bold(P)
    $
    if $U$ is invertible operator on $V$ defined by $U alpha_j = alpha'_j, s0 j = 1 , dots, n$ then
    $
        [T]_cal(B)' = [U]^(-1)_cal(B) [T]_cal(B) [U]_cal(B)
    $
]) <linear_operator_similar_theorem>

== Linear Functionals

#definition(title: "linear functional", [
    let $V$ be a vector space over field $F$, a *linear functional* $f : V -> F$ is a linear transformation from $V$ to $F$ such that
    $
        f( c alpha + beta) = c f(alpha) + f(beta)
    $
]) <linear_functional_definition>

#definition(title: "dual space", [
    let $V$ be a vector space over field $F$, then $L(V, F)$ is a *dual space* of $V$ denoted as $V^*$
]) <dual_space_definition>

#corollary([
    let $V$ be a vector space over field $F$, and let $V^*$ be its dual space, then
    $
        dim V^* = dim V
    $
]) <dual_space_dimension_corollary>

#theorem([
    let $V$ be a finite-dimensional vector space over field $F$ with an ordered basis $cal(B) = {alpha_1, dots, alpha_n}$\
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
    let $V$ be a vector space over field $F$, and $S$ is a subset of $V$ #s0 the *annihilator* of $S$ denoted as $S^0$ is the set of linear functionals $f$ on $V$ such that $f(alpha) = 0 s0 forall alpha in S$
]) <annihilator_definition>

#theorem([
    let $V$ be a finite-dimensional vector space over field $F$, and let $W$ be a subspace of $V$, then
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

== The Double Dual

#theorem([
    let $V$ be finite-dimensional vector space over field $F$, for each $alpha in V$ define
    $
        L_(alpha) (f) = f(alpha), h0 f in V^*
    $
    the mapping $alpha -> L_alpha$ is an isomorphism of $V$ onto $V^(**)$
]) <double_dual_isomorphism_theorem>

#corollary([
    let $V$ be finite-dimensional vector space over field $F$, let $L$ be a linear functional on dual space $V^*$ of $V$, then
    $
        existsunique alpha in V suchthat L(f) = f(alpha) h0 forall f in V^*
    $
]) <exists_unique_dual_linear_functional_corollary>

#corollary([
    let $V$ be finite-dimensional vector space over field $F$, then each basis of $V^*$ is the dual of some basis for $V$
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
    let $V$ be vector space over field $F$, let $f, g in L(V, F)$
    $
        g = c f <=> null f subset null g <=> (f(alpha) = 0 => g(alpha) = 0) \
        c in F, s0 alpha in V
    $
]) <linear_functional_scalar_multiple_lemma>

#theorem([
    let $g, f_1, dots, f_r$ be linear functionals on vector space $V$ with null space $N, N_1, dots, N_r$, then $g$ is linear combination of $f_1, dots, f_r$ iff $N_1 inter dots inter N_r subset N$
]) <linear_functional_linear_combination_theorem>

== The Transpose of a Linear Transformation

#theorem([
    let $V, W$ be vector spaces over field $F$, then \
    $
        "for each linear transformation" T : V -> W \
        existsunique T^t : W^* -> V^* suchthat \
        (T^t g)(alpha) = g (T alpha) h0 forall g in W^*, forall alpha in V
    $
    which $T^t$ is called *transpose* of $T$
]) <transpose_definition_theorem>

#theorem([
    let $V, W$ be vector spaces over field $F$, let $T in L(V, W)$, then
    $
        null T^t = (range T)^0
    $
    if $V, W$ are finite-dimensional, then
    + $rank T = rank T^t$
    + $range T^t = (null T)^0$
]) <null_annihilator_transpose_theorem>

#theorem([
    let $V, W$ be finite-dimensional vector space over field $F$, let $cal(B)$ be basis of $V$ with dual basis $cal(B)^*$, let $cal(B)'$ be basis of $W$ with dual basis of $cal(B)'^*$, let $T in L(V, W)$ where
    $
        [T]_cal(B)^cal(B)' = A h0 [T^t]_(cal(B)'^*)^(cal(B)^*) = B \
        "then" A_(i j) = B_(j i)
    $
]) <transpose_matrix_representation_theorem>

#definition(title: "matrix transpose", [
    let $A in F^(m times n)$, then *transpose* of $A$ is $A^t in F^(n times m)$ defined as $A^t_(i j) = A_(j i)$
]) <matrix_transpose_definition>

#theorem([
    let $A in F^(m times n)$ , then row rank $A = $ column rank $A$
]) <row_column_rank_transpose_theorem>
