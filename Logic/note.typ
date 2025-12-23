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

The first mathematical laws cannot be proved, it needs to be accepted before deriving any other laws. Those laws to be accepted are *axioms* which conveys some *basic concepts*. 

Mathematics should explain the basic concepts and axioms so that its audiences accept it. Then he define derived concepts to prove theorems about basic and derived concepts. Then construct system of basic concepts, derived concepts, axioms, and theorems, called *axiom system*

== Formal Systems

An axiom or theorem can be viewed as a *sentence*, thus a concrete object, or a *meaning of a sentence*. 

Proof dealing with concrete objects in constructive manner is *finitary*. A proof is finitary if we can *visualize* the proof.

The study of axioms and theorems as sentences is called *syntatical study* of axiom systems.
The study of meaning of the sentences is called *semantical study* of axiom systems.

For syntatical study, we need *formal system*, namely syntatical part of an axiom system.

Formal system consists of *language*, *axioms*, and *rules of inference*.

Language consists of *symbols*, a finite sequence of symbols of a language is an *expression*, each appearance of an expression is an *occurence*. For expressions to be meaningfull, it must state some facts, which made it a *formula* of a language. Denote language of a formal system $F$ as $L(F)$

Axioms should be formula of the language of the formal system.

Rules state that under certain condition, some formulas called *hypotheses* can *infer* a formula called *conclusion*. A formal system should have two laws:
+ the axioms of $F$ are theorems of $F$
+ if all hypothesis of a rule of $F$ are theorems of $F$, then the conclusion of the rule is a theorem of $F$
Then a formula is a theorem of $F$ iff it follows the rules.

A *generalized inductive definition* is process that define a set of laws $S_0$ by rule 1, then define laws given theorems in $S_0$ as $S_1$, then go on for $S_omega$ such that no further theorems can be derived.

To prove every theorem of $F$ has property $P$, then is suffice to prove
+ every axiom of $F$ has property $P$
+ if all hypotheses of rule of $F$ have property $P$, then conclusion of the rule has property $P$

Then for each member of sets $S_0, S_1, dots S_omega$ has property $P$, which is prove by *induction on theorems*, the hypotheses are *induction hypotheses*

A rule of formal system $F$ is *finite* if it has only finitely many hypotheses.

A *proof* in $F$ mean a finite sequence of formulas, which are conclusions of some theorems. If the last formula of proof $P$ is $A$, then $P$ is proof of $A$.

A formula $A$ of $F$ is a theorem iff there is a proof of $A$, denoted as $tack_F dots$ as abbreviation of $dots$ is a theorem of $F$

For abbreviations, we introduce *defined symbols*, the formulas using defined symbols are *defined formulas*, for each defined symbols, there must be *definition* of the symbols.

Note the defined symbols are not symbols of the language, they only refer to the actual symbols abbreviated in the language.

== Syntatical Variables

A *syntatical variables* are symbols that vary through expressions of the language. A formula containing syntatical variables may have many meanings.
