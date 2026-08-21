# Rechercher des indicateurs ODD par code, mot-cle ou objectif

Rechercher des indicateurs ODD par code, mot-cle ou objectif

## Usage

``` r
search_sdg_indicators(query = NULL, goal = NULL)
```

## Arguments

- query:

  Code exact (ex. "4.1.1"), mot-cle du libelle (ex. "poverty"), ou
  `NULL` pour ne filtrer que par `goal`.

- goal:

  Numero d'objectif (1 a 17) pour restreindre la recherche.

## Value

Un `data.frame` filtre (0 a n lignes).
