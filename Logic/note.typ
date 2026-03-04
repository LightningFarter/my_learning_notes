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
    for logical concepts, we introduce objects $cal(T), F$ called *truth values* to descrive a formula of a formal system
]) <truth_values_definition>

#definition(title: "truth function", [
    a *truth function* is a function of ${cal(T), F} -> {cal(T), F}$
]) <truth_function_definition>

#definition(title: "And truth function", [
    define binary truth function $H_and$ such that if $a, b$ are truth value of formula $A, B$, then $H_and (a, b)$ is the truth value of $A and B$, and $H_and$ is defined as
    $
        & H_and (cal(T), cal(T)) = cal(T) \
        & H_and (cal(T), F) = H_and (F, cal(T)) = H_and (F, F) = F
    $
]) <and_truth_function_definition>

#definition(title: "Or truth function", [
    define binary truth function $H_or$ such that if $a, b$ are truth value of formula $A, B$, then $H_or (a, b)$ is the truth value of $A or B$, and $H_or$ is defined as
    $
        & H_or (cal(T), cal(T)) = H_or (cal(T), F) = H_or (F, cal(T)) = cal(T) \
        & H_or (F, F) = F
    $
]) <or_truth_function_definition>

#definition(title: "if then truth function", [
    define binary truth function if ... then ... as $H_arrow$ such that truth value of $A -> B$ is $H_arrow (a, b)$, and defined as
    $
        & H_arrow (cal(T), cal(T)) = H_arrow (F, cal(T)) = H_arrow (F, F) = cal(T) \
        & H_arrow (cal(T), F) = F
    $
]) <if_then_truth_function_definition>

#definition(title: "iff truth function", [
    define binary truth function iff as $H_arrow.l.r$ such that truth value of $A <-> B$ is $H_arrow.l.r (a, b)$, and defined as
    $
        & H_arrow.l.r (cal(T), cal(T)) = H_arrow.l.r (F, F) = cal(T) \
        & H_arrow.l.r (cal(T), F) = H_arrow.l.r (F, cal(T)) = F
    $
]) <iff_truth_function_definition>

#definition(title: "not truth function", [
    define unary truth function not as $not$, then $not A$ has truth value $H_not (a)$ defined as
    $
        H_not (cal(T)) = F h0 H_not (F) = cal(T)
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
    + $exists x A$ the *instantiation* of $A$ by $x$
    + $forall x A$ the *generalization* of $A$ by $x$
    where $exists x$ is the *existential quantifiers* on $x$, and $forall x$ is the *universal quantifier* on $x$
]) <operators_naming_definition>

== Structures

#definition(title: "structure", [
    let $L$ be a first-order language, a *structure* $cal(A)$ for $L$ consists of
    + set $|cal(A)| != emptyset$, the *universe* of $cal(A)$, where elements of $|cal(A)|$ are *individuals* of $cal(A)$
    + $forall f in L$ be $n$-ary function symbol, $exists f_cal(A) : |cal(A)| -> |cal(A)|$ be $n$-ary function
    + $forall p in L$ be $n$-ary predicate symbol, not $=$ symbol, $exists p_cal(A) in |cal(A)|$ be $n$-ary predicate
]) <first_order_structure_definition>

#definition(title: "name", [
    let $L$ be first-order language, let $cal(A)$ be structure for $L$, then for each individual $a in |cal(A)|$, we choose a new constant as *name* of $a$

    the first-order language obtained by assigning names to each individuals of $cal(A)$ is designated by $L(cal(A))$
]) <first_order_name_definition>

#definition(title: "variable-free", [
    let $A$ be expression without variables, then it is *variable-free*
]) <variable_free_definition>

#definition([
    let $L$ be first-order language, let $cal(A)$ be structure for $L$, let $a$ be variable-free term, then define $cal(A)(a)$ as
    $
        cases(
            a h1 & a "is a name",
            f_cal(A) (cal(A)(a_1), dots, cal(A)(a_n)) h0 & a = f a_1 dots a_n
        )
    $
]) <individual_name_structure_definition>

#definition(title: "closed formula", [
    let $A$ be formula, then $A$ is *closed* if no variabe in $A$ is free
]) <closed_formula_definition>

#definition(title: [$cal(A)$-instance], [
    let $L$ be first-order language, let $cal(A)$ be structure for $L$, let $A$ be formula, then $cal(A)$-instance of $A$ is closed formula of form $A[i_1, dots, i_n] in L(cal(A))$, which each $i_1, dots, i_n$ be names in $L(cal(A))$
])

#definition(title: "valid", [
    let $L$ be first-order language, let $cal(A)$ be structure for $L$, let $A$ be formula. then $A$ is valid in $cal(A)$ if $forall A'$ be $cal(A)$-instance, $cal(A)(A') = cal(T)$

    a closed formula $A$ is valid iff $cal(A)(A) = cal(T)$
]) <first_order_valid_formula_definition>

