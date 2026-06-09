// =============================================================================
//  IFSC TCC Typst  |  Modelo de monografia (ABNT / IFSC)
// -----------------------------------------------------------------------------
//  Arquivo .....: ifsc-template.typ
//  Descrição ...: tema e regras de formatação da monografia, conforme o
//                 Manual de Normalização SiBI/IFSC (rev. 08/abr/2025) e a
//                 ABNT NBR 14724, 6024, 6027 e 6023.
//
//  Autor .......: Ramon Mayor Martins
//  Site ........: https://rmayormartins.github.io
//  E-mail ......: ramon.mayor@ifsc.edu.br
//  Repositório .: https://github.com/rmayormartins/IFSC-TCC-TYPST
//
//  Versão ......: 0.2  (08/jun/2026)
//  Licença .....: MIT
// -----------------------------------------------------------------------------
//  Notas desta versão: paginação ABNT; títulos sem indicativo centralizados;
//  listas de ilustrações/tabelas/quadros automáticas; numeração de equações;
//  funções figura/tabela/quadro com fonte e referência cruzada; apêndices e
//  anexos parametrizados; hierarquia de seções por nível.
// =============================================================================

// =====================================================================
//  Espacamentos (Quadro 1: texto em 1,5; excecoes em simples)
// =====================================================================
#let _esp-texto   = 1.0em    // aproxima o espacamento 1,5 entre linhas
#let _esp-simples = 0.5em    // espacamento simples (fontes, referencias, natureza...)
#let _recuo       = 1.25cm   // recuo de primeira linha dos paragrafos

// =====================================================================
//  Helpers exportados para o corpo / pos-textuais
// =====================================================================

// Titulo sem indicativo de secao: centralizado, maiusculo, negrito (secao 2.4).
// Aparece no sumario (e um heading nivel 1 sem numeracao).
#let titulo-livre(corpo) = heading(level: 1, numbering: none, corpo)

#let apendice(id, titulo, corpo) = {
  titulo-livre[APÊNDICE #id #sym.dash.en #titulo]
  corpo
}
#let anexo(id, titulo, corpo) = {
  titulo-livre[ANEXO #id #sym.dash.en #titulo]
  corpo
}

