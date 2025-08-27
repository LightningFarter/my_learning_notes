#let course = "Linear Algebra"
#let author = "Jason Chang"
#let email = "jason5738867@gmail.com"

#let show-solutions = true

#let current-chapter-title() = context {
    let head = query(heading.where(level: 1).before(here()))
    if head != () { head.last().body }
}

#set heading(numbering: "1.1.1")

#set page(
    paper: "a4",
    margin: (top: 2.2cm, bottom: 2.2cm, left: 2.2cm, right: 2.2cm),
    header: context [
        #align(center)[
            #course Note
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

#let col-thm = blue
#let col-def = green.darken(15%)
#let col-ex  = orange
#let col-rem = gray
#let col-sol = teal

#let lightfill(c, body) = box(
    fill: luma(98%),
    stroke: 1pt + c,
    radius: 6pt,
    inset: 10pt,
    width: 100%,
    body,
)

#let c-ch  = counter("ch")
#let c-thm = counter("thm")
#let c-lem = counter("thm")
#let c-prp = counter("thm")
#let c-cor = counter("thm")
#let c-def = counter("thm")
#let c-ex  = counter("ex")
#let c-exr = counter("exr")

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

#let make-env(kind, c: none, color: blue, title: none, body: content) = {
    if c != none { c.step() }
    block[#lightfill(color, [
        *#kind* #if c != none {context [#c-ch.display("1").#c.display("1")]}
        #if title != none {[*-- #title*]}:

        #body
    ])]
}

#let theorem(title: none, body) = make-env("Theorem", c: c-thm, color: col-thm, title: title, body: body)
#let lemma(title: none, body) = make-env("Lemma", c: c-lem, color: col-thm, title: title, body: body)
#let proposition(title: none, body) = make-env("Proposition", c: c-prp, color: col-thm, title: title, body: body)
#let corollary(title: none, body) = make-env("Corollary", c: c-cor, color: col-thm, title: title, body: body)
#let definition(title: none, body) = make-env("Definition", c: c-def, color: col-def, title: title, body: body)
#let example(title: none, body) = make-env("Example", c: c-ex, color: col-ex, title: title, body: body)
#let remark(title: none, body) = block(lightfill(col-rem, [
    *Remark* #if title != none {[*-- #title*]}:

    #body
]))

#let exercise(title: none, body) = make-env("Exercise", c: c-exr, color: col-ex, title: title, body: body)

#let solution(title: none, body) = {
    if show-solutions {
        make-env("Solution", color: col-sol, title: title, body: body)
    } else { [] }
}

#let thetxt(id) = context [ Theorem #counter("ch").at(id).first().#( counter("thm").at(id).first()+1 )]
#let lemtxt(id) = context [ Lemma #counter("ch").at(id).first().#( counter("thm").at(id).first()+1 )]
#let protxt(id) = context [ Proposition #counter("ch").at(id).first().#( counter("thm").at(id).first()+1 )]
#let cortxt(id) = context [ Corollary #counter("ch").at(id).first().#( counter("thm").at(id).first()+1 )]
#let deftxt(id) = context [ Definition #counter("ch").at(id).first().#( counter("thm").at(id).first()+1 )]
#let extxt(id) = context [ Example #counter("ch").at(id).first().#( counter("ex").at(id).first()+1 )]
#let exetxt(id) = context [ Exercise #counter("ch").at(id).first().#( counter("exr").at(id).first()+1 )]

#let theref(id) = link(id, thetxt(id))
#let lemref(id) = link(id, lemtxt(id))
#let proref(id) = link(id, protxt(id))
#let corref(id) = link(id, cortxt(id))
#let defref(id) = link(id, deftxt(id))
#let exref(id)  = link(id, extxt(id))
#let exeref(id) = link(id, exetxt(id))


#let proof(body) = block(lightfill(col-rem, [
    *Proof.* #body
    #align(right)[□]
]))

#let todo(text) = block(lightfill(red, [*TODO:* #text]))

#align(center)[
    #set text(size: 24pt, weight: "bold")
    #course Note

    #set text(size: 12pt)
    #author , #email
]

#let s0 = h(0.2cm)
#let h0 = h(0.5cm)
#let h1 = h(1cm)
#let h2 = h(1.5cm)
#let h3 = h(2cm)

