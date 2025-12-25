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

== Groups

#definition(title: "inverse", [
    let $A$ be a set equiped with law of composition, let $a, b in A$, let $e in A$ be the unit element, if \ $a b = b a = e$, then $b$ is the inverse of $a$, such inverse is unique denoted as $a^(-1)$ or $-a$ depend on the operator

    note $(a^(-1))^n$ is denoted as $a^(-n)$
]) <inverse_definition>

#definition(title: "group", [
    let $G$ be a monoid, if $forall x in G s0 exists y in G in.rev x y = y x = e$, then $G$ is a *group*
]) <group_definition>

#theorem([
    let $G$ be a set with associative law of composition, let $e$ be left unit of the law, assume \ $forall x in G s0 exists y in G in.rev y x = e$, then $e$ is unit, each left inverse is inverse, and $G$ is a group
]) <all_left_inverse_eq_inverse_theorem>

#example([
    let $G$ be a group, let $S$ be non-empty set, the set of maps is $M(S, G)$, let $f, g in M(S, G)$, then define $(f g)(x) = f(x) g(x)$, then define $f^(-1)(x) = f(x)^(-1)$, then $M(S, G)$ is a group

    if $G$ is commutative, then $M(S, G)$ is commutative
]) <map_set_to_group_as_a_group_example>

#example([
    let $S$ be non-empty set, let $G = {f : S -> S | f "is bijective"}$, then unit of $G$ is the identity map, $G$ is the permutation group, also denoted as $"perm"(S)$
]) <permutation_as_a_group_example>

#example([
    let $bb(F)$ be a field, let $V$ be a vector space over $bb(F)$, let $"GL"(V)$ be set of invertible $bb(F)$-linear map onto $V$, then $"GL"(V)$ is a group under composition of map

    let $"GL"(n, bb(F))$ be set of $n times n$ invertible matrix of entries in $bb(F)$, then $"GL"(n, bb(F))$ is a group under matrix multiplication, not commutative when $n >= 2$
]) <invertible_linear_operator_matrix_as_a_group_example>

#example([
    a group $G$ is *cyclic* if $exists x in G in.rev forall y in G s0 exists n in bb(Z) in.rev y = x^n$, here $x$ is the *generator*

    the *$n$-th root of unity* of $1$ in $bb(C)$ is $e^(2 pi i \/ n)$, for $e^(2 pi i r \/ n)$ with $gcd(r, n) = 1$ is the cyclic generator, hence the *primitive $n$-th root of unity*
]) <cyclic_group_example>

#example([
    let $G_1, dots, G_n$ be group, define $G_1 times dots times G_n$ be set of $n$-tuple, let $x_1, y_1 in G_1, s0 dots, s0 x_n, y_n in G_n$, then define $(x_1, dots, x_n) (y_1, dots, y_n) = (x_1 y_1, dots, x_n y_n)$, then $G = product_i G_i$ is a group with identity $(e_1, dots, e_n)$, is called the *direct product* of the family $G_i$
]) <direct_product_group_example>

#definition(title: "subgroup", [
    let $G$ be a group, let $H subset G$ be a set, and if
    + $e in H$
    + $forall x, y in H s0 x y in H$
    + $forall x in H s0 exists x^(-1) in H in.rev x^(-1) x = x x^(-1) = e$
    then $H$ is a subgroup of $G$
]) <subgroup_definition>

#definition(title: "generator", [
    let $G$ be a group, let $S subset G$ be a set, then $S$ *generates* $G$ if
    $
        forall x in G s0 exists k_1, dots, k_r in bb(Z) in.rev x = x_1^(k_1) dots x_n^(k_n) h0 forall x_1, dots, x_n in S
    $
    then denote $G = chevron S chevron.r$ or $G = chevron x_1, dots, x_n chevron.r$, if $\#(S) = 1$ then $G$ is *cyclic group* and $x_1$ is *cyclic generator*
]) <generator_definition>

