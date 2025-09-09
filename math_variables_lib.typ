#let current-chapter-title() = context {
    let head = query(heading.where(level: 1).before(here()))
    if head != () { head.last().body }
}

#let col-thm = blue
#let col-def = green.darken(15%)
#let col-ex  = orange
#let col-rem = gray
#let col-sol = teal

#let lightfill(c, body) = box(
    fill: luma(98%),
    stroke: 1pt + c,
    radius: 6pt,
    inset: 10pt,
    width: 100%,
    body,
)

#let c-ch  = counter("ch")
#let c-thm = counter("thm")
#let c-lem = counter("thm")
#let c-prp = counter("thm")
#let c-cor = counter("thm")
#let c-def = counter("thm")
#let c-ex  = counter("ex")
#let c-exr = counter("exr")

#let make-env(kind, c: none, color: blue, title: none, body: content) = {
    if c != none { c.step() }
    block[#lightfill(color, [
        *#kind* #if c != none {context [#c-ch.display("1").#c.display("1")]}
        #if title != none {[*-- #title*]}:

        #body
    ])]
}

#let theorem(title: none, body) = make-env("Theorem", c: c-thm, color: col-thm, title: title, body: body)
#let lemma(title: none, body) = make-env("Lemma", c: c-lem, color: col-thm, title: title, body: body)
#let proposition(title: none, body) = make-env("Proposition", c: c-prp, color: col-thm, title: title, body: body)
#let corollary(title: none, body) = make-env("Corollary", c: c-cor, color: col-thm, title: title, body: body)
#let definition(title: none, body) = make-env("Definition", c: c-def, color: col-def, title: title, body: body)
#let example(title: none, body) = make-env("Example", c: c-ex, color: col-ex, title: title, body: body)
#let remark(title: none, body) = block(lightfill(col-rem, [
    *Remark* #if title != none {[*-- #title*]}:

    #body
]))
#let exercise(title: none, body) = make-env("Exercise", c: c-exr, color: col-ex, title: title, body: body)
#let solution(title: none, show-solutions: true, body) = {
    if show-solutions {
        make-env("Solution", color: col-sol, title: title, body: body)
    } else { [] }
}
#let proof(body) = block(lightfill(col-rem, [
    *Proof.* #body
    #align(right)[□]
]))
#let todo(text) = block(lightfill(red, [*TODO:* #text]))

#let thetxt(id) = context [ Theorem #counter("ch").at(id).first().#( counter("thm").at(id).first()+1 )]
#let lemtxt(id) = context [ Lemma #counter("ch").at(id).first().#( counter("thm").at(id).first()+1 )]
#let protxt(id) = context [ Proposition #counter("ch").at(id).first().#( counter("thm").at(id).first()+1 )]
#let cortxt(id) = context [ Corollary #counter("ch").at(id).first().#( counter("thm").at(id).first()+1 )]
#let deftxt(id) = context [ Definition #counter("ch").at(id).first().#( counter("thm").at(id).first()+1 )]
#let extxt(id) = context [ Example #counter("ch").at(id).first().#( counter("ex").at(id).first()+1 )]
#let exetxt(id) = context [ Exercise #counter("ch").at(id).first().#( counter("exr").at(id).first()+1 )]

#let theref(id) = link(id, thetxt(id))
#let lemref(id) = link(id, lemtxt(id))
#let proref(id) = link(id, protxt(id))
#let corref(id) = link(id, cortxt(id))
#let defref(id) = link(id, deftxt(id))
#let exref(id)  = link(id, extxt(id))
#let exeref(id) = link(id, exetxt(id))

#let s0 = h(0.2cm)
#let h0 = h(0.5cm)
#let h1 = h(1cm)
#let h2 = h(1.5cm)
#let h3 = h(2cm)

#let suchthat = " such that "
#let mif = " if "
#let existsunique = $exists excl s0$
#let rank = "rank"
#let nullity = "nullity"
#let null = "null"
#let range = "range"
#let mlet = "let"