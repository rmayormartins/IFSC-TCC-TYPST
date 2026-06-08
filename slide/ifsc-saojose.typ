// =============================================================================
//  IFSC TCC Typst  |  Modelo de apresentação (slides, tema IFSC)
// -----------------------------------------------------------------------------
//  Arquivo .....: ifsc-saojose.typ
//  Descrição ...: tema dos slides de defesa (estilo beamer institucional IFSC),
//                 inspirado no padrão usado nos TCCs do Campus São José.
//
//  Autor .......: Ramon Mayor Martins
//  Site ........: https://rmayormartins.github.io
//  E-mail ......: ramon.mayor@ifsc.edu.br
//  Repositório .: https://github.com/rmayormartins/IFSC-TCC-TYPST
// 
//  Versão ......: 0.2  (08/jun/2026)
//  Para ........: Engenharia de Telecomunicações
//  Licença .....: MIT
// -----------------------------------------------------------------------------
//  Como usar (ver exemplo.typ):
//     #import "ifsc-saojose.typ": *
//     #show: apresentacao.with(logo: image("logo-ifsc.png", height: 1.1cm))
//     #slide-titulo(titulo: "...", autores: ("Fulano",), ...)
//     #slide(titulo: "Motivacao")[ ... ]
//
//  Funções disponíveis:
//     apresentacao(..)   -> configuração global (aplicar com #show:)
//     slide-titulo(..)   -> slide de abertura
//     slide(titulo: ..)  -> slide de conteúdo
//     bloco(titulo: ..)  -> caixa destacada (estilo "Objetivo Geral")
//     tabela-resultados()-> tabela estilo booktabs (cabeçalho verde)
//     fonte(..)          -> legenda de figura ("Fonte: ...")
// =============================================================================

// ---------- Paleta institucional ----------
#let ifsc-verde         = rgb("#23553A")   // verde das barras e titulos
#let ifsc-verde-escuro  = rgb("#1B4630")   // cabecalho do bloco
#let ifsc-bloco-fundo   = rgb("#E9EEEA")   // corpo do bloco
#let ifsc-texto         = rgb("#1A1A1A")

// ---------- Dimensoes da pagina (proporcao 4:3) ----------
#let _w     = 25cm
#let _h     = 18.75cm
#let _mx    = 1.5cm      // margem horizontal
#let _mtop  = 1.4cm      // margem superior
#let _mbot  = 1.25cm     // margem inferior
#let _barra = 0.85cm     // altura da barra de rodape

// ---------- Marcador de lista (quadrado verde) ----------
#let _quad = box(width: 0.36em, height: 0.36em, fill: ifsc-verde, baseline: 0.02em)

// ---------- Legenda de figura ----------
#let fonte(txt) = align(center, text(size: 0.78em, fill: ifsc-texto)[Fonte: #txt])

// ---------- Rodape full-bleed (barra verde) ----------
#let _rodape(instituicao, logo) = context {
  let n     = counter(page).get().first()
  let total = counter(page).final().first()
  place(top + left, dx: -_mx, dy: _mbot - _barra,
    box(width: _w, height: _barra, fill: ifsc-verde)[
      #place(center + horizon, text(fill: white, weight: "bold", size: 9.5pt, instituicao))
      #place(right + horizon, dx: -1.55cm, text(fill: white, size: 9.5pt)[#n/#total])
    ]
  )
  // logo no canto inferior direito (sobrepoe levemente a barra)
  if logo != none {
    place(top + right, dx: 0pt, dy: _mbot - _barra - 0.18cm, logo)
  }
}

// ---------- Configuracao global ----------
#let apresentacao(
  // New Computer Modern Sans replica o visual do beamer (presente no app Typst
  // e instalacoes completas). DejaVu Sans entra como fallback garantido.
  fonte-principal: ("New Computer Modern Sans", "DejaVu Sans"),
  instituicao: "Instituto Federal de Santa Catarina",
  logo: none,
  body,
) = {
  set page(
    width: _w, height: _h,
    margin: (left: _mx, right: _mx, top: _mtop, bottom: _mbot),
    footer-descent: 0pt,
    footer: _rodape(instituicao, logo),
  )
  set text(font: fonte-principal, size: 15pt, fill: ifsc-texto,
           lang: "pt", region: "br")
  set par(leading: 0.7em, spacing: 1.15em, justify: false)
  set list(marker: (_quad, _quad), indent: 0.4em, spacing: 1.0em, body-indent: 0.55em)
  set enum(indent: 0.4em, spacing: 1.0em, numbering: n => box(
    fill: ifsc-verde, inset: (x: 4pt, y: 1pt), radius: 1pt,
    text(fill: white, weight: "bold", size: 0.78em, str(n)),
  ))
  show emph: it => text(style: "italic", it.body)
  body
}

// ---------- Slide de abertura ----------
#let slide-titulo(
  codigo: none,
  titulo: "",
  autores: (),
  curso: none,
  instituicao: "Instituto Federal de Santa Catarina",
  campus: "campus Sao Jose",
  data: none,
) = {
  pagebreak(weak: true)
  v(0.9cm)
  align(left, box(width: 72%, height: 5pt, fill: ifsc-verde, radius: 1pt))
  v(0.5cm)
  align(center)[
    #if codigo != none [
      #text(size: 23pt, weight: "bold", fill: ifsc-verde, codigo) \
    ]
    #text(size: 19pt, weight: "bold", fill: ifsc-verde, titulo)

    #v(1.7cm)
    #set par(leading: 0.85em)
    #text(size: 16pt, autores.join("\n"))

    #v(1.1cm)
    #if curso != none [ #text(size: 12.5pt, curso) \ ]
    #text(size: 12.5pt, instituicao) \
    #text(size: 12.5pt, campus)

    #if data != none [
      #v(1.3cm)
      #text(size: 16pt, data)
    ]
  ]
}

// ---------- Slide de conteudo ----------
#let slide(titulo: none, body) = {
  pagebreak(weak: true)
  if titulo != none {
    text(size: 19pt, weight: 600, fill: ifsc-verde, titulo)
    v(-0.45cm)
    line(length: 100%, stroke: 1.1pt + ifsc-verde)
    v(0.45cm)
  }
  body
}

// ---------- Bloco destacado (estilo "Objetivo Geral") ----------
#let bloco(titulo: "", body) = {
  block(width: 100%, breakable: false, below: 0.9em)[
    #block(width: 100%, fill: ifsc-verde-escuro, radius: (top: 3pt),
           inset: (x: 11pt, y: 6pt))[
      #text(fill: white, weight: "bold", size: 15pt, titulo)
    ]
    #block(width: 100%, fill: ifsc-bloco-fundo, radius: (bottom: 3pt),
           inset: (x: 11pt, y: 10pt))[
      #set par(leading: 0.7em)
      #body
    ]
  ]
}

// ---------- Tabela estilo booktabs (cabecalho verde) ----------
// colunas: lista de larguras; cabecalho: array de celulas; linhas: array de arrays
#let tabela-resultados(colunas: (), cabecalho: (), linhas: ()) = {
  set text(size: 11pt)
  table(
    columns: colunas,
    align: (col, row) => if col <= 1 { left + horizon } else { center + horizon },
    stroke: none,
    inset: (x: 5pt, y: 4pt),
    table.hline(stroke: 1pt + ifsc-verde),
    table.header(..cabecalho.map(c => text(weight: "bold", fill: ifsc-verde, c))),
    table.hline(stroke: 0.6pt + ifsc-verde),
    ..linhas.flatten().map(c => [#c]),
    table.hline(stroke: 1pt + ifsc-verde),
  )
}
