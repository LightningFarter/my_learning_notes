#import "../math_variables_lib.typ": *

#let title = "Abstract Algebra"
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

= Groups

== Monoids

#definition(title: "law of composition", [
    let $S$ be a set, the mapping $S times S -> S$ is *law of composition*, let $x, y in S$, then the value of the map of $(x, y)$ is $x y$, for commutative cases, we use *sum* which denoted as $x + y$
]) <law_of_composition_definition>

#definition(title: "associative", [
    let $S$ be a set equiped with law of composition, let $x, y, z in S$, if $(x y) z = x (y z)$ then the mapping is *associative*
]) <associative_definition>

#definition(title: "unit element", [
    let $S$ be a set equiped with law of composition, if $e in S in.rev e x = x e = x s0 forall x in S$, then $e$ is the *unit element* or *zero element* when mapping is a sum

    the unit element is unique if exists, since if $e, e' in S$ be unit, then $e = e e' = e' e = e'$ 
]) <unit_element_definition>

#definition(title: "commutative", [
    let $S, T$ be sets, let $f : S times S -> T$ be a map, to be *commutative* is that $f(x) = f(y) h0 forall x, y in S$
]) <commutative_definition>

#definition(title: "monoid", [
    a *monoid* is a set $G$ equiped with law of composition which is associative and there is a unit element in $G$, hence $G$ is not empty

    if the law of composition is commutative, then $G$ is commutative or *abelian*
]) <monoid_definition>

#theorem([
    let $G$ be monoid, let $x_1, dots, x_n in G$, $e in G$ be unit element, then
    $
        product_(mu = 1)^m x_mu dot product_(nu = m + 1)^n x_nu = product_(nu = 1)^n x_nu h0 0<= m < n
    $
    and 
    $
        product_(mu = 1)^0 x_mu = e
    $
]) <monoid_product_associative_theorem>

#theorem([
    let $G$ be commutative monoid, let $x_1, dots, x_n in G$, let $psi in S_n$, then
    $
        product_(nu = 1)^n x_(psi(nu)) = product_(nu = 1)^n x_nu
    $
]) <commutative_monoid_product_theorem>

#theorem([
    let $G$ be commutative monoid, let $I$ be a set, let $f : I -> G$ be map such that $f(i) = e$ for *almost all* $i in I$, (which means for all $i$ but finite number), let $I_0 = {i in I | f(i) != e}$, then
    $
        product_(i in I) f(i) = product_(i in I_0) f(i)
    $
]) <commutative_monoid_almost_all_identity_product_theorem>

#theorem([
    let $G$ be commutative monoid, let $I, J$ be set, let $f : I times J -> G$ be a map for almost all $(i, j) in I times J$ \ that $f(i, j) = e$, then
    $
        product_(i in I) (product_(j in J) f(i, j) ) = product_(j in J) (product_(i in I) f(i, j) )
    $
]) <commutative_monoid_map_interchange_theorem>

#definition(title: "product of subset of monoid", [
    let $G$ be a monoid, let $S, S' subset G$ be subset, then define the product $S S'$ as
    $
        S S' = { x y | x in S s0 y in S' }
    $
    and let $x in S$ define $x S'$ as ${x} S'$, such product maintains associative, let $S^'' subset G$, then \ $(S S') S'' = S (S' S'')$
]) <monoid_subset_product_definition>

#definition(title: "submonoid", [
    let $G$ be a monoid, let $H subset G$ such that $e in H$ and $forall x, y in H s0 x y in H$, then $H$ is a submonoid itself is an monoid
]) <submonoid_definition>