#lemma([
    let $L$ be first-order language, let $cal(A)$ be structure for $L$, let $a$ be variable-free term in $L(cal(A))$, let $i$ be name of $cal(A)(a)$,
    
    let $b in L(cal(A))$ be term where no variables other than $x$ occurs, then $cal(A)(b_x [a]) = cal(A)(b_x [i])$

    let $A in L(cal(A))$ be formula where no variables other than $x$ occurs, then $cal(A)(A_x [a]) = cal(A)(A_x [i])$
]) <first_order_term_name_substitution_lemma>

== Logical Axioms and Rules

#definition(title: "type of axioms", [
    let $L$ be language of a formal system, then an *axiom* is defined to be valid in given structure of $L$
    - *logical axioms* are axioms be valid only with its logical truth values, which is *logical valid* in every structure of $L$
    - *nonlogical axioms* are axioms be valid because of some property in structure $cal(A)$ for $L$, which is *nonlogical valid*

    then we can define rules that leads to conclusion via logical inference, namely *logical consequence*
    - *logical rules*, conclusion of logical consequence of the hypotheses
    - *nonlogical rules*, conclusion of hypotheses only because certain property of structure $cal(A)$
]) <type_axioms_definition>

#definition(title: "logical axioms", [
    let $L$ be first-order langauge, let $A, B$ be formula in $L$, let $x, y$ be variables, then we have axioms
    + *propositional axiom*: $not A or A$
    + *substitution axiom*: $A_x [a] -> exists x A$
    + *identity axiom*: $x = x$
    + *equality axiom*: 
        - $x_1 = y_1 -> dots -> x_n = y_n -> f x_1 dots x_n = f y_1 dots y_n$ for $n$-ary function symbol $f$
        - $x_1 = y_1 -> dots -> x_n = y_n -> p x_1 dots x_n = p y_1 dots y_n$ for $n$-ary predicate symbol $p$
    
    a *logical axiom* is law either proposition axiom, substitution axiom, identity axiom or equality axiom
]) <logical_axioms_definition>

#definition(title: "rules of inference", [
    let $L$ be first-order language, let $A, B, C$ be formula, let $x$ be variable, define *rules of inference*
    + *expansion rule*: $A => B or A$
    + *contraction rule*: $A or A => A$
    + *associative rule*: $A or (B or C) => (A or B) or C$
    + *cut rule*: $(A or B) and (not A or C) => B or C$
    + *$exists$-introduction rule*: if $x$ is not free in $B$, $A -> B => exists x A -> B$
]) <rules_of_inference_definition>

#definition(title: "first-order theory", [
    now we define *first-order theorey* as a formal system $cal(T)$ such that
    + $L(cal(T))$ is first-order language
    + axioms of $cal(T)$ are logical axioms of $L(cal(T))$ and further nonlogical axioms
    + rule of $cal(T)$ are
        - expansion rule
        - contraction rule
        - associative rule
        - cut rule
        - $exists$-introduction rule
]) <first_order_theory_definition>

#definition(title: "model of first order theory", [
    let $cal(T)$ be first order theory, the *model* of $cal(T)$ is a structure for $L(cal(T))$ such that all of the nonlogical axioms of $cal(T)$ are valid

    a formulat $A$ is *valid* in $cal(T)$ if it is valid in every model of $cal(T)$
]) <model_first_order_theory_definition>

#theorem(title: "validity theorem", [
    let $cal(T)$ be a first-order theory, then every theorem of $cal(T)$ is valid
]) <validity_theorem>

#definition(title: "defineable", [
    an $n$-ary function $H$ is *defineable* in terms of truth functions $H_1, dots, H_k$ if $H$ has definition
    $
        H(a_1, dots, a_n) = dots
    $
    where the right hand side is built up with $H_1, dots, H_k, a_1, dots, a_n$, commas and parentheses
]) <defineable_definition>

#pagebreak()

= Theorems in First-Order Theories

== The Tautology Theorem

#definition(title: "elementary formula", [
    let $cal(cal(T))$ be first-order theory, let $A$ be formula in $cal(cal(T))$, then $A$ is *elementary* if either
    - $A$ is atomic
    - $A$ is an instantiation
]) <elementary_formula_definition>

#definition(title: "truth valuation", [
    let $cal(cal(T))$ be first-order theory, let $A$ be formula in $cal(cal(T))$, then function $V : A |-> {cal(T), F}$ is a *truth valuation* maps a set of elementary formulas in $cal(T)$ to set of truth values
]) <truth_valuation_definition>

