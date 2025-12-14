#import "../math_variables_lib.typ": *
#import "@preview/finite:0.5.0": automaton

#let title = "Computation Theory Note"
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


////////////////////////////////////////
//            content below           //
////////////////////////////////////////


= Regular Languages

== Finite Automata

#example(title: "state diagram", [
    #align(center, [
            #automaton((
                q1: (q1: "u", q2: "d"),
                q2: (q1: "u", q3: "d"),
                q3: (q2: "u", q3: "d")
            ),
            initial: "q1",
            final: ("q3")
        )
    ])
]) <state_diagram_example>

- *state*: ${q_1, q_2, q_3}$
- *start state*: $q_1$
- *accept state*: ${q_3}$
- output: *accept* if end on accept state, else *reject*

#definition(title: "DFA", [
    a *finite automaton* is $(Q, Sigma, delta, q_0, F)$ where
    + $Q$ is a finite set called *states*
    + $Sigma$ is a finite set called *alphebat*
    + $delta: Q times Sigma -> Q$ is the *transition function*
    + $q_0 in Q$ is the *start state*
    + $F subset Q$ is the set of *accept states*
]) <finite_automaton_definition>

if $A$ is all strings that $M$ accepts, then $A$ is the *language of* $M$, denoted as $L(M) = A$ \
then $M$ *recognize* $A$, or $M$ *accepts* $A$

#definition(title: "regular language", [
    a language is *regular language* if some finite automaton recognize it
]) <regular_language_definition>

#definition(title: "regular operations", [
    let $A, B$ be languages, define:
    - *union*: $A union B = {x | x in A or x in B}$
    - *concatenation*: $A compose B = {x y | x in A and y in B}$
    - *star*: $A^* = {x_1 x_2 dots x_k | k >= 0, x_i in A}$
]) <regular_operations_definition>

#theorem([
    the class of regular language is closed under union operations
]) <union_regular_language_closed_theorem>

#theorem([
    the class of regular language is closed under concatenation operations
]) <concatenation_regular_language_close_theorem>

== Nondeterminism

#definition(title: "NFA", [
    a *nondeterministic finite automaton* is a five tuple $(Q, Sigma, delta, q_0, F)$, where
    + $Q$ is a finite set of states
    + $Sigma$ is a finite set of alphebet
    + $delta : Q times Sigma_epsilon -> cal(P)(Q)$ is the transition function
    + $q_0 in Q$ is the start state
    + $F subset Q$ is the set of accept states
]) <nondeterministic_finite_automaton_definition>

two machine is said to be *equivalent* if they recognize the same language

#theorem([
    every nondeterministic finite automaton has an equivalent deterministic finite automaton
]) <nondet_det_FA_EQ_theorem>

#corollary([
    a language is regular iff some nondeterministic finite automaton recognize it
]) <regular_language_nondetFA_recog_corollary>

#theorem([
    the class of regular language is closed under star operation
]) <star_regular_language_closed_theorem>

== Regular Expressions

#definition(title: "regular expression", [
    $R$ is a *regular expression* if $R$ is:
    + $a$ for some $a in Sigma$
    + $epsilon$
    + $emptyset$
    + $R_1 union R_2, h0 R_1, R_2$ be regular expressions
    + $R_1 compose R_2, h0 R_1, R_2$ be regular expressions
    + $R_1^*, h0 R_1$ be regular expressions
]) <regular_expression_definition>

#theorem([
    a language is regular iff some regular expression describes it
]) <regular_lang_regex_describe_theorem>

#definition(title: "GNFA", [
    a *general nondeterministic finite automaton* is $(Q, Sigma, delta, q_("start"), q_("accept"))$, where
    + $Q$ is the finite set of states
    + $Sigma$ is the input alphebet
    + $delta : (Q - {q_("accept")}) times (Q - {q_("start")}) -> cal(R), h0 cal(R)$ is the collection of all regular expressions over $Sigma$
    + $q_"start"$ is the start state
    + $q_"accept"$ is the accept state
]) <GNFA_definition>

== Nonregular Languages

