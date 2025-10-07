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

#exercise([
    + prove if two homogeneous of linear equation in two unknowns have same solution, they are equivalent
    + prove each subfield of complex number contains every rational number
    + prove each field of characteristic $0$ contains  rational number field
]) <exercise_linear_equations>

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

#exercise([
    + prove interchange of two rows can be acomplished by a finite series of other two type of row operations
]) <exercise_row_operations>

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

#exercise([
    + an *upper-triangular* matrix is $A in F^(n times n) mif A_(i j) = 0, forall i > j$, prove an upper-triangular matrix has no $0$ entries in diagonal iff it is invertible
    + let $A in F^(m times n), B in F^(n times m), s0 n < m$ prove $A B$ is not invertible
    + prove there is a finite series of row and column operations such that any matrix $A$ can be transformed into $R = P A Q$, where $R$ is both a row-reduced echelon and column-reduced echelon matrix
    + prove *Hilbert matrics* $H$ is invertible and $H^(-1)$ has all integer entries
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

a *Hermitian matrix* is a square matrix over complex number where $A_(j k) = overline(A_(k j))$ or $A = A^*$

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

#exercise([
    + prove that $A in F^(m times n)$ has dimension $m n$ by exhibiting its standard basis
    + prove $V$ a vector space of $bb(Q)$ representing $bb(R)$ is not finite-dimensional 
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

#exercise([
    + prove that $(W_1 + W_2)^0 = W_1^0 inter W_2^0$
    + prove that $(W_1 inter W_2)^0 = W_1^0 + W_2^0$
]) <exercise_linear_functionals>

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

#pagebreak()

= Polynomials

== Algebras

#definition(title: "Linear Algebra", [
    let $F$ be a field, a *linear algebra* over field $F$ is a vector space $cal(A)$ over field $F$ with additional *multiplication* operator for each pair of $alpha, beta in cal(A)$, where $alpha beta$ is the *product*, such that
    + $alpha (beta gamma) = (alpha beta) gamma$
    + $alpha (beta + gamma) = alpha beta + alpha gamma h0 (alpha + beta) gamma = alpha gamma + beta gamma$
    + $c (alpha beta) = (c alpha) beta = alpha (c beta), h0 c in F$
    if $exists s0 1 in cal(A) suchthat 1 alpha = alpha 1 = alpha, s0 alpha in cal(A)$ then $cal(A)$ is *linear algebra with identity* \
    if $alpha beta = beta alpha h0 alpha, beta in cal(A)$ then $cal(A)$ is *commutative linear algebra*
]) <linear_algebra_definition>

== The Algebra of Polynomials

#definition(title: "polynomial", [
    let $F[x]$ be a subspace of $F^infinity$ spanned by vectors $1, x, x^2, dots$, then $F[x]$ is *polynomial* over $F$
]) <polynomial_definition>

let $f$ be polynomial such that $f = sum_(i=0)^infinity c_i x^i$, if $c_n = 1$ and $c_k = 0 s0 forall k > n$ then, $deg f = n$\
if $deg f = n, s0 c_n = 1$, then $f$ is *monic polynomial* \
if $deg f = 0$, then $f$ is *scalar polynomial*

#theorem([
    let $f, g$ be non-zero polynomials over field $F$
    + $f g$ is non-zero polynomial
    + $deg (f g) = deg f + deg g$
    + $f, g$ be monic polynomial $=> f g$ be monic polynomial
    + $f, g$ be scalar polynomial $<=> f g$ be scalar polynomial
    + if $f + g != 0$ then $deg (f + g) <= max (deg f, deg g)$
]) <polynomial_degree_theorem>

#corollary([
    the set of all polynomials over field $F$ is a commutative linear algebra
]) <polynomial_linear_algebra_corollary>

#corollary([
    if $f, g, h in F[x] suchthat f != 0, s0 f g = f h$ then $g = h$
]) <polynomial_cancelation_corollary>

#definition([
    let $cal(A)$ be a linear algebra with identity over field $F$, identity denoted as $1$ and set $alpha^0 = 1 s0 forall alpha in cal(A)$ and
    $
        "for each" f = sum_(i=0)^n f_i x^i \
        "define" f(alpha) = sum_(i=0)^n f_i alpha^i
    $
]) <polynomial_association_definition>

#theorem([
    let $cal(A)$ be linear algebra with identity over field $F$, let $f, g in F[x]$, let $alpha in cal(A)$, and $c in F$, then
    + $(c f + g) (alpha) = c f(alpha) + g(alpha)$
    + $(f g) (alpha) = f(alpha) g(alpha)$
]) <linear_algebra_polynomial_linearlity_theorem>

