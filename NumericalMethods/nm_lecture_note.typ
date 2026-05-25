#import "@local/mylib:0.1.0": math_variables_lib
#import math_variables_lib: *

#let title = "Numerical Methods Note"
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

= Floating Point Systems

== Floating Point Representation

#definition(title: "Normalized Floating Point Number", [
    let $x$ be *normalized floatining point number* with base $beta$, precision $p$, exponent $e$, then $x$ has form
    $
        x = plus.minus (d_0 . d_1 d_2 d_3 dots d_(p - 1) )_beta times beta^e \
        "where" 1 <= d_0 <= beta - 1 h0 0 <= d_i <= beta - 1 \
        "and" e_min <= e <= e_max
    $
    where $e_min$ is the *minimum expressible exponent*, and $e_max$ is the *maximum expressible exponent* 
]) <normalized_floating_point_number_definition>

#proposition(title: "IEEE Standard", [
    $beta$ = 2, hence normalized number $x$ with mantissa $f$, exponent $e$ would be
    $
        x = plus.minus 1.f times 2^e
    $
    the initial $1$ is the *hidden bit*
]) <ieee_standard_floating_point_expressions_proposition>

#definition(title: "unit of last precision", [
    let $x$ be number fo base $beta$, precision $p$, exponent $e$, then *ulp* of $x$ stands for the *unit of last precision*
    $
        "ulp" = beta^(e - p + 1)
    $
]) <ulp_definition>

== Rounding and Basic Error Model

