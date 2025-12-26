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

== Probability

#definition(title: "number of occurence", [
    let $Omega$ be sample space of experiment, let $A subset Omega$ be event, let experiment repeats $N$ times, then denote *number of occurence* of $A$ be $N(A)$, such that $0 <= N(A) / N <= 1$, which $N(A) / N$ may be an approximation of probability of event $A$ denoted as $bb(P)(A)$
]) <number_of_occurence_definition>

#lemma([
    let $Omega$ be sample space, let $A, B subset Omega in.rev A inter B = emptyset$, let experiment repeats $N$ times, then
    + $N(emptyset) = 0$ and $bb(P)(emptyset) = 0$
    + $N(Omega) = N$ and $bb(P)(Omega) = 1$
    + $N(A union B) = N(A) + N(B)$ and $bb(P)(A union B) = bb(P)(A) + bb(P)(B)$
    let $A_1, dots, A_n subset Omega$ be disjoint events, then
    $
        bb(P) (Union_(i = 1)^n A_i) = sum_(i = 1)^n bb(P)(A_i)
    $
]) <number_occurence_lemma>

#definition(title: "probability measure", [
    let $Omega$ be sample space, let $cal(F)$ be $sigma$-field, then the *probability measure* $bb(P)$ on $(Omega, cal(F))$ is a function \ $bb(P) : cal(F) -> [0, 1]$ that satisfies
    + $bb(P)(emptyset) = 0$ and $bb(P)(Omega) = 1$
    + let $A_1, A_2, dots in cal(F)$ such that $A_i inter A_j = emptyset$ for $i != j$, then $
        bb(P) (Union_(i = 1)^infinity A_i) = sum_(i = 1)^infinity bb(P)(A_i)
    $
    then $(Omega, cal(F), bb(P))$ is a *probability space*

    let $A in cal(F)$, then
    + if $bb(P)(A) = 0$ then $A$ is *null*
    + if $bb(P)(A) = 1$ then $A$ occurs *almost surely*
]) <probability_measure_definition>

let $Omega$ be sample space, then it is *fair* experiment if $bb(P)(A) = 1/(|Omega|) h0 forall A in Omega$

#lemma([
    let $(Omega, cal(F), bb(P))$ be a probability space, let $A, B in cal(F)$, then
    + $bb(P)(A^c) = 1 - bb(P)(A)$
    + if $B supset A$, then $bb(P)(B) = bb(P)(A) + bb(P)(B \\ A) >= bb(P)(A)$
    + $bb(P)(A union B) = bb(P)(A) + bb(P)(b) - bb(P)(A inter B)$
    + let $A_1, dots, A_n in cal(F)$ be disjoint, then $
        bb(P)(Union_(i = 1)^n A_i) = sum_(i = 1)^n bb(P)(A_i) - sum_(i < j) bb(P)(A_i inter A_j) dots + (-1)^(n + 1) bb(P)(A_1 inter dots inter A_n)
    $
]) <probability_inclusion_exclusion_lemma>

#lemma([
    let $(Omega, cal(F), bb(P))$ be a probability space, let $A_1 subset A_2 subset dots subset Omega$ each $A_1, A_2, dots in cal(F)$, then let limit
    $
        & A = Union_(i = 1)^infinity A_i = lim_(i -> infinity) A_i \
        => & bb(P)(A) = lim_(i -> infinity) bb(P)(A_i)
    $
    similarly, let $B_1, B_2, dots in cal(F)$ such that $B_1 supset B_2 supset dots supset emptyset$, then
    $
        & B = Inter_(i = 1)^infinity B_i = lim_(i -> infinity) B_i \
        => & bb(P)(B) = lim_(i -> infinity) bb(P)(B_i)
    $
]) <probability_limit_set_union_intersection_lemma>

