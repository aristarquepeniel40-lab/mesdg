# Guide d'intégration — `mesdg`

Même processus que les 5 précédents : testé réellement, `mecore`
installé au préalable.

## 1. Installation

```r
setwd("chemin/vers/mesdg")
devtools::document()
devtools::load_all(".")
source("walking_skeleton.R")   # doit afficher "TOUS LES TESTS MESDG PASSENT."
devtools::test()
devtools::check()
```

**Point d'attention pour `devtools::check()`** : contrairement aux 5
packages précédents, `mesdg` embarque un fichier de données
(`inst/extdata/sdg_indicators.csv`, 190 lignes). Vérifie que
`system.file("extdata", "sdg_indicators.csv", package = "mesdg")`
retourne bien un chemin non vide une fois le package installé — si ce
n'est pas le cas, `load_sdg_indicators()` échouera silencieusement.
Testé et confirmé fonctionnel de mon côté, mais à revérifier chez toi.

## 2. D'où viennent les données

Transcrites du texte officiel de
[unstats.un.org/sdgs/metadata/](https://unstats.un.org/sdgs/metadata/)
(récupéré août 2026). Couverture :

| Objectifs | Couverture |
|---|---|
| 1 à 12 | Intégrale (texte officiel complet) |
| 13 à 17 | Sous-ensemble vérifié, non exhaustif |

Le cadre mondial officiel complet compte 234 indicateurs uniques ;
`mesdg` en couvre 190. Le script `data-raw/build_registry.py` documente
la construction du registre et peut être étendu pour ajouter les
indicateurs manquants des objectifs 13 à 17 si besoin.

## 3. Différence avec le registre de `mecore`

`mecore` conserve son petit registre (4 indicateurs,
`search_sdg_indicator()`/`me_indicator_from_sdg()`, singulier) pour ne
pas casser la rétrocompatibilité. `mesdg` propose des noms de fonction
différents (`search_sdg_indicators()` pluriel, `sdg_indicator()`) pour
éviter toute ambiguïté si les deux packages sont chargés en même temps.
`mesdg` est le registre à privilégier pour tout nouveau projet.

## 4. Ce que fait ce package (V1)

- `list_sdg_goals()` — les 17 objectifs, titres officiels en français.
- `load_sdg_indicators()` — le registre complet (190 lignes).
- `search_sdg_indicators(query = NULL, goal = NULL)` — recherche par
  code exact, mot-clé, ou objectif.
- `sdg_indicator_info(code)` — détails d'un indicateur par son code.
- `sdg_indicator(code, datasets, formula, value, unit)` — construit un
  `mecore::me_indicator` directement à partir d'un code ODD.

## 5. Sortie réelle du walking skeleton (testée ici)

```
[ODD 1.2.1] Proportion of population living below the national poverty line, by sex and age = 50 %

TOUS LES TESTS MESDG PASSENT.
```