#theorem(title: "pumping lemma", [
    if $A$ is a regular language, $exists p s0 forall s  in A, s0 |s| >= p, s0 s = x y z "for some" x, y, z suchthat$
    + $forall i >= 0, s0 x y^i z in A$
    + $|y| > 0$
    + $|x y| <= p$
]) <pumping_lemma_theorem>

#pagebreak()

= Context-Free Languages

== Context-Free Grammars

#definition(title: "CFG", [
    a *context-free grammar* is $(V, Sigma, R, S)$, where
    + $V$ is a finite set called *variables*
    + $Sigma$ is a finite set called *terminals*, where $Sigma inter V = emptyset$
    + $R$ is a set of rules where each element be $a = b c dots, s0 a in V, s0 b, c, dots in V union Sigma$
    + $S in V$ is the start variable
]) <CFG_definition>

let $u, v, w in V union Sigma, h0 (A -> w ) in cal(R)$ then $u A v$ *yields* $u w v$ denoted as $u A v => u w v$ \
$u$ *derives* $v$ denoted as $u limits(=>)^* v$ if
$
    u => u_1 => u_2 => dots => v
$
the *language of grammar* is ${w in Sigma^* | S limits(=>)^* w}$

#definition(title: "ambiguity", [
    a string $w$ is derived *ambiguously* in CFG $G$ if it has two or more different leftmost derivations. \
    grammar $G$ is *ambiguous* if it generate some string ambiguously
]) <ambiguity_definition>

*inherently ambiguous* language can only be generated by ambiguous grammars

#definition(title: "Chomsky normal form", [
    a CFG is in *Chomsky normal form* if every rule is of form
    $
        A -> B C \
        A -> a
    $
    where $A, B, C in V, s0 a in Sigma$
]) <chomsky_normal_form_definition>

#theorem([
    any context-free language is generated by a CFG in chomsky normal form
]) <CFL_CFG_chomsky_theorem>

== Pushdown Automata

#definition(title: "PDA", [
    a *pushdown automaton* is $(Q, Sigma, Gamma, delta, q_0, F)$, where
    + $Q$ is finite set of states
    + $Sigma$ is finite set of input alphebet
    + $Gamma$ is finite set of *stack* alphebet
    + $delta: Q times Sigma_epsilon times Gamma_epsilon -> cal(P) (Q times Gamma_epsilon)$ is the transition function
    + $q_0 in Q$ is the start state
    + $F subset Q$ is the set of accept states 
]) <PDA_definition>

#theorem([
    a language is context-free iff some PDA recognize it
]) <CF_language_PDA_recog_theorem>

#corollary([
    every regular language is context-free
]) <regular_lang_CF_corollary>

== Non-Context-Free Languages

#theorem(title: "pumping theorem for context-free languages", [
    if $A$ is a context-free language, then $exists p , s0 forall s in A, s0 |s| >= p, s0 s = u v x y z$ where
    + $forall i >= 0, s0 u v^i x y^i z in A$
    + $|v y| > 0$
    + $|v x y| <= p$
]) <pumping_theorem_CF_lang>

== Deterministic Context-Free Languages

#definition(title: "DPDA", [
    a *deterministic pushdown automaton* is $(Q, Sigma, Gamma, delta, q_0, F)$ where
    + $Q$ is a finite set of states
    + $Sigma$ is the finite set of input alphebet
    + $Gamma$ is the finite set of stack alphebet
    + $delta: Q times Sigma_epsilon times Gamma_epsilon -> (Q times Gamma_epsilon) union {emptyset}$ is the transition function
    + $q_0 in Q$ is the start state
    + $F subset Q$ is the finite set of accept states
    transition function must satisfy:
    $
        forall q in Q, s0 a in Sigma, s0 x in Gamma h0 delta(q, a, x) union delta(q, a, epsilon) union delta(q, epsilon, x) union delta(q, epsilon, epsilon) != {emptyset}
    $
]) <DPDA_definition>

#lemma([
    every DPDA has an equivalent DPDA that always reads the entire input string
]) <DPDA_eq_DPDA_all_string_lemma>

#theorem([
    the class DCFL is closed under complementation
]) <DCFL_closed_complement_theorem>

language contains *endmark* symbol $tack.l$ is *endmarked language*

