// main.typ - Template TCC Engenharia de Telecomunicações IFSC
// Conforme Manual de Normalização SiBI/IFSC (rev. 08abr25)

#import "ifsc-template.typ": *

#show: ifsc-template.with(
  titulo: "Desenvolvimento de Antenas Microfita para Aplicações em Sistemas 5G",
  subtitulo: "", // opcional
  autor: "Nome Completo do Estudante",
  orientador: "Prof. Dr. Nome do Orientador",
  coorientador: "", // opcional
  
  campus: "São José",
  ano: "2025",
  
  dedicatoria: [
    Dedico este trabalho aos meus pais,
    pelo apoio incondicional durante toda
    minha jornada acadêmica.
  ],
  
  agradecimentos: [
    Agradeço primeiramente a Deus, pela força durante esta jornada acadêmica.
    
    Ao meu orientador, Prof. Dr. Nome do Orientador, pela dedicação e conhecimentos compartilhados na área de telecomunicações.
    
    Aos professores do Curso de Engenharia de Telecomunicações do IFSC, que contribuíram para minha formação.
    
    À minha família, pelo apoio incondicional durante os estudos.
  ],
  
  epigrafe: [
    "A tecnologia move o mundo."
    
    -- Steve Jobs
  ],
  
  resumo: [
    Este trabalho apresenta o desenvolvimento de antenas microfita para aplicações em sistemas de comunicação móvel 5G na faixa de 3,5 GHz. O objetivo é projetar e analisar antenas patch com diferentes configurações para melhorar parâmetros como ganho, largura de banda e eficiência. A metodologia baseia-se em simulações eletromagnéticas e medições experimentais. Foram analisadas três configurações: patch convencional, com fendas e estrutura EBG. Os resultados mostram que a antena EBG apresenta melhor desempenho com ganho de 8,2 dBi e eficiência de 91%. As medições experimentais confirmaram os resultados de simulação. Conclui-se que as configurações estudadas são adequadas para implementação em sistemas 5G.
  ],
  
  palavras-chave: ("Antenas Microfita", "Sistemas 5G", "Telecomunicações"),
  
  abstract: [
    This work presents the development of microstrip antennas for 5G mobile communication system applications in the 3.5 GHz band. The objective is to design and analyze patch antennas with different configurations to improve parameters such as gain, bandwidth, and efficiency. The methodology is based on electromagnetic simulations and experimental measurements. Three configurations were analyzed: conventional patch, slotted, and EBG structure. Results show that the EBG antenna presents better performance with 8.2 dBi gain and 91% efficiency. Experimental measurements confirmed simulation results. It is concluded that the studied configurations are suitable for implementation in 5G systems.
  ],
  
  keywords: ("Microstrip Antennas", "5G Systems", "Telecommunications"),
  
  lista-figuras: true,
  lista-tabelas: true,
  bibliografia: "referencias.bib",
)

= Introdução

== Contextualização

A quinta geração de sistemas de comunicação móvel (5G) representa um avanço significativo nas telecomunicações, prometendo velocidades superiores a 10 Gbps e latência ultra-baixa @andrews2014what. Para atender esses requisitos, é fundamental o desenvolvimento de antenas eficientes que operem nas faixas destinadas ao 5G.

No Brasil, a faixa de 3,5 GHz foi destinada para operação 5G @anatel2021resolucao, tornando crítico o desenvolvimento de antenas otimizadas para esta frequência. As antenas microfita destacam-se como solução promissora devido ao perfil baixo, facilidade de fabricação e baixo custo @balanis2016antenna.

== Objetivos

=== Objetivo Geral

Desenvolver e analisar antenas microfita para aplicações em sistemas 5G na faixa de 3,5 GHz.

=== Objetivos Específicos

- Projetar três configurações de antenas patch para 3,5 GHz;
- Simular o comportamento eletromagnético das antenas;
- Construir protótipos das antenas;
- Realizar medições experimentais;
- Comparar os resultados obtidos.

== Justificativa

Este estudo justifica-se pela necessidade de desenvolvimento de antenas para sistemas 5G, contribuindo para o avanço tecnológico na área de telecomunicações. O trabalho proporciona aplicação prática dos conhecimentos adquiridos durante o curso.

