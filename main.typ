// ifsc-template.typ - Template para TCC IFSC conforme Manual de Normalização 2025
// Baseado no Manual de Normalização de Trabalhos Acadêmicos SiBI/IFSC (rev. 08abr25)

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
  
  // Configurações básicas sem show heading
  set document(title: titulo, author: autor)
  
  // DIMENSÃO A4 e margens conforme seção 2.2
  set page(
    paper: "a4", 
    margin: (top: 3cm, bottom: 2cm, left: 3cm, right: 2cm),
  )
  
  // FONTE padrão (conforme Quadro 1)
  set text(
    size: 12pt, 
    lang: "pt",
  )
  
  // ESPAÇAMENTO: 1,5 conforme Quadro 1
  set par(
    justify: true, 
    leading: 0.65em,
    first-line-indent: 1.25cm,
  )
  
  // Numeração progressiva conforme seção 2.6
  set heading(numbering: "1.1.1.1.1")
  
  // CAPA
  page[
    #set par(leading: 0.65em, first-line-indent: 0cm)
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
      
      #text(size: 12pt)[
        #upper(cidade)
        
        #ano
      ]
    ]
  ]
  
  // FOLHA DE ROSTO
  page[
    #set par(first-line-indent: 0cm, justify: true, leading: 0.65em)
    #v(2cm)
    
    #align(center)[
      #text(size: 12pt)[#upper(autor)]
    ]
    
    #v(4cm)
    
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
    
    #align(right)[
      #box(width: 8.5cm)[
        #set par(first-line-indent: 0cm, justify: true, leading: 0.5em)
        #set text(size: 10pt)
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
    
    #align(center)[
      #text(size: 12pt)[
        #upper(cidade)
        
        #ano
      ]
    ]
  ]
  
  // FICHA CATALOGRÁFICA
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
  
  // FOLHA DE APROVAÇÃO
  page[
    #set par(first-line-indent: 0cm, justify: true, leading: 0.65em)
    #v(2cm)
    
    #align(center)[
      #text(size: 12pt)[#upper(autor)]
    ]
    
    #v(2cm)
    
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
    
    // Natureza do trabalho alinhada à direita conforme manual
    #align(right)[
      #box(width: 8.5cm)[
        #set par(first-line-indent: 0cm, justify: true, leading: 0.5em)
        #set text(size: 10pt)
        Este #tipo-trabalho foi julgado adequado para obtenção do título de #grau e aprovado em sua forma final pelo Curso de #curso do Instituto Federal de Santa Catarina, Campus #campus.
      ]
    ]
    
    #v(1cm)
    
    #align(center)[
      São José, 28 de junho de 2025.
    ]
    
    #v(2cm)
    
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
  
  // DEDICATÓRIA
  if dedicatoria != none {
    page[
      #v(1fr)
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
  
  // AGRADECIMENTOS
  if agradecimentos != none {
    page[
      #v(2cm)
      #align(center)[
        #text(size: 12pt, weight: "bold")[AGRADECIMENTOS]
      ]
      #v(2cm)
      
      #set par(first-line-indent: 1.25cm, justify: true, leading: 0.65em)
      #agradecimentos
    ]
  }
  
  // EPÍGRAFE
  if epigrafe != none {
    page[
      #v(1fr)
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
  
  // RESUMO
  if resumo != none {
    page[
      #v(2cm)
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
  
  // ABSTRACT
  if abstract != none {
    page[
      #v(2cm)
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
  
  // LISTA DE ILUSTRAÇÕES - simplificada
  if lista-figuras {
    page[
      #v(2cm)
      #align(center)[
        #text(size: 12pt, weight: "bold")[LISTA DE ILUSTRAÇÕES]
      ]
      #v(2cm)
      
      // Lista manual das figuras (sem colchetes)
      Figura 1 – Modelo da antena patch com estrutura EBG #box(width: 1fr, repeat[.]) 4
    ]
  }
  
  // LISTA DE TABELAS - simplificada
  if lista-tabelas {
    page[
      #v(2cm)
      #align(center)[
        #text(size: 12pt, weight: "bold")[LISTA DE TABELAS]  
      ]
      #v(2cm)
      
      // Lista manual das tabelas (sem colchetes)
      Tabela 1 – Resultados das simulações das antenas microfita #box(width: 1fr, repeat[.]) 4
    ]
  }
  
  // SUMÁRIO
  page[
    #v(2cm)
    #align(center)[
      #text(size: 12pt, weight: "bold")[SUMÁRIO]
    ]
    #v(2cm)
    
    #show outline.entry.where(level: 1): it => {
      v(0.65em)
      // Verifica se tem numeração ou não
      if it.element.numbering != none [
        text(weight: "bold", upper(it))
      ] else [
        text(weight: "bold", it) // Para APÊNDICE, ANEXO, REFERÊNCIAS (sem upper)
      ]
    }
    
    #show outline.entry.where(level: 2): it => {
      v(0.65em)
      upper(it)
    }
    
    #show outline.entry.where(level: 3): it => {
      v(0.65em)
      text(weight: "bold", it)
    }
    
    #show outline.entry.where(level: 4): it => {
      v(0.65em)
      it
    }
    
    #show outline.entry.where(level: 5): it => {
      v(0.65em)
      it
    }
    
    #outline(
      title: none,
      indent: 0pt,
      depth: 5,
    )
  ]
  
  // Configuração para corpo do documento (paginação conforme seção 2.3)
  set page(
    header: context {
      let page-num = counter(page).get().first()
      if page-num >= 1 {
        align(right, text(size: 10pt, str(page-num)))
      }
    },
    header-ascent: 2cm, // Recuo de 2cm da margem superior
  )
  
  counter(page).update(1)
  
  // CONFIGURAÇÕES DE FORMATAÇÃO (após sumário)
  // SEÇÃO PRIMÁRIA
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
  
  // SEÇÃO SECUNDÁRIA
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
  
  // Seções terciária, quaternária e quinária
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
  
  // Configuração limpa de figuras e tabelas
  show figure: it => [
    #v(1em)
    #align(center)[
      #if it.kind == table [
        #strong[Tabela #counter(figure.where(kind: table)).display() – #it.caption.body]
      ] else if it.kind == "quadro" [
        #strong[Quadro #counter(figure.where(kind: "quadro")).display() – #it.caption.body]
      ] else [
        #strong[Figura #counter(figure.where(kind: image)).display() – #it.caption.body]
      ]
      
      #it.body
      #v(0.5em)
      
      #text(size: 10pt)[
        Fonte: #if it.supplement != none [#it.supplement] else [elaborado pelo próprio autor.]
      ]
    ]
    #v(1em)
  ]
  
  // Configuração de equações
  show math.equation.where(block: true): it => {
    v(1em)
    align(center)[#it]
    v(1em)
  }
  
  // Configurações de bibliografia (após sumário)
  if bibliografia != none {
    show bibliography: set text(size: 12pt)
    show bibliography: set par(
      leading: 0.5em,         // Espaçamento simples conforme Quadro 1
      first-line-indent: 0cm, // Alinhado à esquerda
      justify: false,         // Texto alinhado à esquerda
      hanging-indent: 0pt     // Sem recuo pendente por enquanto
    )
  }
  
  // Corpo do documento
  body
  
  // REFERÊNCIAS (conforme seção 3.16 e Imagem 19) - como heading para o sumário
  if bibliografia != none {
    pagebreak()
    heading(level: 1, numbering: none)[REFERÊNCIAS]
    v(2cm)
    
    bibliography(
      bibliografia,
      title: none,
      style: "associacao-brasileira-de-normas-tecnicas",
    )
  }
  
  // APÊNDICE A - como heading para aparecer no sumário
  pagebreak()
  heading(level: 1, numbering: none)[APÊNDICE A – CÓDIGO FONTE DA SIMULAÇÃO]
  v(2cm)
  
  set par(first-line-indent: 1.25cm, justify: true, leading: 0.65em)
  
  [Este apêndice apresenta o código fonte utilizado nas simulações das antenas desenvolvidas neste trabalho.
  
  O código foi implementado em CST Microwave Studio utilizando VBA Script para automatização dos parâmetros de simulação.]
  
  v(1em)
  rect(width: 100%, inset: 1em, stroke: 1pt)[
    #set text(size: 10pt)
    #set par(first-line-indent: 0cm)
    [' Código VBA para automação da simulação
    Sub Main()
        Dim frequency As Double
        frequency = 3.5 ' GHz
        
        ' Configurar parâmetros da antena
        SetParameter("freq", frequency)
        SetParameter("substrate_height", 1.575)
        
        ' Executar simulação
        Solver.Start
    End Sub]
  ]
  
  v(1em)
  [O código permite a variação automática dos parâmetros geométricos da antena para otimização do desempenho.]
  
  // ANEXO A - como heading para aparecer no sumário
  pagebreak()
  heading(level: 1, numbering: none)[ANEXO A – DATASHEET DO SUBSTRATO ROGERS RT/DUROID 5880]
  v(2cm)
  
  set par(first-line-indent: 1.25cm, justify: true, leading: 0.65em)
  
  [Este anexo apresenta as especificações técnicas completas do substrato Rogers RT/duroid 5880 utilizado na fabricação das antenas.
  
  *Especificações Técnicas:*
  
  - Constante dielétrica (εr): 2,20 ± 0,02
  - Tangente de perda: 0,0009 em 10 GHz
  - Espessura disponível: 0,508 mm a 3,175 mm
  - Temperatura de operação: -55°C a +125°C
  - Coeficiente de expansão térmica: 31 ppm/°C
  
  *Aplicações Recomendadas:*
  
  - Antenas de alta frequência
  - Circuitos de micro-ondas
  - Sistemas de comunicação móvel
  - Dispositivos para 5G
  
  As propriedades dielétricas estáveis em ampla faixa de frequência tornam este substrato ideal para aplicações em sistemas de comunicação móvel de quinta geração.]
}