#theorem([
    $A$ is a DCFL iff $A tack.l$ is DCFL
]) <DCFL_endmark_theorem>

the *reduction* $r >-> u$ means $u => r$ \
a *reduction from* $u$ to $v$ is
$
    u = u_1 >-> u_2 >-> dots >-> v
$
say $u$ is *reducible* to $v$, denoted as $u limits(>->)^* v$ \
*leftmost reduction* reducts from the left most operation \
let $u = x h y >-> x T y$, then rule $T -> h$ is a *handle* \
a string appears in leftmost reduction of a language is a *valid string*, handle is only defined for valid string \
if $h$ is the unique handle for all $x h y, s0 y in Sigma^*$, then $h$ is a *forced handle*

#definition(title: "DCFG", [
    a *deterministic context-free grammar* is a CFG that every valid string has a forced handle
]) <DCFG_definition>

#theorem([
    a grammar $G$ passes the DK-test iff $G$ is a DCFG
]) <DCFG_DK_theorem>

#theorem([
    an endmarked language is deterministic context-free iff is generated by a DCFG
]) <DCFG_endmark_theorem>

#lemma([
    + every DCFG has an equivalent DPDA
    + every DPDA that recognize an endmarked langauge has an equivalent DCFG
]) <DCFG_DPDA_eq_lemma>

a state in DK test is completed if a dot as goes to the end \
DK test success if all reduction are *consistent* and does not have conflict, let $R_1, R_2$ be consistent each with lookahead $a, b$ then
+ $R_2$ is completed and lookahead $a = b$
+ $R_2$ is not completed and $a$ immediately follows its dot
DK test example

#grid(columns: 2, gutter: 1cm,
    [
        #figure(
            image("image.png", width: 100%),
            caption: "DK test failed example",
        )
    ],
    [
        #figure(
            image("image-1.png", width: 100%),
            caption: "DK test passed example",
        )
    ]
)

#definition(title: "LR grammar", [
    an *LR(k) grammar* is a CFG such that every handle is forced to lookahead $k$, a handle can reduce only when input agrees to the lookahead
]) <LR_grammar_definition>

#theorem([
    a grammar $G$ passes $D K_1$-test iff $G$ is $L R(1)$ grammar
]) <DK1_LR1_theorem>

#lemma([
    every $L R(1)$ grammar has an equivalent DPDA
]) <LR1_eq_DPDA_lemma>

#theorem([
    an endmarked langauge is generated by an $L R(1)$ grammar iff it is a DCFL
]) <endmark_LR1_DCFL_theorem>

= Church-Turing Thesis

== Turing Machine

#definition(title: "turing machine", [
    a *turing machine* (one tape) is defined as $M = (Q, Sigma, Gamma, delta, q_0, q_"accept", q_"reject")$ such that
    + $Q$ is the finite set of states
    + $Sigma$ is the finite set of input alphebat such that $blank in.not Sigma$
    + $Gamma$ is the finite set of tape alphebat such that $Sigma subset Gamma$ and $blank in Gamma$
    + $delta : Q times Gamma -> Q times Gamma times {L, R}$ be the state transition function
    + $q_0 in Q$ is the start state
    + $q_"accept" in Q$ is the accept state
    + $q_"reject" in Q$ is the reject state where $q_"reject" != q_"accept"$
]) <turing_machine_definition>

#definition(title: "configuration", [
    let $M = (Q, Sigma, Gamma, delta, q_0, q_i, q_j)$ and $q_0, dots, q_n in Q$ such that $n = i$ or $n = j$, let $*$ denote any alphebat in $Gamma$, then a *configuration* of turing machine is a snapshot of the state and tape in the execution of the turing machine as $* * * * q_k * * * *$ for $q_k$ denote current step, and head looking at index $4$ (0-base)

    let input be $w$ then
    + the *start configuration* is $q_0 w$
    + the *accepting configuration* is configuration at state $q_"accept"$
    + the *rejecting configuration* is configuration at state $q_"reject"$
    + the *halting configuration* is either accepting or rejecting configuration

    when the configuration moves through a rule, then the former ones *yeilds* the new configuration
]) <turing_machine_configuration_definition>

