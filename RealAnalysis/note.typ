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
    + let $P(n)$ be any property of $n in bb(N)$, $tack P(0) and (P(n) -> P(S(n))) => s0 tack forall n in bb(N) s0 P(n)$
]) <peano_axioms>

== Addition

#definition(title: "addition of natural numbers", [
    let $n, m in NN$ then
    + $0 + m := m$
    + $S(n) + m := S(n + m)$
]) <addition_n_definition>

#lemma([
    $forall n in NN s0 n + 0 = n$
]) <add_zero_eq_lemma>

#lemma([
    $forall n, m in NN s0 n + S(m) = S(n + m)$
]) <reverse_add_succ_lemma>

#proposition(title: "addition is commutative", [
    $forall n, m in NN s0 n + m = m + n$
]) <add_comm_proposition>

#proposition(title: "addition is associative", [
    $forall a, b, c in NN h0 (a + b) + c = a + (b + c)$
]) <add_asso_proposition>

#proposition(title: "cancellation law", [
    let $a, b, c in NN in.rev a + b = a + c$ then $b = c$
]) <cancellation_law_proposition>

#definition(title: "positive natural numbers", [
    let $n in NN$ then $n$ is *positive* iff $n != 0$
]) <positive_natural_number_definition>

#proposition([
    let $a in NN$ be positive, let $b in NN$, then $a + b$ is positive
]) <pos_plus_n_pos_proposition>

#corollary([
    let $a, b in NN in.rev a + b = 0$ then $a = b = 0$
]) <n_plus_n_eq_zero_corollary>

#lemma([
    let $a in NN$ be positive, then $existsunique b in NN in.rev S(b) = a$
]) <exist_unique_predecessor_pos_lemma>

#definition(title: "ordering of natural number", [
    let $n, m in NN$, then denote $n$ is *greater than* $m$ as $n >= m$ or $m <= n$ iff $exists a in NN in.rev n = m + a$

    denote $n$ is *strictly greater than* $m$ as $n > m$ or $m < n$ iff $n != m and n >= m$
]) <ordering_n_definition>

#proposition([
    let $a, b, c in NN$, then
    + (*reflexive*) $a >= a$
    + (*transistive*) $a >= b and b >= c => a >= c$
    + (*anti-symmetric*) $a >= b and b >= a => a = b$
    + (*addition preserves order*) $a >= b <=> a + c >= b + c$
    + $a < b <=> S(a) <= b$
    + $a < b <=> exists d in NN "be positive such that" b = a + d$
]) <basic_properties_n_ordering_proposition>

#proposition(title: "trichotomy of order for natural numbers", [
    let $a, b in NN$ then exactly one of below is true
    - $a > b$
    - $a = b$
    - $a < b$
]) <trichotomy_order_n_proposition>

#proposition(title: "strong principle of induction", [
    let $m_0 in NN$, let $P(m)$ be property pretaining to $m in NN$

    if $forall m in NN s0 m >= m_0$ we have $tack P(m')$ with $m_0 <= m' < m -> P(m)$ then we can conclude \ $forall m in NN s0 m >= m_0 tack P(m)$
]) <strong_principle_induction_proposition>

#proposition(title: "principle of backward induction", [
    let $n, m in NN$, let $P(m)$ be property pretaining to $m$

    $(tack P(S(m)) -> P(m)) and P(n) => forall m in NN s0 m <= n tack P(m)$
]) <principle_backward_induction_proposition>

== Multiplication

#definition(title: "multiplication of natura numbers", [
    let $n, m in NN$, then define *multiplication* that
    - $0 times m := 0$
    - $S(n) times m := (n times m) + m$
    and we abreviate $n times m$ as $n m$
]) <multiplication_n_definition>

#lemma(title: "multiplicaiton is commutative", [
    let $n, m in NN$ then $n times m = m times n$
]) <mul_n_commutative_lemma>

#lemma([
    let $n, m in NN suchthat n times m = 0 => n = 0 or m = 0$
]) <pos_no_zero_divisor_lemma>

#proposition(title: "distributive law", [
    let $a, b, c in NN$, then
    - $a (b + c) = a b + a c$
    - $(b + c) a = b a + c a$
]) <distributive_law_n_proposition>

#proposition(title: "multiplication is associative", [
    let $a, b, c in NN$, then $(a times b) times c = a times (b times c)$
]) <mul_n_associative_proposition>

#proposition(title: "multiplication preserves order", [
    let $a, b, c in NN suchthat a < b, s0 c != 0$ then $a c < b c$
]) <mul_n_preserve_order_proposition>

#corollary(title: "cancellation law", [
    let $a, b, c in NN suchthat a c = b c and c != 0$ then $a = b$
]) <mul_cancellation_law_corollary>

#proposition(title: "Euclidean algorithm", [
    let $n, q in NN$, $q$ be positive, then $exists m, r in NN suchthat 0 <= r < q s0 and s0 n = m q + r$
]) <euclidean_algorithm_proposition>

#definition(title: "exponentiation of natural numbers", [
    let $n, m in NN$, then define *exponentiation*
    - $m^0 := 1$ and $0^0 := 1$
    - $m^(S(n)) := m^n times m$
]) <exponentiation_n_definition>