== Lagrange Interpolation

let $V in F[x]$ and $F$ be a field \
*Lagrange interpolation forula* is as form
$
    f = sum_(i=0)^n f(t_i) P_i, h0 f in V, h0 t_i in F \
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

if $f in F[x]$ is polynomial let polynomial functions denoted as $f^~ in L(F[x], F)$

#definition([
    let $F$ be a field, let $cal(A), cal(A)^~$ be linear algebras over $F$, then $cal(A) tilde.equiv cal(A)^~$ if there is a bijection $alpha -> alpha^~$ of $cal(A) -> cal(A)^~$ such that
    + $(c alpha + d beta)^~ = c alpha^~ + d beta^~$
    + $(alpha beta)^~ = alpha^~ beta^~$
    for $c, d in F, s0 alpha, beta in cal(A)$\
    the mapping is called an *isomorphism* of $cal(A)$ onto $cal(A)^~$
]) <polynomial_functions_isomorphism_definition>

#theorem([
    if $F$ contains infinite number of distinct elements,\
    then $f -> f^~$ is an isomorphism of $F[x] -> L(F[x], F)$
]) <polynomial_functions_isomorphism_theorem>

== Polynomial Ideals

#lemma([
    let $f, d in F[x]$ be non-zero, such that $deg d <= deg f$, then $exists g in F[x] suchthat$
    $
        f - d g = 0 s0 or s0 deg(f - d g) < deg f
    $
]) <degree_reduce_lemma>

#theorem([
    let $f, d in F[x], s0 d != 0$ then, $existsunique q, r in F[x]$ where
    + $f = d g + r$
    + $r = 0 s0 or s0 deg r < deg d$
]) <polynomial_division_theorem>

#definition(title: "polynomial division", [
    let $f, d in F[x], s0 d != 0$, let $q in F[x] suchthat f = d q$ then
    - $d$ *divides* $f$
    - $f$ is *divisible* by $d$
    - $f$ is *multiple* of $d$
    - $q$ is *quotient* of $f, d$, denoted as $q = f / d$
]) <polynomial_division_definition>

#corollary([
    let $f in F[x], s0 c in F$ then $f$ is divisible by $x - c$ iff $f (c) = 0$
]) <divisible_corollary>

#definition(title: "root of polynomial", [
    let $F$ be a field, $c in F, f in F[x]$ then $c$ is a *root* or *zero* of $f$ if $f(c) = 0$
]) <polynomial_root_definition>

#corollary([
    a polynomial $f$ of degree $n$ has at most $n$ roots in $F$ 
]) <polynomial_root_bound_corollary>

#theorem(title: "Taylor's Formula", [
    let $F$ be a field of characteristic $0$, $c in F, s0 n in N, s0 n > 0, s0 f in F[x], s0 deg f <= n$ then
    $
        f = sum_(k = 0)^n (D^k f)/(k !) (c) (x - c)^k
    $
]) <taylor_formula_theorem>

let $c in F, f in F[x]$, the *multiplicity* of $c$ as a root of $f$ is the largest $r in N suchthat f = (x - c)^r g$ for some $g in F[x]$

#theorem([
    let $F$ be a field of characteristic $0$, $f in F[x], deg f <= n, c in F$, $c$ is a root of $f$ of multiplicity  $r$ iff
    $
        (D^k f)(c) = 0 h0 1 <= k <= r - 1 \
        (D^r)(c) != 0
    $ 
]) <multiplicity_differentiation_theorem>

#definition(title: "Ideal", [
    let $F$ be a field, an *ideal* of $F[x]$ is a subspace $M$ such that
    $
        f g in M h0 forall f in F[x], s0 g in M
    $
]) <ideal_definition>

let $d in F[x]$ then $d F[x]$ is *principal ideal generated by* $d$ \
let $d_1, dots, d_n in F[x]$ then $d_1 F[x] + dots + d_n F[x]$ is ideal *generated* by $d_1, dots, d_n$

#theorem([
    let $F$ be a field, $M$ be any non-zero ideal in $F[x]$, then $existsunique d in F[x]$ be monic polynomial such that $M$ is principal ideal generated by $d$
]) <monic_principal_ideal_theorem>