= Fundamentação Teórica

== Sistemas de Comunicação 5G

A tecnologia 5G opera em diversas faixas de frequência, sendo a faixa de 3,5 GHz importante para implementação inicial devido ao bom compromisso entre cobertura e capacidade @rappaport2013millimeter.

== Antenas Microfita

As antenas patch microfita consistem em um elemento radiante metálico sobre substrato dielétrico com plano de terra @pozar2012microwave. A radiação ocorre nas bordas do patch devido às descontinuidades do campo elétrico.

A frequência de ressonância é dada por:

$ f_r = c/(2 L_"eff" sqrt(epsilon_"reff")) $ <eq-freq>

onde $L_"eff"$ é o comprimento efetivo e $epsilon_"reff"$ é a constante dielétrica efetiva.

= Metodologia

== Projeto das Antenas

As antenas foram projetadas com as seguintes especificações:

- Frequência central: 3,5 GHz
- Largura de banda mínima: 200 MHz
- Ganho mínimo: 6 dBi
- Substrato: Rogers RT/duroid 5880

== Configurações Analisadas

Foram projetadas três configurações:

1. Patch convencional
2. Patch com fendas
3. Patch com estrutura EBG

== Simulações e Medições

As simulações foram realizadas no CST Microwave Studio. Os parâmetros analisados incluem coeficiente de reflexão, diagrama de radiação e ganho.

= Resultados

== Resultados de Simulação

@tab-resultados apresenta os resultados obtidos nas simulações das três configurações de antenas estudadas.

#figure(
  table(
    columns: 4,
    stroke: none,
    table.hline(),
    [*Configuração*], [*Ganho (dBi)*], [*Eficiência (%)*], [*Largura de Banda (MHz)*],
    table.hline(),
    [Convencional], [6,8], [89], [195],
    [Com fendas], [6,2], [86], [430],
    [Estrutura EBG], [8,2], [91], [210],
    table.hline(),
  ),
  caption: [Resultados das simulações das antenas microfita],
  supplement: [Elaborada pelo próprio autor],
  kind: table,
) <tab-resultados>

@fig-antena mostra o modelo tridimensional da antena patch com estrutura EBG simulada no CST Microwave Studio.

#figure(
  rect(width: 300pt, height: 200pt, stroke: 1pt)[
    #align(center + horizon)[
      #rect(width: 100pt, height: 60pt, fill: gray.lighten(50%), stroke: 1pt)[
        #align(center + horizon)[
          #text(size: 8pt)[Patch]
        ]
      ]
      #v(0.5em)
      #text(size: 10pt)[Estrutura EBG]
    ]
  ],
  caption: [Modelo da antena patch com estrutura EBG],
  supplement: [Elaborada pelo próprio autor],
) <fig-antena>

@quadro-specs apresenta as especificações de projeto utilizadas no desenvolvimento das antenas.

#figure(
  table(
    columns: 2,
    stroke: 1pt,
    [*Parâmetro*], [*Valor*],
    [Frequência central], [3,5 GHz],
    [Substrato], [Rogers RT/duroid 5880],
    [Espessura do substrato], [1,575 mm],
    [Constante dielétrica], [2,2],
    [Tangente de perda], [0,0009],
    [Espessura da metalização], [35 μm],
  ),
  caption: [Especificações de projeto das antenas],
  supplement: [Elaborado pelo próprio autor],
  kind: "quadro",
) <quadro-specs>

== Resultados Experimentais

As medições experimentais validaram os resultados de simulação com erro máximo de 5%, conforme apresentado em @quadro-specs, confirmando a eficácia da metodologia proposta.

A @fig-antena ilustra o modelo tridimensional utilizado nas simulações, enquanto a @tab-resultados demonstra que a antena EBG apresenta melhor performance dentre as configurações estudadas.

= Conclusão

Este trabalho apresentou o desenvolvimento de antenas microfita para sistemas 5G. As principais conclusões são:

1. Todas as configurações atendem aos requisitos para sistemas 5G;
2. A antena EBG oferece melhor desempenho;
3. Os resultados experimentais validaram as simulações.

Como trabalhos futuros, sugere-se análise de arrays maiores e antenas duais-banda.