#definition(title: "tautological consequence", [
    let $cal(cal(T))$ be first-order theory, let $B, A_1, dots, A_n$ be formulas in $cal(cal(T))$, then $B$ is a *tautological consequence* of $A_1, dots, A_n$ if $V(B) = cal(T)$ for every truth valuation $V$ when $V(A_1) = dots = V(A_n)$

    $B$ is *tautology* if $n = 0$
]) <tautological_consequence_definition>

#lemma([
    let $cal(cal(T))$ be first-order theory, let $A, B$ be formulas in $cal(cal(T))$, then if $tack A or B$ then $tack B or A$
]) <or_commutation_lemma>

#lemma(title: "detachment rule", [
    let $cal(cal(T))$ be first-order theory, let $A, B$ be formulas in $cal(cal(T))$, then if $tack A$ and $tack A -> B$ then $tack B$
]) <detachment_rule_lemma>

#corollary([
    let $cal(cal(T))$ be first-order theory, let $B, A_1, dots, A_n$ be formulas in $cal(cal(T))$, then if $tack A_1, dots, tack A_n$ and \ $tack A_1 -> dots -> A_n -> B$, then $tack B$
]) <detachment_rule_corollary>

#lemma([
    let $cal(cal(T))$ be first-order theory, let $A_1, dots, A_n$ be formulas in $cal(cal(T))$ where $n >= 2$, if $A_1 or dots or A_n$ is tautology, then $tack A_1 or dots or A_n$
]) <tautology_to_theorem_lemma>

#theorem(title: "tautology theorem", [
    let $cal(cal(T))$ be first-order theory, let $B, A_1, dots, A_n$ be formulas in $cal(cal(T))$, if $B$ is tautological consequence of $A_1, dots, A_n$, and $tack A_1, dots, tack A_n$ then $tack B$
]) <tautology_theorem>

#corollary([
    every tautology is a theorem
]) <tautology_theorem_corollary>

#proposition([
    let $cal(cal(T))$ be first-order theory, let $A, B, C$ be formulas in $cal(cal(T))$, then the following are use cases of tautology theorem other than the detachment rule
    + if $tack A <-> B$, then $tack A$ iff $tack B$
    + if $tack A -> B$ and $tack B -> C$, then $tack A -> C$
    + if $tack A <-> B$ and $tack B <-> C$, then $tack A <-> C$
    + $tack A and B$ iff $tack A$ and $tack B$
    + $tack A <-> B$ iff $tack A -> B$ and $tack B -> A$
    + $tack A -> B$ iff $tack not B -> not A$
]) <common_use_case_tautology_theorem_proposition>

#definition(title: "theorem (generalized)", [
    let $cal(cal(T))$ be theory, then theorems of $cal(cal(T))$ can be generalized by inductive definition as
    + every substitution axiom, identity axiom, equality axiom, and nonlogical axiom is a theorem
    + let $A_1, dots, A_n, B$ be formulas in $cal(cal(T))$, if $A_1, dots, A_n$ for $n >= 0$ are theorems, and $B$ is tautological consequence of $A_1, dots, A_n$, then $B$ is a theorem
    + let $A, B$ be formulas in $cal(cal(T))$, if $A$ is a theorem and $B$ can be inferred from $A$ by $exists$-introduction rule, then $B$ is a theorem
]) <generalized_theorem_definition>

#definition(title: "proof by induction", [
    let $cal(cal(T))$ be theory, let $A, A_1, dots, A_n, B$ be formulas in $cal(cal(T))$, the method *proof by induction* or *induction on theorems* is the method proving every theorem has property $P$ by
    + every substitution axiom, identity axiom, equality axiom, and nonlogical axiom has property $P$
    + if $A_1, dots, A_n$ have property $P$, and $B$ is tautological consequence of $A_1, dots, A_n$, \ then $B$ has property $P$
    + if $A$ has property $P$ and $B$ can be inferred from $A$ by $exists$-introduction rule, then $B$ has property $P$
]) <proof_by_induction_definition>

== Results on Qunatifiers

#lemma(title: [$forall$-introduction rule], [
    let $cal(cal(T))$ be theory, let $A, B$ be formulas in $cal(cal(T))$, let $x$ be variable, if $tack A -> B$ and $x$ is not free in $A$, then $tack A -> forall x B$
]) <forall_introduction_rule_lemma>

#lemma(title: "generalization rule", [
    let $cal(cal(T))$ be thoery, let $A$ be formula, let $x$ be variable, if $tack A$, then $tack forall x A$
]) <generalization_rule_lemma>

#definition(title: "instance", [
    let $A$ be formula, then we say $A' = A_(x_1, dots, x_n)[y_1, dots, y_n]$ is a *instance* of $A$
]) <formula_instance_definition>

