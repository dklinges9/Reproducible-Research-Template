
# AJAE

```
---
title: "A Very Serious Analysis of the Stationarity of Corn and Soybean Prices"
author: "Peter Economist, Paul Economist, Mary Economist"
date: '`r format(Sys.time(), "%B %d, %Y")`'
output: 
  pdf_document:
    template: simple.latex
    fig_caption: yes
documentclass: ajae
bibliography: bibliography.bib
---
```
# Elsevier

Formatting for Elsevier journals is available in the `rticles` package template. First install and load the `rticles` package.

```
---
title: "A Very Serious Analysis of the Stationarity of Corn and Soybean Prices"
author:
  - name: Peter Economist
    email: pemail@univerisy.edu
    affiliation: University 
    footnote: Corresponding Author
  - name: Paul Economist
    email: pamail@Univerisy.edu
    affiliation: University
  - name: Mary Economist
    email: mamail@University.edu
    affiliation: University
address:
  - code: University
    address: Department of Economics, 101 Scholar Dr, University Town, IL, 55555
abstract: |
  We determine whether corn and soybean futures contract prices are stationary or not. 

keywords: prices, unit root, stationarity
bibliography: bibliography.bib
output: rticles::elsevier_article
---
```