#corollary([
    let $F$ be a field, if $p_1, dots, p_n in F[x]$ not all $0$, $existsunique d in F[x]$ be monic where
    + $d$ is the ideal generated by $p_1, dots, p_n$
    + $d$ divides each of $p_i$
    + $d$ is divisible by any $g$ that $g$ divides all $p_i$ 
]) <monic_principal_ideal_corollary>

#definition(title: "polynomial GCD", [
    let $F$ be a field, $p_1, dots, p_n in F[x]$ not all $0$ \
    then monic polynomial $d$ generated by ideal $p_1 F[x] + dots + p_n F[x]$ is called *greatest common divisor* of $p_1, dots, p_n$ \
    $p_1, dots, p_n$ are *relatively prime* if $d = 1$ or $p_1 F[x] + dots + p_n F[x] = F[x]$
]) <polynomial_GCD_definition>

#exercise([
    + prove if $F$ is a field, then any intersection of ideals of $F[x]$ is a ideal
    + let $K$ be a subfield of $F$ then prove ideal in $K$ has same monic generator as ideal in $F$
]) <exercise_ideal>

== The Prime Factorization of a Polynomial

#definition(title: "prime and irreducible polynomials", [
    let $F$ be a field, then $f in F[x]$ is *reducible over* $F$ if $exists g, h in F[x]$ which $deg g >= 1, deg h >= 1$ such that $f = g h$, otherwise $f$ is *irreducible over* $F$ \
    A non-scalar irreducible polynomial over $F$ is called a *prime polynomial over* $F$, or *prime* in $F[x]$
]) <prime_irreducible_polynomial_definition>

#theorem([
    let $F$ be a field, $p, f, g in F[x]$, if $p$ is prime, and $p$ divides $f g$ then either $p$ divides $f$ or $p$ divides $g$
]) <prime_divide_factor_theorem>

#corollary([
    continue by #theref(<prime_divide_factor_theorem>), let $f_1, dots, f_n in F[x]$ and $p$ divides $f_1 dots f_n$ then $p$ divides at least one of $f_1, dots, f_n$
]) <prime_divide_factor_corollary>

#theorem([
    let $F$ be a field, $f in F[x]$ be monic can be factorized into a product of monic prime polynomials in one unordered form
]) <polynomial_prime_factorization_theorem>

#theorem([
    let $F$ be a field, let $f in F[x]$ be monic and let $f = p_1^(n_1) dots p_k^(n_k)$ be prime factorization and let
    $
        f_j = f / p_j^(n_j) = product_(i != j) p_i^(n_i) h0 1 <= j <= k
    $
    then $f_1, dots, f_k$ are relatively prime
]) <polynomial_factor_exclude_theorem>

#theorem([
    let $F$ be a field, $f in F[x]$ is product of distinct prime iff $p$ is relatively prime to $p'$ which is the formal derivative
]) <formal_derivative_prime_polynomial_theorem>

#definition(title: "algebraically closed", [
    a field $F$ is *algebraically closed* if $deg p = 1 s0 forall p in F[x]$ be prime
]) <algebraically_closed_definition>

#exercise([
    let $f, g, p in F[x]$ then if $f - g | p$ then $f$ is *congruent to* $g$ *modulo* $p$ denoted as $f equiv q mod p$
    + prove congruence is equivalence relation, thus is reflexive, symmetric, and transitive
]) <exercise_prive_factor_polynomial>

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
    + let $D$ be $n$-linear alternating function over commutative ring $K$ with identity, then
        + $D(A) = 0$ if $A$ has an empty row
        + $D(B) = D(A)$ if $B$ can be obtained by multiple and add row operation
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

== Additional Properties of Determinants

let $A in F^(r times r), C in F^(s times s), B in F^(r times s)$ then
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

#remark([
    + let $A in F^(n times n) mif A^t = -A$ then $A$ is *skew-symmetric* then if $n$ is odd, $det A = 0$
    + let $A in F^(n times n) mif A A^t = I$ then $A$ is *orthogonal* then $det A = plus.minus 1$
    + let $A in F^(n times n) mif A A^* = I$ then $A$ is *unitary* then $| det A | = 1$
    + the *determinant rank* of $A in F^(n times n)$ is the largest $r$ such that $det A_r != 0$ where $A_r in F^(r times r)$ a submatrix of $A$, determinant rank is equal to row/column rank
])