#lemma(title: "substitution rule", [
    let $cal(cal(T))$ be theory, let $A$ be formula, let $A'$ be instance of $A$, if $tack A$, then $tack A'$
]) <substitution_rule_lemma>

#theorem(title: "substitution theorem", [
    let $cal(cal(T))$ be theory, let $A$ be formula, let $x_1, dots, x_n, a_1, dots, a_n$ be variables, then
    + $tack A_(x_1, dots, x_n)[a_1, dots, a_n] -> exists x_1 dots exists x_n A$
    + $tack forall x_1 dots forall x_n A -> A_(x_1, dots, x_n)[a_1, dots, a_n]$
]) <substitution_theorem>

#lemma(title: "distribution rule", [
    let $cal(cal(T))$ be theory, let $A, B$ be formulas, let $x$ be variable, if $tack A -> B$, then
    + $tack exists x A -> exists x B$
    + $tack forall x A -> forall x B$
]) <distribution_rule_lemma>

#definition(title: "closure", [
    let $A$ be formula, let $x_1, dots, x_n$ be all free variables in $A$, then $A' = forall x_1 dots forall x_n A$ is a *closure* of $A$
]) <closure_definition>

#theorem(title: "closure theorem", [
    let $cal(cal(T))$ be theory, let $A$ be formula, let $A'$ be closure of $A$, then $tack A$ iff $tack A'$
]) <closure_theorem>

#corollary([
    let $cal(cal(T))$ be theory, let $A$ be formula, let $A'$ be closure of $A$, let $cal(A)$ be strucutre of $cal(cal(T))$, \ then $A$ is valid in $cal(A)$ iff $A'$ is valid in $cal(A)$
]) <closure_validity_in_structure_corollary>

== The Deduction Theorem

#definition([
    let $cal(cal(T))$ be theory, let $A_1, dots, A_n$ be formulas, then we designate $cal(cal(T))[A_1, dots, A_n]$ as accepting $A_1, dots, A_n$ as new nonlogical axioms to $cal(cal(T))$
]) <expanding_nonlogical_axiom_definition>

#theorem(title: "deduction theorem", [
    let $cal(cal(T))$ be theory, let $A, B$ be formula, let $A$ be closed, then $tack_cal(cal(T)) A -> B$ iff $tack_(cal(cal(T))[A]) B$
]) <deduction_theorem>

#corollary([
    let $cal(cal(T))$ be theory, let $A_1, dots, A_n, B$ be formula in $cal(cal(T))$, $A_1, dots, A_n$ be closed formula, then \ $tack_cal(cal(T)) A_1 -> dots -> A_n -> B$ iff $tack_(cal(cal(T))[A_1, dots, A_n]) B$
]) <deduction_theorem_corollary>

#theorem(title: "theorem on constants", [
    let $cal(cal(T))$ be theory, let $cal(cal(T))'$ be obtained by adding constants on $cal(cal(T))$, let $A$ be formula in $cal(cal(T))$, let $e_1, dots, e_n$ be new constants of $cal(cal(T))'$, then $tack_cal(cal(T)) A$ iff $tack_cal(cal(T))' A[e_1, dots, e_n]$
]) <theorem_on_constants_theorem>

#theorem([
    let $cal(cal(T))$ be theory, let $cal(cal(T))'$ be obtained by adding constants $e_1, dots, e_n$ on $cal(cal(T))$, let $A, B$ be formula in $cal(cal(T))$ where $x_1, dots, x_n$ is all of the free variables in $A$, then
    $
        tack_cal(cal(T)) A -> B h0 "iff" h0 tack_cal(cal(T))' A[e_1, dots, e_n] -> B[e_1, dots, e_n]
    $
]) <theorem_on_constant_deduction_theorem>

== The Equivalence and Equality Theorems

#theorem(title: "equivalence thoerem", [
    let $cal(cal(T))$ be theory, let $A, B_1, dots, B_n$ be formula in $cal(cal(T))$, let $B_1, dots, B_n$ be part of $A$, let $A'$ be formula obtained by replacing $B_1, dots, B_n$ as $B'_1, dots, B'_n$, then
    $
        mif tack B_1 <-> B'_1, dots, tack B_n <-> B'_n \
        => tack A <-> A'
    $
]) <equivalence_theorem>

#definition(title: "variance of formula", [
    let $A$ be formula, let $x, y$ be variables, let $B$ be part of $A$ and $y$ not free in $B$, then a *variance* of $A$ denote as $A'$ is obtained by a series of replacement of $exists x B$ to $exists y B_x [y]$
]) <variance_of_formula_definition>

#theorem(title: "variant theorem", [
    let $cal(cal(T))$ be theory, let $A$ be formula, let $A'$ be variant of $A$, then $tack A <-> A'$
]) <variant_theorem>

