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
#let c-lem = counter("lem")
#let c-prp = counter("prp")
#let c-cor = counter("cor")
#let c-def = counter("defn")
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
#let corollary(title: none, body) = make-env("Corollary", c: c-col, color: col-thm, title: title, body: body)
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
#let lemtxt(id) = context [ Lemma #counter("ch").at(id).first().#( counter("lem").at(id).first()+1 )]
#let protxt(id) = context [ Proposition #counter("ch").at(id).first().#( counter("prp").at(id).first()+1 )]
#let cortxt(id) = context [ Corollary #counter("ch").at(id).first().#( counter("cor").at(id).first()+1 )]
#let deftxt(id) = context [ Definition #counter("ch").at(id).first().#( counter("defn").at(id).first()+1 )]
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
    1. $e(bold(A))_(i j) = bold(A)_(i j) h0 mif i eq.not r h0 e(bold(A))_(r j) = c bold(A)_(r j)$
    2. $e(bold(A))_(i j) = bold(A)_(i j) h0 mif i eq.not r h0 e(bold(A))_(r j) = bold(A)_(r j) + c bold(A)_(s j)$
    3. $e(bold(A))_(i j) = bold(A)_(i j) h0 mif i eq.not r and i eq.not s h0 e(bold(A))_(r j) = bold(A)_(s j) h0 e(bold(A))_(s j) = bold(A)_(r j)$
]) <elementary_row_operation_definition>

#theorem([
    $
        "let" E "be set of all elementary row operations" \
        forall e in E s0 exists s0 e' in E suchthat e'(e(bold(A))) = e(e'(bold(A))) = bold(A)
    $
]) <elementary_row_operation_exists_inverse_theorem>

#definition(title: "Row-Equivalent", [
    for $bold(A), bold(B) in F_(m times n)$, $bold(B)$ is row-equivalent to $bold(A)$ if $bold(B)$ is obtainable from a series of elementary row operations from $bold(A)$
]) <row_equivalent_definition>

#theorem([
    if $bold(A), bold(B) in F_(m times n)$ are row-equivalent, then homogeneous system $bold(A) bold(X) = bold(0) h0 bold(B) bold(X) = bold(0)$ has exact same solution
]) <homogeneous_row_equivalent_theorem>

#definition(title: "Row-Reduced", [
    1. first non-zero entry in each non-zero row is equal to $1$
    2. column having some row's first non-zero entry must have all other entries $0$
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
    for $bold(R) in F_(m times n)$ to be row-reduced echelon:
    1. $bold(R)$ is row-reduced
    2. all row of full $0$ entries is below any non-zero row
    3. if there are $r$ non-zero rows in $R$, where the leading non-zero entry of row $i$ occurs in $k_i$, $i = 1, dots, r$ then $k_1 < k_2 < dots < k_r$
]) <row_reduced_echelon_definition>

#theorem([
    every $bold(A) in F_(m times n)$ is row-equivalent to a row-reduced echelon
]) <row_echelon_equivalence_theorem>

#theorem([
    for matrix $bold(A) in F_(m times n)$ if $m < n$ then $bold(A) bold(X) = bold(0)$ has non-trivial solution
]) <non_trivial_solution_homogeneous_theorem>

#theorem([
    a homogeneous equation $bold(A) bold(X) = bold(0)$ is row-equivalent to $bold(I)$ iff it has only trivial solution
]) <homogeneous_trivial_solution_identity_theorem>



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