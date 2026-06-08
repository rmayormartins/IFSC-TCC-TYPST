// =============================================================================
//  IFSC TCC Typst  |  Apresentação (arquivo de exemplo)
// -----------------------------------------------------------------------------
//  Arquivo .....: exemplo.typ
//  Descrição ...: exemplo de uso do tema de slides (ifsc-saojose.typ).
//                 Copie e edite para montar a sua apresentação de defesa.
//
//  Autor .......: Ramon Mayor Martins
//  Site ........: https://rmayormartins.github.io
//  E-mail ......: ramon.mayor@ifsc.edu.br
//  Repositório .: https://github.com/rmayormartins/IFSC-TCC-TYPST
//
//  Versão ......: 0.2  (08/jun/2026)
//  Para ........: Engenharia de Telecomunicações
//  Licença .....: MIT
// =============================================================================

#import "ifsc-saojose.typ": *

#show: apresentacao.with(
  instituicao: "Instituto Federal de Santa Catarina",
  // Para incluir a logo oficial, descomente e aponte para o arquivo:
  // logo: image("logo-ifsc.png", height: 1.1cm),
)

// ---------------------- Slide de abertura ----------------------
#slide-titulo(
  codigo: "TCC029010 - Trabalho de Conclusao de Curso",
  titulo: "Titulo do trabalho em duas linhas quando necessario",
  autores: (
    "Nome do Estudante",
    "Orientador Nome do Orientador",
    "Coorientadora Nome da Coorientadora",
  ),
  curso: "Engenharia de Telecomunicacoes",
  campus: "campus Sao Jose",
  data: "11 de dezembro de 2025",
)

// ---------------------- Slide com lista ----------------------
#slide(titulo: "Motivacao")[
  - Primeiro ponto da motivacao, escrito em um paragrafo curto.

  - Segundo ponto, destacando a importancia do tema abordado.

  - Ferramentas computacionais, especialmente redes neurais convolucionais
    (_CNNs_), podem apoiar a analise, contribuindo para:
    - maior precisao;
    - reducao de procedimentos desnecessarios.
]

// ---------------------- Slide com bloco ----------------------
#slide(titulo: "Objetivos")[
  #v(0.8cm)
  #bloco(titulo: "Objetivo Geral")[
    Desenvolver e comparar algoritmo para deteccao automatica, utilizando
    a decomposicao Wavelet como pre-processamento e diferentes arquiteturas
    de CNNs (treinadas do zero e com Transfer Learning).
  ]
]

// ---------------------- Slide com enumeracao ----------------------
#slide(titulo: "Objetivos Especificos")[
  + Selecionar e analisar imagens da base publica Mini-MIAS.
  + Implementar a decomposicao Wavelet para destacar padroes e reduzir ruidos.
  + Aplicar _data augmentation_ para aumentar a variabilidade das imagens.
  + Treinar modelos de CNN, incluindo redes do zero e ResNet com Transfer Learning.
  + Avaliar os modelos usando acuracia, precisao, recall e F1-score.
]

// ---------------------- Slide com tabela ----------------------
#slide(titulo: "Resultados - ResNet18")[
  #v(0.4cm)
  #tabela-resultados(
    colunas: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
    cabecalho: ("Arq.", "Config.", "Acc", "P(N)", "R(N)", "F1(N)", "P(A)", "R(A)", "F1(A)"),
    linhas: (
      ("ResNet18", "Baseline",                "0,5606", "0,64", "0,71", "0,67", "0,37", "0,29", "0,33"),
      ("ResNet18", "+ Augmentation",          "0,5152", "0,61", "0,67", "0,64", "0,30", "0,25", "0,27"),
      ("ResNet18", "+ Preproc coif4",         "0,6212", "0,67", "0,81", "0,73", "0,47", "0,29", "0,36"),
      ("ResNet18", "+ Preproc coif4 + Aug",   "0,6364", "0,72", "0,69", "0,71", "0,50", "0,54", "0,52"),
    ),
  )

  #v(0.6cm)
  - _Coiflet_ isolado: acuracia 0,62; F1 Anormal sobe de 0,27 para 0,36.
  - _Coiflet_ + augmentation: um dos cenarios mais equilibrados.
]

// ---------------------- Slide de encerramento ----------------------
#slide[
  #v(2.2cm)
  #align(center)[
    #text(size: 40pt, weight: "bold")[Obrigado(a)!]
    #v(0.6cm)
    #text(size: 22pt)[Duvidas?]
    #v(1.6cm)
    #text(size: 15pt)[Nome do Estudante \ Trabalho de Conclusao de Curso \
      Engenharia de Telecomunicacoes - IFSC]
    #v(0.8cm)
    #text(font: "DejaVu Sans Mono", size: 13pt)[email\@aluno.ifsc.edu.br \ github.com/usuario/tcc]
  ]
]