#theorem(title: "symmetry theorem", [
    let $cal(cal(T))$ be theory, let $a, b$ be terms, then $tack a = b <-> b = a$
]) <symmetry_theorem>

#theorem(title: "equality theorem", [
    let $cal(cal(T))$ be theory, let $b$ be term, let $a_1, dots, a_n$ be terms not in quantifiers, let $b'$ be variant of $b$ replacing $a_1, dots, a_n$ as $a'_1, dots, a'_n$, if $tack a_1 = a'_1, dots, tack a_n = a'_n$, then $tack b = b'$

    let $A$ be formula, let $a_1, dots, a_n$ be terms not in quantifiers, let $A'$ be variant of $A$ replacing $a_1, dots, a_n$ as $a'_1, dots, a'_n$, if $tack a_1 = a'_1, dots, tack a_n = a'_n$, then $tack A <-> A'$
]) <equality_theorem>

#corollary([
    let $cal(cal(T))$ be theory, let $b$ be term, let $a_1, dots, a_n$ be replacable terms in $b$, let $b'$ be variant of $b$ obtained by replacing $a_1, dots, a_n$ to $a'_1, dots, a'_n$, then $tack a_1 = a'_1 -> dots -> tack a_n = a'_n -> b[a_1, dots, a_n] = b'[a'_1, dots, a'_n]$
]) <equality_theorem_term_corollary>

#corollary([
    let $cal(cal(T))$ be theory, let $A$ be formula, let $a_1, dots, a_n$ be replacable terms in $A$, let $A'$ be variant of $A$ obtained by replacing $a_1, dots, a_n$ to $a'_1, dots, a'_n$, then \ $tack a_1 = a'_1 -> dots -> tack a_n = a'_n -> (A[a_1, dots, a_n] <-> A'[a'_1, dots, a'_n])$
]) <equality_theorem_formula_corollary>

#corollary([
    let $cal(cal(T))$ be theory, let $A$ be formula, let $a, x$ be terms in $A$, let $x$ not in $a$, then $tack A_x [a] <-> exists x (x = a and A)$
]) <equality_theorem_substitution_corollary>

== Prenex Form

#definition(title: "prenex form and prenex operations", [
    let $cal(cal(T))$ be theory, let $A$ be formula, let $B$ be open formula in $A$, let $x_1, dots, x_n$ be variables in $A$, let $Q_1, dots, Q_n$ be quantifiers $exists$ or $forall$, then $A' = Q_1 x_1 dots Q_n x_n B$ is a *prenex form*, where $Q_1 x_1 dots Q_n x_n$ is the *prefix*, and $B$ is the *matrix*

    we then define *prenex operations* that turns a formula into prenex form, let $Q$ be $exists$ or $forall$, let $Q'$ be $exists$ if $Q$ is $forall$, $forall$ if $Q$ is $exists$
    + replace $A$ by its variant
    + replace part $not Q x B$ of $A$ by $Q' x not B$
    + replace part $Q x B or C$ of $A$ by $Q x (B or C)$ where $x$ is not free in $C$
    + replace part $B or Q x C$ of $A$ by $Q x (B or C)$ where $x$ is not free in $B$
    + replace part $Q x B -> C$ of $A$ by $Q' x (B -> C)$ where $x$ is not free in $C$
    + replace part $B -> Q x C$ of $A$ by $Q x (B -> C)$ where $x$ is not free in $B$
    + replace part $Q x B and C$ of $A$ by $Q x (B and C)$ where $x$ is not free in $C$
    + replace part $B and Q x C$ of $A$ by $Q x (B and C)$ where $x$ is not free in $B$
]) <prenex_form>

== Additional Notes

#proposition([
    let $cal(T)$ be first-order theory, let $P, Q, R, S$ be formulas in $cal(T)$, then
    + $(P -> Q) -> ((Q -> R) -> (P -> R))$
    + $P -> ((P -> Q) -> Q)$
    + $(P -> Q) -> ((R -> S) -> (P or R) -> (Q or S))$
    + $P -> (P or R)$
    + $(P -> R) -> ((Q -> R) -> ((P or Q) -> R))$
    + $(P -> Q) -> ((Q -> P) -> (P <-> Q))$
]) <useful_tautology_formulas_proposition>

#pagebreak()

= The Characterization Problem

== The Reduction Theorem

#definition(title: "characterization problem", [
    let $F$ be any formal system, then finding a necessary and sufficient condition that a formula $A$ of $F$ is a theorem of $F$ is called the *characterization problem* for $F$
]) <characterization_problem_definition>