#exercise([
    + let $V$ be a vector space over field $F$, $B in F^(n times n)$, set $L_B : V -> V$ where $L_B(A) = B A$, same, $R_B : V -> V$ where $R_B(A) = A B$ then show that
        - $det L_B = (det B)^n$
        - $det R_B = (det B)^n$
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
    let $L in M^r (V)$, $U in M^s (V)$ define function $L times.circle U in M^(r+s) (V)$ by
    $
        (L times.circle U) (alpha_1, dots, alpha_(r+s)) = L(alpha_1, dots, alpha_r) U(alpha_(r + 1), dots, alpha_(r+s))
    $
    then $L times.circle U$ is the *tensor product* of $L$ and $U$, which is not commutative
]) <tensor_product_definition>

#lemma([
    let $L_1, L in M^r (V)$, let $U_1, U in M^s (V)$, let $N in M^t (V)$, let $c in K$ then
    + $(c L_1 + L) times.circle U = c (L_1 times.circle U) + L times.circle U$
    + $L times.circle (c M_1 + M) = c (L times.circle U_1) + L times.circle U$
    + $(L times.circle U) times.circle N = L times.circle (U times.circle N)$
]) <tensor_product_distributive_lemma>

#lemma([
    let $L_1, dots, L_k$ be multilinear functions on $V^(r_1), dots ,V^(r_n)$ ,then tensor product 
    $
        L := L_1 times.circle dots times.circle L_n
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
        f_(j_1) times.circle dots times.circle f_(j_r) h0 1 <= j_1 <= n, dots, 1 <= j_r <= n
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
        L(T alpha_1, dots, T alpha_n) = c L(alpha_1, dots, alpha_n) h0 forall "alternating" L in M^n (V)
    $
]) <determinant_rank_corollary>

we can denote $D_J (alpha_1, dots, alpha_r)$ for $J$ the $r$-shuffle, $D$ the determinant of $r times r$ matrix as
$
    D_j (alpha_1, dots, alpha_r) = (partial (alpha_1, dots, alpha_r)) / (partial (beta_j_i, dots, beta_j_r)) \
    "then" L(alpha_1, dots, alpha_r) = sum_(j_1 < dots < j_r) (partial (alpha_1, dots, alpha_r)) / (partial (beta_j_i, dots, beta_j_r)) L(beta_j_i, dots, beta_j_r)
$

== The Grassman Ring

#definition(title: "exterior product of field", [
    let $F$ be a field of characteristic $0$, $V$ be a vector space, then define *exterior product* or *wedge product* of $L in M^r (V)$, $U in M^s (V)$ by
    $
        L and U = 1 / (r ! s !) pi_(r+s) (L times.circle M)
    $
]) <field_exterior_product_definition>

let $I = (i_1, dots, i_r)$ a $r$-shuffle, $J = (j_1, dots, j_s)$ a "s"-shuffle, assume
$
    i_1 < dots < i_r < j_1 < dots < j_s
$
and set $E_I = f_i_1 times.circle dots times.circle f_i_r$, $E_J = f_j_1 times.circle dots times.circle f_j_s$, let determinant $D_I = pi_r (E_I)$ and $D_J = pi_s (E_J)$ then
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
    define $psi (sigma) = (sign sigma)(L times.circle M)_sigma$ let $G = S_r plus.circle S_({r+1, dots, r+s})$ then define $tilde(psi) (tau G) = psi (tau)$ for $tau in S_(r+s)$ then let $H = tau G$ define
    $
        L and M = sum_H tilde(psi) (H)
    $
]) <commutative_ring_with_identity_exterior_product_definition>

$
    L and M = sum_sigma (sign sigma) (L times.circle M)_sigma => r! s! L and M = pi_(r+s) (L times.circle M)
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
        Lambda (V) = Lambda^0 (V) plus.circle Lambda^1 (V) plus.circle dots plus.circle Lambda^n (V)
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
    let $F$ be a field, $V$ be a vector space over $F$, $T in L(V, V)$, $alpha in V$ then a *characterisitc value* of $T$ is $c in F suchthat T alpha = c alpha$
    + any $alpha in V suchthat T alpha = c alpha$ is called *characteristic vector* of $T$ associated with $c$
    + $W = {alpha in V | alpha T = c alpha}$ is *characteristic space* associated with $c$
]) <characteristic_value_definition>

#theorem([
    let $V$ be a vector space over field $F$, $T in L(V, V)$, $c in F$ then the followings are equivalent
    + $c$ is a characteristic value of $T$
    + the operator $(T - c I)$ is singular
    + $det (T - c I) = 0$
]) <characteristic_singular_det_equivalent_theorem>

