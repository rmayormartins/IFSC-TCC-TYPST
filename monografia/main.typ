// main.typ - Template TCC Engenharia de Telecomunicacoes IFSC
// Conforme Manual de Normalizacao SiBI/IFSC (rev. 08abr25)

#import "ifsc-template.typ": *

#show: ifsc-template.with(
  titulo: "Desenvolvimento de Antenas Microfita para Aplicações em Sistemas 5G",
  subtitulo: "",
  autor: "Nome Completo do Estudante",
  orientador: "Prof. Dr. Nome do Orientador",
  coorientador: "",
  campus: "São José",
  ano: "2025",
  data-defesa: "28 de junho de 2025",
  banca: (
    (nome: "Prof. Dr. Nome do Examinador 1", instituicao: "Instituto Federal de Santa Catarina"),
    (nome: "Prof. Dr. Nome do Examinador 2", instituicao: "Instituto Federal de Santa Catarina"),
  ),
  dedicatoria: [
    Dedico este trabalho aos meus pais, pelo apoio incondicional durante toda
    minha jornada academica.
  ],
  agradecimentos: [
    Agradeco primeiramente a Deus, pela forca durante esta jornada academica.

    Ao meu orientador, Prof. Dr. Nome do Orientador, pela dedicacao e
    conhecimentos compartilhados na area de telecomunicacoes.

    Aos professores do Curso de Engenharia de Telecomunicacoes do IFSC, que
    contribuiram para minha formacao.

    A minha familia, pelo apoio incondicional durante os estudos.
  ],
  epigrafe: [
    "A tecnologia move o mundo."

    Steve Jobs
  ],
  resumo: [
    Este trabalho apresenta o desenvolvimento de antenas microfita para
    aplicacoes em sistemas de comunicacao movel 5G na faixa de 3,5 GHz. O
    objetivo e projetar e analisar antenas patch com diferentes configuracoes
    para melhorar parametros como ganho, largura de banda e eficiencia. A
    metodologia baseia-se em simulacoes eletromagneticas e medicoes
    experimentais. Foram analisadas tres configuracoes: patch convencional, com
    fendas e estrutura EBG. Os resultados mostram que a antena EBG apresenta
    melhor desempenho com ganho de 8,2 dBi e eficiencia de 91%. As medicoes
    experimentais confirmaram os resultados de simulacao. Conclui-se que as
    configuracoes estudadas sao adequadas para implementacao em sistemas 5G.
  ],
  palavras-chave: ("Antenas Microfita", "Sistemas 5G", "Telecomunicações"),
  abstract: [
    This work presents the development of microstrip antennas for 5G mobile
    communication system applications in the 3.5 GHz band. The objective is to
    design and analyze patch antennas with different configurations to improve
    parameters such as gain, bandwidth, and efficiency. The methodology is based
    on electromagnetic simulations and experimental measurements. Three
    configurations were analyzed: conventional patch, slotted, and EBG
    structure. Results show that the EBG antenna presents better performance
    with 8.2 dBi gain and 91% efficiency. Experimental measurements confirmed
    simulation results. It is concluded that the studied configurations are
    suitable for implementation in 5G systems.
  ],
  keywords: ("Microstrip Antennas", "5G Systems", "Telecommunications"),
  lista-figuras: true,
  lista-tabelas: true,
  lista-quadros: true,
  bibliografia: "referencias.bib",

  // Apendices e anexos agora ficam fora do template (parte pos-textual).
  apendices: [
    #apendice("A", "Código fonte da simulação")[
      Este apendice apresenta o codigo fonte utilizado nas simulacoes das antenas
      desenvolvidas neste trabalho. O codigo foi implementado em CST Microwave
      Studio utilizando VBA Script para automatizacao dos parametros.

      #v(0.5em)
      #block(width: 100%, inset: 1em, stroke: 1pt)[
        #set text(size: 10pt, font: ("DejaVu Sans Mono",))
        #set par(first-line-indent: 0cm, justify: false, leading: 0.6em)
        ```vb
        ' Codigo VBA para automacao da simulacao
        Sub Main()
            Dim frequency As Double
            frequency = 3.5 ' GHz
            SetParameter("freq", frequency)
            SetParameter("substrate_height", 1.575)
            Solver.Start
        End Sub
        ```
      ]
    ]
  ],
  anexos: [
    #anexo("A", "Datasheet do substrato Rogers RT/duroid 5880")[
      Este anexo apresenta as especificacoes tecnicas do substrato Rogers
      RT/duroid 5880 utilizado na fabricacao das antenas.

      - Constante dieletrica: 2,20 +/- 0,02;
      - Tangente de perda: 0,0009 em 10 GHz;
      - Espessura disponivel: 0,508 mm a 3,175 mm;
      - Temperatura de operacao: -55 C a +125 C.
    ]
  ],
)

= Introdução

== Contextualização

