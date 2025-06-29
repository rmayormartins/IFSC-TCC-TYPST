// ifsc-template.typ - Template para TCC IFSC conforme Manual de Normalização 2025
// Baseado no Manual de Normalização de Trabalhos Acadêmicos SiBI/IFSC (rev. 08abr25)
// Conforme ABNT NBR 14724:2024, NBR 6023:2018

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
  dedicatoria: none,
  agradecimentos: none,
  epigrafe: none,
  resumo: none,
  palavras-chave: (),
  abstract: none,
  keywords: (),
  lista-figuras: false,
  lista-tabelas: false,
  bibliografia: none,
  body
) = {
  
  // Configurações conforme Manual IFSC (Quadro 1 - Regras gerais)
  set document(title: titulo, author: autor)
  
  // DIMENSÃO A4 (21cm x 29,7cm) e margens conforme seção 2.2
  set page(
    paper: "a4", 
    margin: (top: 3cm, bottom: 2cm, left: 3cm, right: 2cm),
  )
  
  // FONTE: Times New Roman ou Arial (conforme Quadro 1)
  set text(
    font: "Times", 
    size: 12pt, 
    lang: "pt",
  )
  
  // ESPAÇAMENTO: 1,5 para todo o texto (conforme Quadro 1)
  set par(
    justify: true, 
    leading: 0.65em, // 1.5 em Typst
    first-line-indent: 1.25cm,
  )
  
  // Configuração de numeração progressiva conforme seção 2.6 (até quinária)
  set heading(numbering: "1.1.1.1.1")
  
  // SEÇÃO PRIMÁRIA (conforme Quadro 2 - maiúscula e negrito)
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(2cm)
    block[
      #set text(size: 12pt, weight: "bold")
      #set par(first-line-indent: 0cm, leading: 0.65em)
      #if it.numbering != none [
        #counter(heading).display()
        #h(1em)
      ]
      #upper(it.body)
    ]
    v(1cm)
  }
  
  // SEÇÃO SECUNDÁRIA (conforme Quadro 2 - maiúscula e negrito)
  show heading.where(level: 2): it => {
    v(0.65em)
    block[
      #set text(size: 12pt, weight: "bold")
      #set par(first-line-indent: 0cm, leading: 0.65em)
      #if it.numbering != none [
        #counter(heading).display()
        #h(1em)
      ]
      #upper(it.body)
    ]
    v(0.65em)
  }
  
  // Seção terciária (conforme Quadro 2 - negrito, primeira letra maiúscula)
  show heading.where(level: 3): it => {
    v(0.65em)
    block[
      #set text(size: 12pt, weight: "bold")
      #set par(first-line-indent: 0cm, leading: 0.65em)
      #if it.numbering != none [
        #counter(heading).display()
        #h(1em)
      ]
      #it.body
    ]
    v(0.65em)
  }
  
  // Seção quaternária (conforme Quadro 2 - negrito)
  show heading.where(level: 4): it => {
    v(0.65em)
    block[
      #set text(size: 12pt, weight: "bold")
      #set par(first-line-indent: 0cm, leading: 0.65em)
      #if it.numbering != none [
        #counter(heading).display()
        #h(1em)
      ]
      #it.body
    ]
    v(0.65em)
  }
  
  // Seção quinária (conforme Quadro 2 - negrito)
  show heading.where(level: 5): it => {
    v(0.65em)
    block[
      #set text(size: 12pt, weight: "bold")
      #set par(first-line-indent: 0cm, leading: 0.65em)
      #if it.numbering != none [
        #counter(heading).display()
        #h(1em)
      ]
      #it.body
    ]
    v(0.65em)
  }
  
  // Configuração de figuras conforme seção 2.11
  show figure: it => {
    v(1em)
    align(center)[
      #it.body
      #v(0.5em)
      #block[
        #set text(size: 12pt) // Título com fonte 12
        #set par(leading: 0.65em, justify: false, first-line-indent: 0cm)
        #it.caption
      ]
    ]
    v(1em)
  }
  
  // Configuração de equações conforme seção 2.10
  show math.equation.where(block: true): it => {
    v(1em)
    align(center)[#it]
    v(1em)
  }
  
  // CAPA (conforme seção 3.1 e Imagem 4)
  page[
    #set par(leading: 0.65em, first-line-indent: 0cm)
    #align(center + horizon)[
      #v(-2cm)
      
      // Nome da instituição em maiúscula
      #text(weight: "bold", size: 12pt)[
        INSTITUTO FEDERAL DE SANTA CATARINA
        
        CAMPUS #upper(campus)
        
        CURSO DE #upper(curso)
      ]
      
      #v(4cm)
      
      // Nome do autor em maiúscula
      #text(size: 12pt)[#upper(autor)]
      
      #v(4cm)
      
      // Título em negrito e maiúscula
      #block(width: 85%)[
        #set text(size: 12pt, weight: "bold")
        #set par(leading: 0.65em)
        #align(center)[
          #upper(titulo)
          #if subtitulo != "" [
            #linebreak()
            #upper(subtitulo)
          ]
        ]
      ]
      
      #v(1fr)
      
      // Local e ano
      #text(size: 12pt)[
        #upper(cidade)
        
        #ano
      ]
    ]
  ]
  
  // FOLHA DE ROSTO (conforme seção 3.2 e Imagem 5)
  page[
    #set par(first-line-indent: 0cm, justify: true, leading: 0.65em)
    #v(2cm)
    
    // Nome do autor centralizado
    #align(center)[
      #text(size: 12pt)[#upper(autor)]
    ]
    
    #v(4cm)
    
    // Título centralizado
    #align(center)[
      #block(width: 85%)[
        #set text(size: 12pt, weight: "bold")
        #set par(leading: 0.65em)
        #align(center)[
          #upper(titulo)
          #if subtitulo != "" [
            #linebreak()
            #upper(subtitulo)
          ]
        ]
      ]
    ]
    
    #v(2.5cm)
    
    // Natureza do trabalho (conforme Quadro 10 - fonte 10, espaçamento simples)
    #align(right)[
      #box(width: 8.5cm)[
        #set par(first-line-indent: 0cm, justify: true, leading: 0.5em)
        #set text(size: 10pt) // Fonte 10 conforme Quadro 1
        #tipo-trabalho apresentado ao Curso de #curso do Instituto Federal de Santa Catarina, Campus #campus, como requisito parcial para obtenção do título de #grau.
        
        #if orientador != "" [
          #v(1em)
          Orientador: #orientador
        ]
        
        #if coorientador != "" [
          #v(0.5em)
          Coorientador: #coorientador
        ]
      ]
    ]
    
    #v(1fr)
    
    // Local e ano
    #align(center)[
      #text(size: 12pt)[
        #upper(cidade)
        
        #ano
      ]
    ]
  ]
  
  // AGRADECIMENTOS (conforme seção 3.6 - opcional)
  if agradecimentos != none {
    page[
      #v(2cm)
      // Título centralizado sem numeração (conforme seção 2.4)
      #align(center)[
        #text(size: 12pt, weight: "bold")[AGRADECIMENTOS]
      ]
      #v(2cm)
      
      #set par(first-line-indent: 1.25cm, justify: true, leading: 0.65em)
      #agradecimentos
    ]
  }
  
  // RESUMO (conforme seção 3.8 e Imagem 11)
  if resumo != none {
    page[
      #v(2cm)
      // Título centralizado sem numeração (conforme seção 2.4)
      #align(center)[
        #text(size: 12pt, weight: "bold")[RESUMO]
      ]
      #v(2cm)
      
      #set par(first-line-indent: 0cm, justify: true, leading: 0.65em)
      #resumo
      
      #v(1.5em)
      #if palavras-chave.len() > 0 [
        #text(weight: "bold")[Palavras-chave: ] #palavras-chave.join("; ").
      ]
    ]
  }
  
  // ABSTRACT (conforme seção 3.9 e Imagem 12)
  if abstract != none {
    page[
      #v(2cm)
      // Título centralizado sem numeração (conforme seção 2.4)
      #align(center)[
        #text(size: 12pt, weight: "bold")[ABSTRACT]
      ]
      #v(2cm)
      
      #set par(first-line-indent: 0cm, justify: true, leading: 0.65em)
      #abstract
      
      #v(1.5em)
      #if keywords.len() > 0 [
        #text(weight: "bold")[Keywords: ] #keywords.join("; ").
      ]
    ]
  }
  
  // LISTA DE ILUSTRAÇÕES (conforme seção 3.10 - opcional)
  if lista-figuras {
    page[
      #v(2cm)
      #align(center)[
        #text(size: 12pt, weight: "bold")[LISTA DE ILUSTRAÇÕES]
      ]
      #v(2cm)
      
      #outline(
        title: none,
        target: figure.where(kind: image),
        indent: auto,
      )
    ]
  }
  
  // LISTA DE TABELAS (conforme seção 3.11 - opcional)
  if lista-tabelas {
    page[
      #v(2cm)
      #align(center)[
        #text(size: 12pt, weight: "bold")[LISTA DE TABELAS]
      ]
      #v(2cm)
      
      #outline(
        title: none,
        target: figure.where(kind: table),
        indent: auto,
      )
    ]
  }
  
  // SUMÁRIO (conforme seção 3.14 e Imagem 17)
  page[
    #v(2cm)
    #align(center)[
      #text(size: 12pt, weight: "bold")[SUMÁRIO]
    ]
    #v(2cm)
    
    // Formatação específica do sumário conforme manual IFSC
    #show outline.entry.where(level: 1): it => {
      // Seção primária: MAIÚSCULO + negrito
      v(0.65em) // Espaçamento 1,5 (equivalente ao texto)
      text(weight: "bold", upper(it))
    }
    
    #show outline.entry.where(level: 2): it => {
      // Seção secundária: MAIÚSCULO + texto normal
      v(0.65em) // Espaçamento 1,5
      upper(it)
    }
    
    #show outline.entry.where(level: 3): it => {
      // Seção terciária: Primeira letra maiúscula + negrito
      v(0.65em) // Espaçamento 1,5
      text(weight: "bold", it)
    }
    
    #show outline.entry.where(level: 4): it => {
      // Seção quaternária: Primeira letra maiúscula + texto normal
      v(0.65em) // Espaçamento 1,5
      it
    }
    
    #show outline.entry.where(level: 5): it => {
      // Seção quinária: Primeira letra maiúscula + texto normal
      v(0.65em) // Espaçamento 1,5
      it
    }
    
    #outline(
      title: none,
      indent: 0pt,
      depth: 5,
    )
  ]
  
  // FICHA CATALOGRÁFICA (conforme seção 3.3)
  page[
    #v(1fr)
    #align(center)[
      #rect(width: 12cm, height: 8cm, stroke: 1pt)[
        #set text(size: 9pt)
        #set par(leading: 0.5em, first-line-indent: 0cm)
        #align(left)[
          #v(0.5cm)
          #h(0.5cm)
          *Dados Internacionais de Catalogação na Publicação (CIP)*
          
          #v(1cm)
          
          A000a  #h(0.5cm) #autor
          
          #h(1.5cm) #titulo #if subtitulo != "" [ : #subtitulo] / #autor. -- #cidade : Instituto Federal de Santa Catarina, #ano.
          
          #h(1.5cm) XXX f. : il.
          
          #v(0.5cm)
          
          #h(1.5cm) #tipo-trabalho -- Instituto Federal de Santa Catarina, Campus #campus, Curso de #curso, #ano.
          
          #h(1.5cm) Orientador: #orientador
          
          #if coorientador != "" [
            #h(1.5cm) Coorientador: #coorientador
          ]
          
          #v(0.5cm)
          
          #h(1.5cm) 1. Telecomunicações. 2. Engenharia. I. Título.
          
          #v(1cm)
          
          #h(8cm) CDD XXX.XX
        ]
      ]
    ]
    #v(0.5cm)
    #align(center)[
      #text(size: 8pt)[
        Ficha catalográfica elaborada pela Biblioteca do IFSC Campus #campus
      ]
    ]
  ]
  
  // FOLHA DE APROVAÇÃO (conforme seção 3.4)
  page[
    #set par(first-line-indent: 0cm, justify: true, leading: 0.65em)
    #v(2cm)
    
    // Nome do autor centralizado
    #align(center)[
      #text(size: 12pt)[#upper(autor)]
    ]
    
    #v(2cm)
    
    // Título centralizado
    #align(center)[
      #block(width: 85%)[
        #set text(size: 12pt, weight: "bold")
        #set par(leading: 0.65em)
        #align(center)[
          #upper(titulo)
          #if subtitulo != "" [
            #linebreak()
            #upper(subtitulo)
          ]
        ]
      ]
    ]
    
    #v(1.5cm)
    
    // Natureza do trabalho
    #align(center)[
      #box(width: 12cm)[
        #set par(first-line-indent: 0cm, justify: true, leading: 0.5em)
        #set text(size: 10pt)
        Este #tipo-trabalho foi julgado adequado para obtenção do título de #grau e aprovado em sua forma final pelo Curso de #curso do Instituto Federal de Santa Catarina, Campus #campus.
      ]
    ]
    
    #v(1cm)
    
    #align(center)[
      #cidade, #line(length: 2cm) de #line(length: 3cm) de #ano.
    ]
    
    #v(2cm)
    
    // Banca examinadora
    #align(center)[
      #set par(leading: 1.5em)
      
      #line(length: 8cm)
      
      #orientador
      
      Instituto Federal de Santa Catarina
      
      Orientador
      
      #v(1.5cm)
      
      #line(length: 8cm)
      
      Prof. Dr. Nome do Examinador 1
      
      Instituição
      
      #v(1.5cm)
      
      #line(length: 8cm)
      
      Prof. Dr. Nome do Examinador 2
      
      Instituição
    ]
  ]
  
  // DEDICATÓRIA (conforme seção 3.5 - opcional)
  if dedicatoria != none {
    page[
      #v(1fr)
      // Alinhamento do meio da mancha gráfica até margem direita (conforme manual)
      #align(right)[
        #box(width: 8cm)[
          #set par(first-line-indent: 0cm, justify: true, leading: 0.65em)
          #set text(style: "italic")
          #dedicatoria
        ]
      ]
      #v(2cm)
    ]
  }
  
  // EPÍGRAFE (conforme seção 3.7 - opcional)
  if epigrafe != none {
    page[
      #v(1fr)
      // Alinhamento do meio da mancha gráfica até margem direita (conforme manual)
      #align(right)[
        #box(width: 8cm)[
          #set par(first-line-indent: 0cm, justify: false, leading: 0.65em)
          #set text(style: "italic")
          #epigrafe
        ]
      ]
      #v(2cm)
    ]
  }
  
  // Configuração para o corpo do documento (conforme seção 2.3)
  set page(
    numbering: "1",
    header: context {
      let page-num = counter(page).get().first()
      if page-num >= 1 [
        #align(right)[
          #text(size: 10pt)[#page-num]
        ]
      ]
    },
  )
  
  counter(page).update(1)
  
  // Configurações de bibliografia (conforme seção 3.16)
  if bibliografia != none {
    show bibliography: set text(size: 12pt)
    show bibliography: set par(leading: 0.5em, first-line-indent: 0cm) // Espaçamento simples
  }
  
  // Corpo do documento (conforme seção 3.15)
  body
  
  // REFERÊNCIAS (conforme seção 3.16 e Imagem 19)
  if bibliografia != none {
    pagebreak()
    v(2cm)
    align(center)[
      #text(size: 12pt, weight: "bold")[REFERÊNCIAS]
    ]
    v(2cm)
    
    bibliography(
      bibliografia,
      title: none,
      style: "associacao-brasileira-de-normas-tecnicas",
    )
  }
}