#definition(title: "extension for language and theory", [
    let $L$ be first-order language, then $L'$ is *extension* of $L$ if every nonlogical symbol of $L$ is nonlogical symbol of $L'$

    let $cal(T)$ be first-order theory, then $cal(T)'$ is *extension* of $cal(T)$ if $L(cal(T)')$ is extension of $L(cal(T))$ and every theorem of $cal(T)$ is a theorem of $cal(T)'$

    if $cal(T)'$ is *conservative* extension of $cal(T)$, then every formula of $cal(T)$ which is a theorem of $cal(T)'$ is also a theorem of $cal(T)$

    theories $cal(T)$ and $cal(T)'$ are *equivalent* if each ore extensions of the other
]) <extension_language_theory_definition>

#corollary([
    let $cal(T), cal(T)'$ be first-order theory, then if $cal(T), cal(T)'$ are equivalent, the characterization problems of $cal(T), cal(T)'$ are equivalent
]) <equivalent_characterization_problems_corollary>

#definition([
    let $cal(T)$ be first-order theory, let $Gamma$ be set of formulas, then denote $cal(T)[Gamma]$ as extension of $cal(T)$ accepting all formulas in $Gamma$ as nonlogical axioms
]) <nonlogical_set_theory_extension_notation_definition>

#theorem(title: "reduction theorem", [
    let $cal(T)$ be first-order theory, let $Gamma$ be set of formulas in $cal(T)$, let $A$ be formula of $cal(T)$, then $A$ is a theorem of $cal(T)[Gamma]$ iff there is a theorem of $cal(T)$ of form $B_1 -> dots -> B_n -> A$ where each $B_i$ is the closure of formula in $Gamma$
]) <reduction_theorem>

#definition(title: "consistency", [
    let $cal(T)$ be first-order theory, the it is *inconsistent* if every formula in $cal(T)$ is a theorem of $cal(T)$, otherwise *consistent*
]) <theory_consistency_definition>

#theorem(title: "reduction theorem for consistency", [
    let $cal(T)$ be first-order theory, let $Gamma$ be nonempty set of formulas in $cal(T)$, let $A_1, dots, A_n in Gamma$ be arbitrarily distinct, let $A'_1, dots, A'_n$ be closure of $A_1, dots, A_n$, then $cal(T)[Gamma]$ is inconsistent iff exists any \ $tack_(cal(T)[Gamma]) not A'_1 or dots not A'_n$
]) <reduction_theorem_for_consistency>

#corollary([
    let $cal(T)$ be first-order theory, let $A$ be formula, let $A'$ be closure of $A$, then $tack_cal(T) A$ iff $cal(T)[not A']$ is inconsistent
]) <inconsistency_theorem_negation_corollary>

== The Completeness Theorem

#theorem(title: "Completeness Theorem, First Form (Gödel)", [
    A formula $A$ of a theory $cal(T)$ is a theorem of $cal(T)$ iff it is valid in $cal(T)$
]) <completeness_theorem_first_form>

#theorem(title: "Completeness Theorem, Second Form", [
    A theory $cal(T)$ is consistent iff it has a model
]) <completeness_theorem_second_form>

#definition(title: "restriction and expansion", [
    let $cal(T)$ be theory, let $L$ be first-order language, let $L'$ be first-order language extension of $L$, let $cal(A)'$ be structure of $L'$, we obtain $cal(A)$ a *restriction* of $cal(A)'$ to $L$ denote as $cal(A)'|_L$, and $cal(A)'$ an *expansion* of $cal(A)$

    then $cal(A)'$ and $cal(A)$ have same individuals, thus $cal(A)(A) = cal(A)'(A)$ for every closed formula $A$ of $L(cal(A))$
]) <restriction_expansion_definition>

#lemma([
    let $cal(T)$ be theory, let $cal(T)'$ be extension of $cal(T)$, let $cal(A)'$ be model of $cal(T)'$, then restriction $cal(A)'|_(L(cal(T)))$ is a model of $cal(T)$
]) <restriction_model_lemma>

#definition(title: "canonical structure", [
    a *canonical structure* is built from theory using its own syntatic objects as the domain
]) <canonical_structure_definition>

#definition(title: "equivalence class", [
    let $cal(T)$ be theory, let $cal(A)$ be canonical structure of $cal(T)$, the *equivalence class* of $a$ is denoted as $a^circle.small$, let $b$ be variable, then define $a tilde b$ to be $tack_cal(T) a = b$
]) <equivalence_class_definition>

#definition(title: "Henkin theory", [
    a theory $cal(T)$ is *Henkin theory* if for every closed instantiation $exists x A$ of $cal(T)$, there is a constant $e$ such that $tack_cal(T) exists x A -> A_x [e]$
]) <henkin_theory_definition>