#example([
    the $2$ group of size $8$ are *group of symmetries of square* which is generated by $sigma, tau$ such that
    $
        sigma^4 = tau^2 = e h0 and h0 tau sigma tau^(-1) = sigma^3
    $
    the other is the *quaternion group* generated by $i, j$, let $k = i j$, and $m = i^2$, such that
    $
        i^4 = j^4 = k^4 = e h0 i^2 = j^2 = k^2 = m h0 i j = m j i
    $
]) <group_of_size_eight_example>

#definition(title: "homomorphism", [
    let $G, G'$ be monoids, the *monoid-homomorphism* or *homomorphism* of map $G -> G'$ is \ $f : G -> G'$ such that $f(x) f(y) = f(x y) s0 forall x, y in G$, if $G, G'$ are groups, then it is *group-homomorphism*

    if $G, G'$ be monoids, let $f, g$ be homomorphism, then if $f g = g f = I$ then $f, g$ are *isomorphisms*, then isomorphism is homomorphism with bijection denoted as $G tilde.equiv G'$

    if $G = G$ then it is an *automorphism*, a homomorphism into itself is an *endomorphism*
]) <homomorphism_definition>

#example([
    let $G$ be monoid, let $x in G$, let $bb(N)$ be monoid of natural numbers, then $f : bb(N) -> G$ is a map as $f(n) = x^n$ thus $x |-> x^n$ is a homomorphism called $n$-th *power map*
]) <power_map_homomorphism_example>

#example([
    let $G = product_i G_i$ be a direct product, then $f : G -> G_i$ be projection of $G$ to $G_i$ is an homomorphism
]) <direct_product_projection_homomorphism_example>

#theorem([
    let $G, G'$ be groups, let $S subset G$ be set of generators of $G$, let $f : S -> G'$, then $existsunique overline(f) : G -> G'$ such that $overline(f)|_S = f$ and $overline(f)$ is a homomorphism
]) <unique_homomorphism_generator_extension_map_theorem>

#definition(title: "embedding", [
    let $G, G'$ be groups, let $f : G -> G'$ be homomorphism, let $H' = ima f$ then $H' subset G'$ is subgroup, define $ker f = {x in G | f(x) = e'}$

    if $ker f = {e}$, then it is injective, and $f : G -> G'$ establishes $G tilde.equiv H'$ is an *embedding*, and denoted as $f : G arrow.hook G'$
]) <embedding_definition>

#proposition([
    let $G$ be a group, let $H, K subset G$ be subgroups such that $H inter K = {e}$ and $H K = G$ and \ $x y = y x s0 forall x in H s0 forall y in K$, then $H times K -> G$ such that $(x, y) |-> x y$ is an isomorphism
]) <disjoint_product_isomorphism_proposition>

#definition(title: "coset", [
    let $G$ be a group, let $H subset G$ be a group, then *left coset* of $H$ in $G$ is $a H in.rev a in G$, then element of $a H$ is *coset representative* of $a H$, and map $x |-> a x$ is an bijection of $H -> a H$, hence $H, a H$ have same cardinality

    *right cosets* are defined similarly as $H a$

    the numbers of left cosets is denoted as $(G : H)$ called *index* of $H$ in $G$, $(G : 1)$ is the *order* of $G$
]) <coset_definition>

#corollary([
    let $G$ be a group, let $H subset G$ be subgroup, let $a, b in G$, then if $a H inter b H != emptyset$, then $a H = b H$
]) <coset_disjoint_intersection_eq_corollary>

#proposition([
    let $G$ be a group, let $H subset G$ be subgroup, then
    $
        (G : H) (H : 1) = (G : 1)
    $
    and generalized if $K subset H$ be subgroup, then
    $
        (G : K) = (G : H) (H : K)
    $
    where $\#(H) | \#(G)$ whenever $H subset G$ is a subgroup
]) <subgroup_lagrange_theorem_proposition>

#corollary([
    let $G$ be group, if $\#(G)$ is prime then $G$ is cyclic
]) <cyclic_group_order_prime_corollary>

