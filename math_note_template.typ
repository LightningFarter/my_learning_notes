#import "math_variables_lib.typ": *

#let title = "Math Note Template"
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


////////////////////////////////////////
//            content below           //
////////////////////////////////////////


= #lorem(5)

== #lorem(7)

#lorem(50)

#theorem(title: lorem(3), [
    #lorem(10)
]) <lorem10_theorem>

#lemma(title: lorem(3), [
    #lorem(100)
])

#proposition(title: lorem(3), [
    #lorem(100)
])

#definition(title: lorem(3), [
    #lorem(100)
])

== #lorem(6)

#example(title: lorem(3), [
    #lorem(100)
])

#remark(title: lorem(3), [
    #lorem(100)
])

#exercise(title: lorem(3), [
    #lorem(100)
])

#solution(title: lorem(3), show-solutions: show-solutions, [
    #lorem(100)
])

#proof([
    #lorem(30)
])

#todo([
    #lorem(3)
])

= #lorem(7)

#example(title: lorem(3), [
    #lorem(100)
])

#example(title: lorem(3), [
    #theref(<lorem10_theorem>)\
    #lorem(100)
])