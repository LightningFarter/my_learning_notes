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

= Events and their Probabilities

== Events as Sets

#definition(title: "sample space", [
    let $A$ be some event
    - the chain of circumstances that leads to occurence or non-occurence of $A$ is an *experiment* or *trail*
    - the result of an experiment is *outcome* or *elementary event*
    - the set of all possible outcomes of an experiment is the *sample space* deonted as $Omega$
]) <sample_space_definition>

#definition(title: "events", [
    let $Omega$ be sample space, then event $A subset Omega$
    - the *complement* of $A$ of $Omega$ is $A^c = {B in Omega | B in.not A}$
    - $emptyset subset Omega$ is the *impossible event*
    - $Omega subset Omega$ is the *certain event*
]) <events_definition>

#definition(title: "field", [
    let $Omega$ be sample space, let $cal(F) subset 2^Omega$, then $cal(F)$ is a field if
    + $(forall A, B in cal(F)) s0 A union B in cal(F) s0 and s0 A inter B in cal(F)$
    + $(forall A in cal(F)) s0 A^c in cal(F)$
    + $emptyset in cal(F)$

    $cal(F)$ is a *$sigma$-field* if
    + $(forall A_1, A_2, dots in cal(F)) s0 op(union.big)_(i = 1)^infinity A_i in cal(F)$
    + $(forall A in cal(F)) s0 A^c in cal(F)$
    + $emptyset in cal(F)$
]) <field_definition>

#example([
    the smallest $sigma$-field associated with $Omega$ is $cal(F) = {emptyset, Omega}$

    let $A subset Omega$, then $cal(F) = {emptyset, A, A^c, Omega}$ is a $sigma$-field
]) <example_sigma_field>