// Ilustracao (figura): titulo em cima, fonte embaixo (secao 2.11).
#let figura(titulo, corpo, fonte: [elaborada pelo próprio autor.]) = figure(
  {
    corpo
    v(0.3em)
    block(text(size: 10pt)[Fonte: #fonte])
  },
  caption: titulo,
  kind: image,
  supplement: [Figura],
)

// Tabela: dados numericos, formato aberto (sem bordas laterais), normas IBGE.
#let tabela(titulo, corpo, fonte: [elaborada pelo próprio autor.]) = figure(
  {
    corpo
    v(0.3em)
    block(text(size: 10pt)[Fonte: #fonte])
  },
  caption: titulo,
  kind: table,
  supplement: [Tabela],
)

// Quadro: informacoes textuais/comparativas, formato fechado (com bordas).
#let quadro(titulo, corpo, fonte: [elaborado pelo próprio autor.]) = figure(
  {
    corpo
    v(0.3em)
    block(text(size: 10pt)[Fonte: #fonte])
  },
  caption: titulo,
  kind: "quadro",
  supplement: [Quadro],
)

// =====================================================================
//  Template principal
// =====================================================================
#let ifsc-template(
  titulo: "",
  subtitulo: "",
  autor: "",
  orientador: "",
  coorientador: "",
  campus: "São José",
  curso: "Engenharia de Telecomunicações",
  tipo-trabalho: "Trabalho de Conclusão de Curso",
  grau: "Bacharel em Engenharia de Telecomunicações",
  cidade: "São José",
  ano: "",
  mes: "",
  data-defesa: none,          // ex.: "28 de junho de 2025"
  banca: (),                  // lista de (nome: .., instituicao: ..)
  dedicatoria: none,
  agradecimentos: none,
  epigrafe: none,
  resumo: none,
  palavras-chave: (),
  abstract: none,
  keywords: (),
  lista-figuras: false,
  lista-tabelas: false,
  lista-quadros: false,
  bibliografia: none,
  glossario: none,            // conteudo opcional
  apendices: none,            // conteudo opcional (use a funcao apendice(...))
  anexos: none,               // conteudo opcional (use a funcao anexo(...))
  fonte-principal: "Arial",   // Quadro 1: Arial ou Times New Roman
  body,
) = {
  set document(title: titulo, author: autor)

  // ---------- Pagina e fonte (secoes 2.1 e 2.2) ----------
  set page(
    paper: "a4",
    margin: (top: 3cm, bottom: 2cm, left: 3cm, right: 2cm),
  )
  set text(
    font: (fonte-principal, "Liberation Sans", "TeX Gyre Heros", "DejaVu Sans"),
    size: 12pt,
    fill: black,
    lang: "pt", region: "br",
  )
  set par(justify: true, leading: _esp-texto, first-line-indent: _recuo, spacing: _esp-texto)

  // ---------- Numeracao progressiva (secao 2.6) ----------
  set heading(numbering: "1.1.1.1.1 ")

  // ---------- Ilustracoes / equacoes (secoes 2.10 e 2.11) ----------
  set figure.caption(position: top, separator: [#h(0.25em)#sym.dash.en#h(0.25em)])
  show figure.caption: set text(size: 12pt)
  show figure.caption: set par(leading: _esp-simples, justify: false)
  set figure(gap: 0.6em)
  set math.equation(numbering: "(1)")

  // =================================================================
  //  ELEMENTOS PRE-TEXTUAIS
  // =================================================================

  // ---------- CAPA (nao contada, nao numerada) ----------
  page[
    #set par(leading: _esp-texto, first-line-indent: 0cm)
    #align(center + horizon)[
      #v(-2cm)
      #text(weight: "bold", size: 12pt)[
        INSTITUTO FEDERAL DE SANTA CATARINA

        CAMPUS #upper(campus)

        CURSO DE #upper(curso)
      ]
      #v(4cm)
      #text(size: 12pt)[#upper(autor)]
      #v(4cm)
      #block(width: 85%)[
        #set text(size: 12pt, weight: "bold")
        #set par(leading: _esp-texto)
        #align(center)[
          #upper(titulo)
          #if subtitulo != "" [#linebreak() #upper(subtitulo)]
        ]
      ]
      #v(1fr)
      #text(size: 12pt)[#upper(cidade) #linebreak() #ano]
    ]
  ]

  // A contagem comeca na folha de rosto (secao 2.3): zera aqui.
  counter(page).update(1)

  // ---------- FOLHA DE ROSTO ----------
  page[
    #set par(first-line-indent: 0cm, justify: true, leading: _esp-texto)
    #v(2cm)
    #align(center)[#text(size: 12pt)[#upper(autor)]]
    #v(4cm)
    #align(center)[
      #block(width: 85%)[
        #set text(size: 12pt, weight: "bold")
        #set par(leading: _esp-texto)
        #align(center)[
          #upper(titulo)
          #if subtitulo != "" [#linebreak() #upper(subtitulo)]
        ]
      ]
    ]
    #v(2.5cm)
    #align(right)[
      #box(width: 8.5cm)[
        #set par(first-line-indent: 0cm, justify: true, leading: _esp-simples)
        #set text(size: 10pt)
        #tipo-trabalho apresentado ao Curso de #curso do Instituto Federal de
        Santa Catarina, Campus #campus, como requisito parcial para obtencao do
        titulo de #grau.
        #if orientador != "" [#v(1em) Orientador: #orientador]
        #if coorientador != "" [#v(0.5em) Coorientador: #coorientador]
      ]
    ]
    #v(1fr)
    #align(center)[#text(size: 12pt)[#upper(cidade) #linebreak() #ano]]
  ]

  // ---------- FICHA CATALOGRAFICA (fonte 10, simples) ----------
  page[
    #v(1fr)
    #align(center)[
      #rect(width: 12cm, height: 8cm, stroke: 1pt)[
        #set text(size: 10pt)
        #set par(leading: _esp-simples, first-line-indent: 0cm)
        #align(left)[
          #v(0.5cm) #h(0.5cm)
          *Dados Internacionais de Catalogacao na Publicacao (CIP)*
          #v(1cm)
          A000a #h(0.5cm) #autor
          #h(1.5cm) #titulo #if subtitulo != "" [ : #subtitulo] / #autor. -- #cidade : Instituto Federal de Santa Catarina, #ano.
          #h(1.5cm) XXX f. : il.
          #v(0.5cm)
          #h(1.5cm) #tipo-trabalho -- Instituto Federal de Santa Catarina, Campus #campus, Curso de #curso, #ano.
          #h(1.5cm) Orientador: #orientador
          #if coorientador != "" [#h(1.5cm) Coorientador: #coorientador]
          #v(0.5cm)
          #h(1.5cm) 1. Telecomunicacoes. 2. Engenharia. I. Titulo.
          #v(1cm)
          #h(8cm) CDD XXX.XX
        ]
      ]
    ]
    #v(0.5cm)
    #align(center)[#text(size: 8pt)[Ficha catalografica elaborada pela Biblioteca do IFSC Campus #campus]]
  ]

  // ---------- FOLHA DE APROVACAO ----------
  page[
    #set par(first-line-indent: 0cm, justify: true, leading: _esp-texto)
    #v(2cm)
    #align(center)[#text(size: 12pt)[#upper(autor)]]
    #v(2cm)
    #align(center)[
      #block(width: 85%)[
        #set text(size: 12pt, weight: "bold")
        #set par(leading: _esp-texto)
        #align(center)[
          #upper(titulo)
          #if subtitulo != "" [#linebreak() #upper(subtitulo)]
        ]
      ]
    ]
    #v(1.5cm)
    #align(right)[
      #box(width: 8.5cm)[
        #set par(first-line-indent: 0cm, justify: true, leading: _esp-simples)
        #set text(size: 10pt)
        Este #tipo-trabalho foi julgado adequado para obtencao do titulo de
        #grau e aprovado em sua forma final pelo Curso de #curso do Instituto
        Federal de Santa Catarina, Campus #campus.
      ]
    ]
    #v(1cm)
    #align(center)[
      #cidade, #if data-defesa != none [#data-defesa] else [\_\_\_ de \_\_\_\_\_\_\_\_\_\_ de #ano].
    ]
    #v(2cm)
    #align(center)[
      #set par(leading: _esp-texto)
      #line(length: 8cm)
      #if orientador != "" [#orientador] else [Prof. Dr. Nome do Orientador]
      #linebreak() Instituto Federal de Santa Catarina
      #linebreak() Orientador
      #v(1.2cm)
      #if banca.len() > 0 [
        #for membro in banca [
          #line(length: 8cm)
          #membro.nome #linebreak() #membro.instituicao
          #v(1.2cm)
        ]
      ] else [
        #line(length: 8cm)
        Prof. Dr. Nome do Examinador 1 #linebreak() Instituicao
        #v(1.2cm)
        #line(length: 8cm)
        Prof. Dr. Nome do Examinador 2 #linebreak() Instituicao
      ]
    ]
  ]

  // ---------- DEDICATORIA (opcional, sem titulo) ----------
  if dedicatoria != none {
    page[
      #v(1fr)
      #align(right)[
        #box(width: 8cm)[
          #set par(first-line-indent: 0cm, justify: true, leading: _esp-texto)
          #set text(style: "italic")
          #dedicatoria
        ]
      ]
      #v(2cm)
    ]
  }

  // ---------- AGRADECIMENTOS (titulo centralizado, maiusc., negrito) ----------
  if agradecimentos != none {
    page[
      #v(2cm)
      #align(center)[#text(size: 12pt, weight: "bold")[AGRADECIMENTOS]]
      #v(2cm)
      #set par(first-line-indent: _recuo, justify: true, leading: _esp-texto)
      #agradecimentos
    ]
  }

  // ---------- EPIGRAFE (opcional, sem titulo) ----------
  if epigrafe != none {
    page[
      #v(1fr)
      #align(right)[
        #box(width: 8cm)[
          #set par(first-line-indent: 0cm, justify: false, leading: _esp-texto)
          #set text(style: "italic")
          #epigrafe
        ]
      ]
      #v(2cm)
    ]
  }

  // ---------- RESUMO ----------
  if resumo != none {
    page[
      #v(2cm)
      #align(center)[#text(size: 12pt, weight: "bold")[RESUMO]]
      #v(2cm)
      #set par(first-line-indent: 0cm, justify: true, leading: _esp-texto)
      #resumo
      #v(1.5em)
      #if palavras-chave.len() > 0 [
        #text(weight: "bold")[Palavras-chave:] #palavras-chave.join("; ").
      ]
    ]
  }

  // ---------- ABSTRACT ----------
  if abstract != none {
    page[
      #v(2cm)
      #align(center)[#text(size: 12pt, weight: "bold")[ABSTRACT]]
      #v(2cm)
      #set par(first-line-indent: 0cm, justify: true, leading: _esp-texto)
      #abstract
      #v(1.5em)
      #if keywords.len() > 0 [
        #text(weight: "bold")[Keywords:] #keywords.join("; ").
      ]
    ]
  }

  // ---------- LISTA DE ILUSTRACOES (automatica) ----------
  if lista-figuras {
    page[
      #v(2cm)
      #align(center)[#text(size: 12pt, weight: "bold")[LISTA DE ILUSTRAÇÕES]]
      #v(2cm)
      #outline(title: none, target: figure.where(kind: image))
    ]
  }

  // ---------- LISTA DE TABELAS (automatica) ----------
  if lista-tabelas {
    page[
      #v(2cm)
      #align(center)[#text(size: 12pt, weight: "bold")[LISTA DE TABELAS]]
      #v(2cm)
      #outline(title: none, target: figure.where(kind: table))
    ]
  }

  // ---------- LISTA DE QUADROS (automatica, opcional) ----------
  if lista-quadros {
    page[
      #v(2cm)
      #align(center)[#text(size: 12pt, weight: "bold")[LISTA DE QUADROS]]
      #v(2cm)
      #outline(title: none, target: figure.where(kind: "quadro"))
    ]
  }

  // ---------- SUMARIO (secao 3.14) ----------
  page[
    #v(2cm)
    #align(center)[#text(size: 12pt, weight: "bold")[SUMÁRIO]]
    #v(2cm)
    #set par(leading: _esp-texto, spacing: _esp-texto)
    #show outline.entry.where(level: 1): it => strong(upper(it))
    #show outline.entry.where(level: 2): it => upper(it)
    #show outline.entry.where(level: 3): it => strong(it)
    #show outline.entry.where(level: 4): it => emph(it)
    #outline(title: none, indent: 0pt, depth: 5)
  ]

  // =================================================================
  //  CONFIGURACAO DA PARTE TEXTUAL
  // =================================================================

  // Paginacao: numero so a partir da introducao (primeira pagina textual),
  // no canto superior direito, fonte 10, recuo de 2 cm (secao 2.3).
  set page(
    header: context align(right, text(size: 10pt, str(counter(page).get().first()))),
    header-ascent: 1cm,   // 3cm (margem) - 1cm => numero a ~2cm da borda superior
  )

  // Hierarquia de secoes (secao 2.6 / Quadro 2):
  //  1a  MAIUSCULA negrito | 2a MAIUSCULA | 3a Versalete negrito
  //  4a  normal | 5a italico  (sempre alinhadas a esquerda)
  let _sec(it, transform, peso, estilo) = {
    block(width: 100%, breakable: false)[
      #set text(size: 12pt, weight: peso, style: estilo)
      #set par(first-line-indent: 0cm, leading: _esp-texto, justify: false)
      #if it.numbering != none [#counter(heading).display() #h(0.4em)]
      #transform(it.body)
    ]
  }

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(2cm)
    if it.numbering != none {
      _sec(it, upper, "bold", "normal")
    } else {
      // titulo sem indicativo: centralizado (secao 2.4)
      block(width: 100%)[
        #set text(size: 12pt, weight: "bold")
        #set par(first-line-indent: 0cm, leading: _esp-texto)
        #align(center)[#upper(it.body)]
      ]
    }
    v(1cm)
  }
  show heading.where(level: 2): it => { v(_esp-texto); _sec(it, upper, "regular", "normal"); v(_esp-simples) }
  show heading.where(level: 3): it => { v(_esp-texto); _sec(it, x => x, "bold", "normal"); v(_esp-simples) }
  show heading.where(level: 4): it => { v(_esp-texto); _sec(it, x => x, "regular", "italic"); v(_esp-simples) }
  show heading.where(level: 5): it => { v(_esp-texto); _sec(it, x => x, "regular", "normal"); v(_esp-simples) }

  // Referencias: fonte 12, espacamento simples, alinhado a esquerda (secao 3.16)
  show bibliography: set text(size: 12pt)
  show bibliography: set par(leading: _esp-simples, first-line-indent: 0cm, justify: false)

  // ---------- CORPO ----------
  body

  // =================================================================
  //  ELEMENTOS POS-TEXTUAIS
  // =================================================================

  // REFERENCIAS (titulo sem indicativo, centralizado)
  if bibliografia != none {
    titulo-livre[REFERÊNCIAS]
    bibliography(bibliografia, title: none, style: "associacao-brasileira-de-normas-tecnicas")
  }

  // GLOSSARIO (opcional)
  if glossario != none {
    titulo-livre[GLOSSÁRIO]
    glossario
  }

  // APENDICES (opcional) - use a funcao apendice(id, titulo)[...]
  if apendices != none { apendices }

  // ANEXOS (opcional) - use a funcao anexo(id, titulo)[...]
  if anexos != none { anexos }
}