#let suchthat = " such that "
#let mif = " if "
#let existsunique = $exists excl s0$

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
    a matrix is said to be *elementary matrix* if it could be obtainable by Identity matrix through a series of
    elementary row operations
]) <elementary_matrix_definition>

#theorem([
    let $e$ be elementary row operation, and $bold(E) = e(bold(I))$ then for every $bold(A)_(m times n)$, #s0 $e(bold(A)) = bold(E A)$
]) <elementary_row_operation_matrix_equivalence_theorem>

#corollary([
    let $bold(A), bold(B) in F^(m times n)$ then $bold(B)$ is row-equivalent to $bold(A)$ iff $bold(B = P A)$ where $bold(P)$
    is product of a series of elementary row operation
]) <row_equivalent_elementary_row_operation_corollary>

== Invertible Matrix

#definition([
    let $bold(A), bold(B) in F^(n times n)$ if $bold(A B = I)$, $bold(A)$ is the *left inverse* of $bold(B)$ and $bold(B)$
    is the *right inverse* of $bold(A)$, if $bold(A B = B A = I)$ then it is a *two-sided inverse* and $bold(A)$ is said to be invertible
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
    let $V$ be a vector space over field $F$, the subspace $W$ over field $F$ is a subset of $V$ which itself is a vector space
    with the same operators
]) <subspace_definition>

#theorem([
    a non-empty subset $W$ of $V$ is a subspace of $V$ over field $F$ iff $s0 forall alpha, beta in W, s0 c in F, s0 c alpha + beta in W$
]) <subspace_definition_equivalence_theorem>

a *Hermitian matrix* is a square matrix over complex number where 
$A_(j k) = overline(A_(k j))$

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
    let $S$ be a set of vectors in a vector space $V$, the *subspace spanned by *$S$ is intersection of all subspace $W$ of $V$
    which contains $S$ \
    if $S$ is a finite set where $S = { alpha_1, dots, alpha_n }$ then $W$ is called *subspace spanned by * vectors $alpha_1, dots, alpha_n$
]) <subspace_spanning_definition>

#theorem([
    the subspace spanned non-empty subset $S$ of vector space $V$ is the set of all linear combination of 
    vectors in $S$
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
    let $W$ be subspace of finite-dimensional vector space $V$, every linear independent subset of $W$ 
    is finite and part of a basis of $W$ 
]) <subset_of_subspace_is_in_basis_theorem>

#corollary([
    if $W$ is a proper subspace of a finite-dimensional vector space $V$, then $W$ is finite-dimensional
    and $dim W < dim V$
]) <dimension_relation_proper_subspace_corollary>

#corollary([
    for every finite-dimensional vector space $V$, a linear independent subset is part of its basis
]) <linear_independent_subset_basis_corollary>

#corollary([
    let $bold(A) in F^(n times n)$ has its row vectors linear independent, then $bold(A)$ is invertible
]) <row_vector_independence_invertible_matrix_corollary>

#theorem([
    if $W_1 , W_2$ are subspaces of finite-dimensional vector space $V$ then $W_1 + W_2$ are finite-dimensional
    and $dim W_1 + dim W_2 = dim (W_1 inter W_2) + dim (W_1 + W_2)$
]) <dimension_of_sum_subspaces_theorem>




// #lorem(50)

// #theorem(title: lorem(3), [
//     #lorem(100)
// ])

// #lemma(title: lorem(3), [
//     #lorem(100)
// ])

// #proposition(title: lorem(3), [
//     #lorem(100)
// ])

// #definition(title: lorem(3), [
//     #lorem(100)
// ])

// #example(title: lorem(3), [
//     #lorem(100)
// ])

// #remark(title: lorem(3), [
//     #lorem(100)
// ])

// #exercise(title: lorem(3), [
//     #lorem(100)
// ])

// #solution(title: lorem(3), [
//     #lorem(100)
// ])

// #proof([
//     #lorem(30)
// ])

// #todo([
//     #lorem(3)
// ])

// = Chapter 2 #lorem(7)

// #example(title: lorem(3), [
//     #lorem(100)
// ])

// #example(title: lorem(3), [
//     #lorem(100)
// ])