#definition(title: "characteristic value for matrix", [
    let $A in F^(n times n)$, then a *characteristic value of $A$ in $F$* is $c in F$ such that $(A - c I)$ is singular

    the polynomial $f(x) = det (x I - A)$ is the *characteristic polynomial*
]) <characteristic_value_matrix_definition>

#lemma([
    similar matrices have the same characteristic polynomial
]) <characteristic_poly_similar_eq_lemma>

#definition(title: "diagonalizable", [
    let $V$ be a finite-dimensional vector space, $T in L(V, V)$, then $T$ is *diagonalizable* if $exists cal(B) suchthat [T]_cal(B) = diag (c_1, dots, c_n)$ where $cal(B)$ is a basis formed by characteristic vectors of $T$ and $c_i$ are characteristic values of $T$
]) <diagonalizable_definition>

#lemma([
    if $T alpha = c alpha$ then $f(T) alpha = f(c) alpha s0 forall f in F[x]$
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

== Annihilating Polynomials

#definition(title: "minimal polynomial of linear operator", [
    let $V$ be a finite-dimensional vector space over field $F$, let $T in L(V, V)$, a *minimal polynomial* for $T$ is the unique monic generator of the ideal of polynomial $p in F[x]$ such that $p$ annihilate $T$
]) <minimal_polynomial_linear_operator_definition>

#theorem([
    let $V$ be a $n$-dimensional vector space, let $T in L(V, V)$, then the characteristic and minimal polynomials of $T$ have the same roots, excepts for multiplicities 
]) <characteristic_minimal_poly_same_roots_theorem>

#theorem(title: "Cayley-Hamilton", [
    let $V$ be a finite-dimensional vector space, $T in L(V, V)$, if $f$ is the characteristic polynomial of $T$ then $f(T) = 0$\
    or say, minimal polynomial divides characteristic polynomial of $T$
]) <cayley_hamilton_theroem>

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

    thus $forall alpha in V, s0 S_T (alpha, W)$ is an ideal in $F[x]$
]) <invariant_subspace_polynomial_lemma>

#definition(title: "conductor generator", [
    the unique monic generator of $S_T (alpha, W)$ is also called *$T$-conductor of alpha into W*
]) <conductor_generator_definition>

#lemma([
    let $V$ be a finite-dimensional vector space over field $F$, let $T in L(V, V)$ where minimal polynomial $p$ is 
    $
        p = (x - c_1)^(r_1) dots (x - c_k)^(r_k) h0 c_i in F
    $
    let $W$ be a proper subset of $V$ where $T(W) subset W$ then $exists alpha in V$ sucht that
    + $alpha in.not W$
    + $(T - c I) alpha in W$ for some characteristic value $c$ of $T$ 
]) <expanding_invariant_subspace_lemma>

to be *triangulable* is to be able to find a basis $cal(B)$ for $T in L(V, V)$ such that $[L]_cal(B)$ is a triangular matrix

#theorem([
    let $V$ be a finite-dimensional vector space over field $F$, let $T in L(V, V)$, then $T$ is triangulable iff minimal polynomial of $T$ is products of linear polynomials
]) <linear_operator_triangulable_linear_poly_theorem>

#corollary([
    let $F$ be an algebraically closed, then every $A in M_(n times n)(F)$ is triangulable
]) <algebraically_closed_triangulable_corollary>

#theorem([
    let $V$ be a finite-dimensional vector space over field $F$, let $T in L(V, V)$, then $T$ is diagonalizable iff minimal polynomial $p$ of $T$ is product of 
    $
        p = (x - c_1) dots (x - c_k) h0 c_i in K "be distinct"
    $
]) <diagonalizable_minimal_polynomial_factor_theorem>

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
    let $V$ be a finite-dimensional vector space over field $F$, let $cal(F)$ be commuting family of triangulable linear operations on $V$, then exists $cal(B)$ be an ordered basis that $forall T in cal(F), s0 [T]_cal(B)$ is triangular matrix
]) <simultaneous_triangulation_theorem>

#corollary([
    let $cal(F)$ be a comuting family of $n times n$ matrices over algebraically closed field $F$, then exists non-singular $P in F^(n times n)$ such that $P^(-1) A P$ is upper-triangular for all $A in cal(F)$
]) <similar_upper_triangular_algebraically_closed_corollary>

#theorem([
    let $cal(F)$ be a comuting family of diagonalizable linear operator on finite-dimensional space $V$, then there exists $cal(B)$ be an ordered basis that $forall T in cal(F), s0 [T]_cal(B)$ is diagonal matrix
]) <simultaneous_diagonalization_theorem>