#definition(title: "decidibility", [
    let $cal(T)$ be theory, let $A$ be formula
    - if neither $A$ nor $not A$ is a theorem of $cal(T)$, then $A$ is *undecidible*
    - otherwise *decidible*
]) <decidibility_definition>

#definition(title: "complete", [
    let $cal(T)$ be theory, then $cal(T)$ is *complete* if it is consistent and if every closed formula in $cal(T)$ is decidable in $cal(T)$
]) <complete_theory_definition>

#lemma([
    let $cal(T)$ be complete Henkin theory, let $cal(A)$ be canonical structure for $cal(T)$, let $A$ be closed formula of $cal(T)$, then $cal(A)(A) = T$ iff $A$ is a theorem of $cal(T)$
]) <complete_henkin_theory_theorem_closed_formula_lemma>

#corollary([
    let $cal(T)$ be complete Henkin theory, then canonical structure of $cal(T)$ is a model of $cal(T)$
]) <complete_henkin_theory_canonical_structure_model_corollary>

#definition(title: "special constants and axioms", [
    let $L$ be first-order language, then define *special constants* of level $n$ as constant represented by other constants at most level $n - 1$ for instantiations

    denote language obtained from $L$ by adding all special constants of all levels as $L_c$, let $r$ be special constant for $exists x A$, where $A$ is a formula, then $exists x A -> A_x [r]$ is the *special axiom* for $r$

    let $cal(T)$ be theory with language $L$, define $cal(T)_c$ as theory of language $L_c$, with nonlogical axioms of $cal(T)$ and special axioms for special constants of $L_c$, then $cal(T)_c$ is Henkin theory
]) <special_constants_axioms_definition>

#lemma([
    let $cal(T)$ be theory of language $L$, let $cal(T)_c$ be extension of $cal(T)$ of special axioms for special constants of language $L_c$, then $cal(T)_c$ is a conservative extension of $cal(T)$
]) <special_axiom_extension_conservative_extension_lemma>

#definition(title: "finite character", [
    let $E$ be set, let $J$ be class of subsets of $E$, then $J$ has *finite character* if every subset $A$ of $E$, where $A in J <=> forall B subset A, s0 B in J$

    a set $A$ in $J$ is *maximal element* of $J$ if $A$ is not a subset of any other elements of $J$
]) <finite_character_definition>

#lemma(title: "Teichmüller-Tukey lemma", [
    let $J$ be nonempty class of subsets of $E$ which is a finite character, then $J$ contains a maximal element
]) <teichmuller_tukey_lemma>

#definition(title: "simple extension", [
    let $cal(T)$ be theory, let $cal(T)'$ be *simple extension* of $cal(T)$, then $cal(T), cal(T)'$ have same language
])

#theorem(title: "Lindenbaum's theorem", [
    let $cal(T)$ be consistent theory, then $cal(T)$ has a complete simple extension
]) <lindenbaum_theorem>

#lemma([
    let $cal(T)$ be theory, let $U$ be consistent simple extension of $cal(T)_c$, then $U$ has a model $cal(A)$ such that each individual of $cal(A)$ is $cal(A)(r)$ for infinitely many special constants $r$
]) <consistent_simple_extension_infinitely_constant_model_lemma>

#corollary([
    let $cal(T), cal(T)'$ be theories with same language, then $cal(T)'$ is extension of $cal(T)$ iff every model of $cal(T)'$ is model of $cal(T)$

    $cal(T)$ and $cal(T)'$ are equivalent iff they have same models
]) <same_langauge_model_equivalent_corollary>

== The Consistency Theorem

#definition(title: "open theory", [
    let $cal(T)$ be a theory, then $cal(T)$ is *open* if every of its nonlogical axioms are open
]) <open_theory_definition>

#definition(title: "formula belongings", [
    let $cal(T)$ be a theory, let $r$ be a special constant for formula $exists x A$, then a formula *belongs to* $r$ is either 
    - special axiom for $r$
    - closed substitution of form $A_x [a] -> exists x A$
]) <formula_belonging_definition>

#definition(title: $Delta(cal(T))$, [
    let $cal(T)$ be theory, let $cal(T)_c$ be theory extension of $cal(T)$ by special axioms, then define $Delta(cal(T))$ as set of formulas in $cal(T)_c$ that either
    - belongs to some special constants
    - closed instances of identity axioms, equality axioms, nonlogical axioms of $cal(T)$
]) <delta_theory_set_definition>

#lemma([
    let $cal(T)$ be theory, let $A$ be formula in $cal(T)$, if $tack_cal(T) A$, let $A'$ be closed instance of $A$ in $L(cal(T)_c)$, then $A'$ is tautological consequence of formulas in $Delta(cal(T))$
]) <logical_consequence_delta_theory_lemma>

