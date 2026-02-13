#import "../math_variables_lib.typ": *

#let title = "Mathematical Logic"
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

= The Nature of Mathematical Logic

== Axiom Systems

#definition(title: "axioms and basic concepts", [
    The first mathematical laws cannot be proved, it needs to be accepted before deriving any other laws. Those laws to be accepted are *axioms* which conveys some *basic concepts*. 
]) <axioms_basic_concepts_meaning_definition>

#proposition([
    Mathematics should explain the basic concepts and axioms so that its audiences accept it. Then he define derived concepts to prove theorems about basic and derived concepts. Then construct system of basic concepts, derived concepts, axioms, and theorems, called *axiom system*
]) <axiom_system_proposition>

== Formal Systems

#proposition([
    An axiom or theorem can be viewed as a *sentence*, thus a concrete object, or a *meaning of a sentence*. 
]) <axiom_theorem_view_point_proposition>

#definition(title: "finitary", [
    Proof dealing with concrete objects in constructive manner is *finitary*. A proof is finitary if we can *visualize* the proof.
]) <finitary_definition>

#definition(title: "syntatical and semantical study", [
    The study of axioms and theorems as sentences is called *syntatical study* of axiom systems.

    The study of meaning of the sentences is called *semantical study* of axiom systems.
]) <syntatical_semantical_study_definition>

#definition(title: "formal system", [
    For syntatical study, we need *formal system*, namely syntatical part of an axiom system. Formal system consists of *language*, *axioms*, and *rules of inference*.
]) <formal_system_definition>

#definition(title: "language", [
    Language consists of *symbols*, a finite sequence of symbols of a language is an *expression*, each appearance of an expression is an *occurence*. For expressions to be meaningfull, it must state some facts, which made it a *formula* of a language. Denote language of a formal system $F$ as $L(F)$
]) <language_definition>

#definition(title: "axioms", [
    Axioms should be formula of the language of the formal system.
]) <axioms_definition>

#definition(title: "rules", [
    Rules state that under certain condition, some formulas called *hypotheses* can *infer* a formula called *conclusion*. A formal system should have two laws:
    + the axioms of $F$ are theorems of $F$
    + if all hypothesis of a rule of $F$ are theorems of $F$, then the conclusion of the rule is a theorem of $F$
    Then a formula is a theorem of $F$ iff it follows the rules.
]) <rules_definition>

#definition(title: "generalized inductive definition", [
    A *generalized inductive definition* is process that define a set of laws $S_0$ by rule 1, then define laws given theorems in $S_0$ as $S_1$, then go on for $S_omega$ such that no further theorems can be derived.
]) <generalized_inductive_definition>

#definition(title: "prove by induction on theorems", [
    To prove every theorem of $F$ has property $P$, then is suffice to prove
    + every axiom of $F$ has property $P$
    + if all hypotheses of rule of $F$ have property $P$, then conclusion of the rule has property $P$

    Then for each member of sets $S_0, S_1, dots S_omega$ has property $P$, which is prove by *induction on theorems*, the hypotheses are *induction hypotheses*
]) <prove_by_induction_on_theorems>

#definition(title: "finite rule", [
    A rule of formal system $F$ is *finite* if it has only finitely many hypotheses.
]) <finite_rule_definition>

#definition(title: "proof", [
    A *proof* in $F$ mean a finite sequence of formulas, which are conclusions of some theorems. If the last formula of proof $P$ is $A$, then $P$ is proof of $A$.
]) <proof_definition>

#proposition([
    A formula $A$ of $F$ is a theorem iff there is a proof of $A$, denoted as $tack_F dots$ as abbreviation of $dots$ is a theorem of $F$
]) <theorem_proof_proposition>

#definition(title: "defined symbols", [
    For abbreviations, we introduce *defined symbols*, the formulas using defined symbols are *defined formulas*, for each defined symbols, there must be *definition* of the symbols.
    
    Note the defined symbols are not symbols of the language, they only refer to the actual symbols abbreviated in the language.
]) <defined_symbols_definition>

== Syntatical Variables

#definition(title: "syntatical variables", [
    A *syntatical variables* are symbols that vary through expressions of the language. A formula containing syntatical variables may have many meanings.
]) <syntatical_variables_definition>

#pagebreak()

= First-Order Theories

== Functions and Predicates

#definition(title: "logical and non-logical concepts", [
    To describe the language of a formal system, there are *logical concepts* which are common to all axiom systems, and *non-logical concepts*.
]) <logical_nonlogical_concepts_definition>

