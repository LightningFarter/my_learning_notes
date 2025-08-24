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

#let c-thm = counter("thm")
#let c-lem = counter("lem")
#let c-prp = counter("prp")
#let c-cor = counter("cor")
#let c-def = counter("defn")
#let c-ex  = counter("ex")
#let c-exr = counter("exr")

#show heading.where(level:1): it => {
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
    lightfill(color, [
        *#kind* #if c != none {context [#c.display("1")]}
        #if title != none {[*-- #title*]}:

        #body
    ])
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

#pagebreak()

#outline(title: "Contents")

#pagebreak()

= Linear Equations

== Fields

Let $F$ be a field, must satisfy:

#definition([
    $ x + y = y + x  h1 forall x , y in F $
    $ x + (y + z) = (x + y) + z h1 forall x, y, z in F $
    $ exists excl s0 0 in F, suchthat x + 0 = x h1 forall x in F $
    $ forall x in F s0 exists s0 (-x), suchthat x + (-x) = 0 $
    $ x y = y x h0 forall x, y in F $
    $ x (y z) = (x y) z h0 forall x, y, z in F $
    $ exists excl s0 1 in F, suchthat x 1 = x h0 forall x in F $
    $ forall x eq.not 0, x in F, s0 exists s0 x^(-1), suchthat x x^(-1) = 1 $
    $ x (y + z) = x y + x z h0 forall x, y, z in F $
])

== Systems of Linear Equations

*Linear equations* has form of:

#example([
    $ A_(1 1) x_1 + A_(1 2) x_2 + dots + A_(1 n) x_n = y_1 $
    $ A_(2 1) x_1 + A_(2 2) x_2 + dots + A_(2 n) x_n = y_2 $
    $ dots.v h1 dots.v h3 h1 dots.v h1 dots.v $
    $ A_(m 1) x_1 + A_(m 2) x_2 + dots + A_(m n) x_n = y_m $
])

If $y_1 = y_2 = dots = y_m = 0$ is a solution, the system is *homogeneous*.

*Linear Combination* has form of:

#example([
    $ ( c_1 A_(1 1) + dots + c_m A_(m 1) ) x_1 + dots + (c_1 A_(1 n) + dots + c_m A_(m n) ) x_n = c_1 y_1 + dots + c_m y_m $
])

Linear equations are *equivalent* if each equation is linear combination of other in each system.

#theorem([
    Equivalent systems of linear equations have exactly the same solutions.
])





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