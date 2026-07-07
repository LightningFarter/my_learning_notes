#import "../math_variables_lib.typ": *

#let title = "Probability"
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

= The Natural Numbers

== The Peano Axioms

#axiom(title: "Peano Axioms", [
    we denote the *successor* of number $n$ as $S(n)$ \
    we denote the *define* notation as $:=$ \
    let $bb(N)$ be the set of *natural number*
    + $0 in bb(N)$
    + $tack n in bb(N) -> S(n) in bb(N)$
    + $forall n in bb(N) s0 (S(n) != 0)$
    + $forall n, m in bb(N) s0 ((n != m) -> (S(n) != S(m)))$
    + let $P(n)$ be any property of $n in bb(N)$, $tack (P(0) and P(n)) -> P(S(n)) => s0 tack forall n in bb(N) s0 P(n)$
]) <peano_axioms>