#definition(title: "non-logical concepts set theory terminology", [
    By non-logical concepts, the concepts from set theory is used here.
    - $A, B$ are *sets* if they are a set of distinct objects
    - $a in A, s0 b in B$ are *elements* of $A, B$ be the objects in the set 
    - $F : A -> B$ is a mapping if it assigns elements $a$ as *arguments* an element $b$ as its *value* denote as $F(a)$ for $b$
    - $(a_1, dots, a_n)$ is *$n$-tuple* that is ordered collection objects not required to be distinct
    - map that assigns $n$-tuple of $A$ a value of $B$ is an *$n$-ary* function, call $1$-ary as *unary* and $2$-ary as *binary*
    - the subset $P$ of $n$-tuple of $A$ is a *predicate* of $A$, denote $P(a_1, dots, a_n)$ as $(a_1, dots, a_n) in P$
    - the $0$-ary function takes $(space)$ and assign it a value
    - the set of $0$-ary function assign values as objects of an axiom system is a *universe* of the axiom system
    - the elements of a universe is an *individual*
    - functions from universe to universe is *individual functions*
    - predicates of an universe is *individual predicates*
    - for any set $A$, there is binary predicates of same elements $(a, a)$, then this is *equality predicate*, then we use denote $=$ for the equality predicates of an universe
]) <non_logical_concepts_set_theory_terminology_definition>

== Truth Functions

#definition(title: "truth values", [
    for logical concepts, we introduce objects $T, F$ called *truth values* to descrive a formula of a formal system
]) <truth_values_definition>

#definition(title: "truth function", [
    a *truth function* is a function of ${T, F} -> {T, F}$
]) <truth_function_definition>

#definition(title: "And truth function", [
    define binary truth function $H_and$ such that if $a, b$ are truth value of formula $A, B$, then $H_and (a, b)$ is the truth value of $A and B$, and $H_and$ is defined as
    $
        & H_and (T, T) = T \
        & H_and (T, F) = H_and (F, T) = H_and (F, F) = F
    $
]) <and_truth_function_definition>

#definition(title: "Or truth function", [
    define binary truth function $H_or$ such that if $a, b$ are truth value of formula $A, B$, then $H_or (a, b)$ is the truth value of $A or B$, and $H_or$ is defined as
    $
        & H_or (T, T) = H_or (T, F) = H_or (F, T) = T \
        & H_or (F, F) = F
    $
]) <or_truth_function_definition>

#definition(title: "if then truth function", [
    define binary truth function if ... then ... as $H_arrow$ such that truth value of $A -> B$ is $H_arrow (a, b)$, and defined as
    $
        & H_arrow (T, T) = H_arrow (F, T) = H_arrow (F, F) = T \
        & H_arrow (T, F) = F
    $
]) <if_then_truth_function_definition>

#definition(title: "iff truth function", [
    define binary truth function iff as $H_arrow.l.r$ such that truth value of $A <-> B$ is $H_arrow.l.r (a, b)$, and defined as
    $
        & H_arrow.l.r (T, T) = H_arrow.l.r (F, F) = T \
        & H_arrow.l.r (T, F) = H_arrow.l.r (F, T) = F
    $
]) <iff_truth_function_definition>

#definition(title: "not truth function", [
    define unary truth function not as $not$, then $not A$ has truth value $H_not (a)$ defined as
    $
        H_not (T) = F h0 H_not (F) = T
    $
]) <not_truth_function_definition>

#proposition([
    let $a, b$ be truth values of formulas $A, B$, then 
    $
        & A -> B equiv not A or B h3 & H_arrow (a, b) equiv H_or (H_not (a), b) \
        & A and B equiv not (A -> not B) h3 & H_and (a, b) equiv H_not (H_arrow (a, H_not (b))) \
        & A <-> B equiv (A -> B) and (B -> A) h1 & H_arrow.l.r (a, b) equiv H_and (H_arrow (a, b), H_arrow (b, a))
    $
]) <not_or_equivalence_function_proposition>

== Variables and Quantifiers

#definition(title: "individual variables", [
    *individual varialbes* are virables that varies through individuals in the formal system, simply call then variables in the context
]) <individual_variables_definition>

#definition(title: "quantifiers", [
    to determine the formula substituting variables and grouping, we need quantifiers to bound the variable in the context of the language

    then define qunatifier symbols $forall$ as *for all* and $exists$ as *for some* or *exists ... such that*
]) <quantifiers_definition>

#definition(title: "free and bound variable", [
    then for variables that is alone without the quantifier, it is *free variable*, for varialbles that comes with quantifier, then it is *bound variable*
]) <free_bound_variable_definition>

#proposition([
    then for quantifier, we can define each with the other, let $A$ be an formula, let $x$ be an individual variable, then
    $
        & forall x A equiv not exists x not A \
        & exists x A equiv not forall x not A
    $
]) <quantifier_define_each_other_proposition>

== First-Order Languages

#definition(title: "first-order language", [
    with all the components, we define a *first-order language* which has symbols
    + individual variables $x, y, z, dots$
    + for each $n$, the $n$-ary funciton symbols and $n$-ary predicate symbols
    + symbols $not, or, exists$
    + binary function symbol $=$

    to define the names and some conventions
    - the $0$-ary functions are called *constant*
    - function symbols or predicate symbol other than $=$ are *non-logical symbols*, otherwise *logical symbols*
    - sometimes ordering the variables as *alphabetical order*
    - grouping uniquely defined by changing $A or B$ to $or A B$
]) <first_order_language_definition>

