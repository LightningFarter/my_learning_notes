#import "@local/mylib:0.1.0": math_variables_lib
#import math_variables_lib: *

#let title = "DSDL Cheat Sheet"
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
    = Boolean Algebra

    == Simplication Theorems

    - $X Y + X Y' = X$
    - $(X + Y)(X + Y') = X$
    - $X + X Y = X$
    - $X(X + Y) = X$
    - $X + X' Y = X + Y$
    - $X(X' + Y) = X Y$
    - $X Y + X' Z + Y Z = X Y + X' Z$
    - $(X + Y)(X' + Z) = X Z + X' Y$

    == Terms
    
    - *implicant*: a product term
    - *prime implicant*: an implicant cannot be covered by other implicant
    - *cover*: a set of prime implicant covers all $1$s
    - *essential prime implicant*: if miniterm is covered by only one PI, then PI is essential

    == Basic Forms
    
    === 2 level circuits

    AND-OR $<->$ NAND-NAND $<->$ OR-NAND \ $<->$ NOR-OR

    === 2 level dengenerate

    - AND-AND, AND-NAND
    - OR-OR, OR-NOR
    - NAND-OR, NAND-NOR
    - NOR-AND, NOR-NAND

    === NAND & NOR

    - NAND-NAND, find minimum SOP
    - NOR-NOR, find minimum POS

    == Hazard

    === Static 1

    adjacent 1s are not covered in K-map by same loop

    === Static 0

    adjacent 0s differ in value of $X$ when $alpha = 1$

    === Dynamic Hazard

    adjacent input differ in value of $X$ when $alpha = 1$ and propagate over $3$ different paths 
]