A quinta geracao de sistemas de comunicacao movel (5G) representa um avanco
significativo nas telecomunicacoes, prometendo velocidades superiores a 10 Gbps
e latencia ultra-baixa @andrews2014what. Para atender esses requisitos, e
fundamental o desenvolvimento de antenas eficientes que operem nas faixas
destinadas ao 5G.

No Brasil, a faixa de 3,5 GHz foi destinada para operacao 5G @anatel2021resolucao,
tornando critico o desenvolvimento de antenas otimizadas para esta frequencia. As
antenas microfita destacam-se como solucao promissora devido ao perfil baixo,
facilidade de fabricacao e baixo custo @balanis2016antenna.

== Objetivos

=== Objetivo Geral

Desenvolver e analisar antenas microfita para aplicacoes em sistemas 5G na faixa
de 3,5 GHz.

=== Objetivos Específicos

Os objetivos especificos deste trabalho sao:

- projetar tres configuracoes de antenas patch para 3,5 GHz;
- simular o comportamento eletromagnetico das antenas;
- construir prototipos das antenas;
- realizar medicoes experimentais;
- comparar os resultados obtidos.

== Justificativa

Este estudo justifica-se pela necessidade de desenvolvimento de antenas para
sistemas 5G, contribuindo para o avanco tecnologico na area de telecomunicacoes.

= Fundamentação Teórica

== Sistemas de Comunicação 5G

A tecnologia 5G opera em diversas faixas de frequencia, sendo a faixa de 3,5 GHz
importante para implementacao inicial devido ao bom compromisso entre cobertura e
capacidade @rappaport2013millimeter.

== Antenas Microfita

As antenas patch microfita consistem em um elemento radiante metalico sobre
substrato dieletrico com plano de terra @pozar2012microwave. A frequencia de
ressonancia e dada por:

$ f_r = c / (2 L_"eff" sqrt(epsilon_"reff")) $ <eq-freq>

onde $L_"eff"$ e o comprimento efetivo e $epsilon_"reff"$ a constante dieletrica
efetiva, conforme a Equacao (#ref(<eq-freq>, supplement: none)).

= Metodologia

== Projeto das Antenas

As antenas foram projetadas para frequencia central de 3,5 GHz, largura de banda
minima de 200 MHz, ganho minimo de 6 dBi e substrato Rogers RT/duroid 5880.

== Configurações Analisadas

Foram projetadas tres configuracoes: patch convencional, patch com fendas e patch
com estrutura EBG.

= Resultados

== Resultados de Simulação

A @tab-resultados apresenta os resultados obtidos nas simulacoes das tres
configuracoes de antenas estudadas.

#tabela(
  [Resultados das simulações das antenas microfita],
  fonte: [elaborada pelo proprio autor.],
  table(
    columns: 4,
    align: (left, center, center, center),
    stroke: none,
    inset: (x: 6pt, y: 4pt),
    table.hline(),
    table.header(
      [*Configuração*], [*Ganho (dBi)*], [*Eficiência (%)*], [*Banda (MHz)*],
    ),
    table.hline(stroke: 0.6pt),
    [Convencional], [6,8], [89], [195],
    [Com fendas], [6,2], [86], [430],
    [Estrutura EBG], [8,2], [91], [210],
    table.hline(),
  ),
) <tab-resultados>

A @fig-antena mostra o modelo tridimensional da antena patch com estrutura EBG.

#figura(
  [Modelo da antena patch com estrutura EBG],
  fonte: [elaborada pelo proprio autor.],
  rect(width: 60%, height: 4cm, stroke: 1pt)[
    #align(center + horizon)[
      #rect(width: 30%, height: 1.5cm, fill: gray.lighten(50%), stroke: 1pt)[
        #align(center + horizon)[#text(size: 8pt)[Patch]]
      ]
      #v(0.4em) #text(size: 10pt)[Estrutura EBG]
    ]
  ],
) <fig-antena>

O @quadro-specs apresenta as especificacoes de projeto.

#quadro(
  [Especificações de projeto das antenas],
  fonte: [elaborado pelo proprio autor.],
  table(
    columns: 2,
    stroke: 0.6pt,
    inset: (x: 6pt, y: 4pt),
    [*Parâmetro*], [*Valor*],
    [Frequência central], [3,5 GHz],
    [Substrato], [Rogers RT/duroid 5880],
    [Espessura do substrato], [1,575 mm],
    [Constante dielétrica], [2,2],
    [Tangente de perda], [0,0009],
  ),
) <quadro-specs>

== Resultados Experimentais

As medicoes experimentais validaram os resultados de simulacao com erro maximo de
5%, confirmando a eficacia da metodologia proposta.

= Conclusão

Este trabalho apresentou o desenvolvimento de antenas microfita para sistemas 5G.
Todas as configuracoes atendem aos requisitos; a antena EBG ofereceu o melhor
desempenho; e os resultados experimentais validaram as simulacoes. Como trabalhos
futuros, sugere-se a analise de arrays maiores e antenas dual-banda.
