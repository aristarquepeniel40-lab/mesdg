# mesdg

[![R-CMD-check](https://github.com/aristarquepeniel40-lab/mesdg/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/aristarquepeniel40-lab/mesdg/actions/workflows/R-CMD-check.yaml)

**Registre des indicateurs ODD (Objectifs de développement durable) pour l'écosystème [MEverse](https://github.com/aristarquepeniel40-lab/mecore).**

Registre étendu des indicateurs officiels du cadre mondial des ODD des
Nations Unies (source : [unstats.un.org](https://unstats.un.org/sdgs/metadata/),
récupéré août 2026), remplaçant le petit registre de 4 indicateurs
initialement embarqué dans `mecore`.

**190 indicateurs** au total :
- Objectifs 1 à 12 : couverture **intégrale** du texte officiel
- Objectifs 13 à 17 : sous-ensemble **vérifié** mais non exhaustif (le
  cadre officiel complet compte 234 indicateurs)

## Installation

```r
install.packages("remotes")
remotes::install_github("aristarquepeniel40-lab/mecore")   # dependance
remotes::install_github("aristarquepeniel40-lab/mesdg")
```

## Exemple rapide

```r
library(mecore)
library(mesdg)

# Les 17 objectifs
list_sdg_goals()

# Recherche par mot-cle ou par code
search_sdg_indicators("poverty")
search_sdg_indicators(goal = 5)   # tous les indicateurs de l'ODD 5
sdg_indicator_info("4.1.1")

# Construire un indicateur reel a partir d'un code ODD
meta <- me_metadata(project_name = "p", organization = "o", country = "Benin",
  donor = "d", manager = "m", start_date = Sys.Date(), end_date = Sys.Date() + 365,
  version = "0.1", description = "d", objectives = "o", sdgs = character(0))

d <- me_dataset(name = "exploitants",
  data = data.frame(revenu_annuel = c(280000, 450000, 320000, 610000)),
  metadata = meta)

ind <- sdg_indicator("1.2.1", datasets = list(d),
  formula = ~ round(mean(revenu_annuel < 400000) * 100, 1), value = 50, unit = "%")
```

## Fait partie de l'écosystème MEverse

[mecore](https://github.com/aristarquepeniel40-lab/mecore) (fondations) ·
[medata](https://github.com/aristarquepeniel40-lab/medata) ·
[meindicator](https://github.com/aristarquepeniel40-lab/meindicator) ·
[mecheck](https://github.com/aristarquepeniel40-lab/mecheck) ·
[mereport](https://github.com/aristarquepeniel40-lab/mereport) ·
**mesdg** (ce dépôt)

## Licence

MIT — voir [`LICENSE`](LICENSE). Les données du registre proviennent
d'une source officielle publique des Nations Unies.