#definition(title: "quasi-tautology", [
    let $cal(T)$ be theory, let $A$ be formula in $cal(T)$, then $A$ is *quasi-tautology* if $A$ is tautological consequence of instances of identity axioms and equality axioms
]) <quasi_tautology_definition>

#definition(title: "special sequence", [
    let $cal(T)$ be theory, let $A_1, dots, A_n$ be formulas in $cal(T)$, then $A_1, dots, A_n$ is *special sequence* if \ $not A_1 or dots or not A_n$ is tautology
]) <special_sequence_definition>

#definition(title: "rank of special constants", [
    let $cal(T)$ be theory, let $r$ be special constants of formula $exists x A$, then *rank* or $r$ is the number of occurence of symbol $exists$ in $exists x A$

    then define $Delta_n (cal(T)) = {exists x A in Delta (cal(T)) | exists x A "belongs to" r and rank r <= n}$
]) <rank_of_special_constants_definition>

#lemma([
    let $n > 0$, let $cal(T)$ be theory, let there be special sequence consisting formulas in $Delta_n (cal(T))$, then there is a special sequence consists of formulas in $Delta_(n - 1) (cal(T))$
]) <special_sequence_constant_rank_reduction_lemma>

#theorem(title: "consistency theorem (Hilbert-Ackermann)", [
    an open theory $cal(T)$ is inconsistent iff there is a quasi-tautology which is in form $not A_1 or dots or not A_n$ where each $A_i$ is instance of nonlogical axioms
]) <consistency_theorem>

== Herbrand's Theorem

#definition(title: "existensial formula", [
    let $A$ be formula, then $A$ is *existensial* if all of its quantifiers are $exists$, and $A$ is in prenex form
]) <existensial_formula_definition>

#lemma([
    let $cal(T)$ be theory with no nonlogical axioms, let $A$ be closed existensial formula of $cal(T)$, then $tack_cal(T) A$ iff there is a quasi-tautology of disjunction of instances of matrix of $A$
]) <existensial_closed_formula_theorem_condition_lemma>

#definition(title: "special equality axiom", [
    let $cal(T)$ be theory with no nonlogical axioms, let $cal(T)_c$ be extension of $cal(T)$ by adding all special variables, let $A, B$ be formulas of $cal(T)$, let $r, s$ be special variables for $exists x A, s0 exists x B$ respectively, then define *special equality axiom* as
    $
        forall x (A <-> B) -> r = s
    $
]) <special_equality_axiom_definition>

#lemma([
    let $cal(T)$ be a theory, let $cal(T)_c$ be extension of $cal(T)$ by adding all special variables, let $cal(T)'_c$ be extension of $cal(T)_c$ by adding special equality axioms to $cal(T)_c$, then $cal(T)_c$ and $cal(T)'_c$ are conservative extensions
]) <conservative_extension_special_eq_axiom_lemma>

#definition(title: $A_H$, [
    let $A$ be a formula of form $exists x_1 dots exists x_n forall y B$, then we define $A^* = exists x_1 dots exists x_n B_y [f x_1 dots x_n]$ for some \ $n$-ary function $f$, then define $A^(**), ...$ until $A_H$ which is an existensial formula derived using the same rule from $A^*$
]) <existensial_formula_deduction_definition>

#theorem(title: "Herbrand's theorem", [
    let $cal(T)$ be theory with no nonlogical axioms, let $A$ be closed formula of prenex form in $cal(T)$, then \ $tack_cal(T) A$ iff there is a quasi-tautology of disjucntion of instances of matrix of $A_H$
]) <herbrand_theorem>

== Addition on Function Symbols

#theorem(title: "theorem on functional extension", [
    let $cal(T)$ be theory, let $x, y_1, dots, y_n$ be distinct variables, let $exists x A$ be theorem of $cal(T)$ which no variables other than $y_1, dots, y_n$ is free, let $cal(T)'$ be theory obtained from $cal(T)$ adding new $n$-ary function symbol $f$ and new nonlogical axiom $A_x [f y_1 dots y_n]$, then $cal(T)'$ is conservative extension of $cal(T)$
]) <functional_extension_theorem>

#definition(title: "universal", [
    let $A$ be formula, then $A$ is universal if all of its quantifiers are $forall$, and $A$ is in prenex form
]) <universal_formula_definition>

#definition(title: $A_S$, [
    let $A$ be formula of form $forall x_1 dots forall x_n exists y B$, then we define $A^circle.small = forall x_1 dots forall x_n B_y [f x_1 dots x_n]$ for some \ $n$-ary function $f$, then define $A^(circle.small circle.small), dots$ until $A_S$ which is an universal formula derived using the same rule from $A^circle.small$
]) <universal_formula_deduction_definition>

#theorem(title: "Skolem's theorem", [
    every theory has an open conservative extension
]) <skolem_theorem>