#definition(title: "terms", [
    then define *terms* by generalized inductive definition
    + a variable is a term
    + if $u_1, dots, u_n$ are terms, and $f$ is $n$-ary function, then $f u_1 dots u_n$ is a term
]) <terms_definition>

#definition(title: "formula", [
    an *atomic formula* is expression of form $p a_1 dots a_n$, where $p$ is $n$-ary function symbol, then define *formula* by generalized inductive definition
    + atomic formula is a formula
    + if $u$ is a formula, then $not u$ is a formula
    + if $u, v$ are formulas, then $or u v$ is a formula
    + if $u$ is a formula, then $exists x u$ is a formula

    the *height* of a formula is the number of occurence of $not, or, exists$ in the formula
]) <formula_definition>

#proposition([
    each first-order language is defined to have distinct $n$-ary function symbols, so then if two first-order language shares same function symbols, then they are identical
]) <first_order_language_identical_proposition>

#definition(title: "designator", [
    a *designator* is an expression which is either a term or a formula, has the form of $u v_1 dots v_n$, where $u$ is a symbol, and $v_1, dots, v_n$ are designators, $n in bb(N)$ is the *index* of $u$ determined by $u$
]) <designator_definition>

#definition(title: "compatible", [
    two expressions are *compatible* if one of them can be obtained by adding some expressions to the right end of the other
]) <compatible_definition>

#lemma([
    let $u_1, dots, u_n$ and $u'_1, dots, u'_n$ be designators, $u_1 dots u_n$ and $u'_1 dots u'_n$ are compatible, \ then $u_i = u'_i$ for $i = 1, dots, n$
]) <compatible_equivalence_lemma>

#theorem(title: "Formation Theorem", [
    every designator can be written in form $u v_1 dots v_n$ where $u$ is symbol of index $n$ in only one way
]) <formation_theorem>

#lemma([
    every occurence of a symbol in a designator $u$ begins an occurence of a designator in $u$
]) <designator_begin_lemma>

#theorem(title: "Occurence Theorem", [
    let $u$ be symbol of index $n$, let $v_1, dots, v_n$ be designators, then any occurence of designator $v$ in $u v_1 dots v_n$ is either all of $u v_1 dots v_n$ or part of one in $v_i$
]) <occurence_theorem>

#definition([
    define expression $b_x [a]$ as expression obtained by $b$ by replacing each occurence of $x$ by $a$
]) <replacing_variable_expression_definition>

#definition(title: "substitutible", [
    let $A$ be formula, let $x, y$ be variable in $A$, then $x$ is *substitutible* in $A$ if every $x$ occur not in the form of $exists y B$ which is free

    let $A_(x_1, dots, x_n) [a_1, dots, a_n]$ designate formula obtained by $A$ replacing $x_1, dots, x_n$ by $a_1, dots, a_n$, then $x_1, dots, x_n$ are restricted to be distinct variables and $a_1, dots, a_n$ are substitutible for $x_1, dots, x_n$ in the context
]) <substitutible_definition>

#proposition([
    here we abbreviate:
    + $or A B$ as $A or B$
    + $not A or B$ as $A -> B$
    + $not (A -> not B)$ as $A and B$
    + $(A -> B) and (B -> A)$ as $A <-> B$
    and adopt convention of association from right to left to omit parentheses

    let $A_1, dots, A_n, B$ be formulas, then we say
    + $A_1 or dots or A_n$ as at least one of $A_1, dots, A_n$ is true, for $n >= 1$
    + $A_1 and dots A_n$ as all of $A_1, dots, A_n$ is true, for $n >= 1$
    + $A_1 -> dots -> A_n -> B$ as if all $A_1, dots, A_n$ are true then $B$ is true, for $n >= 0$
]) <associative_convention_proposition>

#definition([
    let $A, B, A_1, dots, A_n$ be formulas
    here we name each operation
    + $not A$ is the *negation* of $A$
    + $A or B$ is the *disjunction* of $A, B$ and $A_1 or dots or A_n$ is *disjunction* of $A_1, dots, A_n$
    + $A and B$ is the *conjunction* of $A, B$ and $A_1 and dots and A_n$ is *conjunction* of $A_1, dots, A_n$
    + $A -> B$ is the *implication* of $B$
    + $A <-> B$ is the *equivalence* of $B$
    + $exists x A$ the *instantication* of $A$ by $x$
    + $forall x A$ the *generalization* of $A$ by $x$
    where $exists x$ is the *existential quantifiers* on $x$, and $forall x$ is the *universal quantifier* on $x$
]) <operators_naming_definition>

