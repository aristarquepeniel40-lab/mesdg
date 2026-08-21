# Instancier un me_indicator a partir d'un code ODD du registre mesdg

Sur le meme principe que
[`mecore::me_indicator_from_sdg()`](https://rdrr.io/pkg/mecore/man/me_indicator_from_sdg.html)
(registre minimal de 4 indicateurs), mais contre le registre complet de
`mesdg` (190 indicateurs). Nom different (`sdg_indicator` plutot que
`me_indicator_from_sdg`) pour eviter toute confusion entre les deux
registres si les deux packages sont charges ensemble.

## Usage

``` r
sdg_indicator(code, datasets, formula, value = NULL, unit = NULL)
```

## Arguments

- code:

  Code de l'indicateur ODD (ex. "4.1.1").

- datasets:

  Liste de
  [`mecore::me_dataset`](https://rdrr.io/pkg/mecore/man/me_dataset.html)
  sources.

- formula:

  Formule de calcul specifique au contexte du projet.

- value:

  Valeur calculee (optionnelle a la creation).

- unit:

  Unite de mesure. Si `NULL`, utilise `unit_hint` du registre (a titre
  indicatif – a verifier selon le contexte).

## Value

Un
[`mecore::me_indicator`](https://rdrr.io/pkg/mecore/man/me_indicator.html).
