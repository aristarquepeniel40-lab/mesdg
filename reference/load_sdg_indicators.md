# Charger le registre complet des indicateurs ODD

Charge les indicateurs officiels du cadre mondial des Nations Unies
(source : unstats.un.org/sdgs/metadata/, recupere aout 2026). Couvre
integralement les objectifs 1 a 12 (texte officiel complet) et un
sous-ensemble verifie des objectifs 13 a 17 – ce registre n'est PAS
exhaustif des 234 indicateurs officiels, mais couvre les indicateurs les
plus courants pour un usage M&E.

## Usage

``` r
load_sdg_indicators()
```

## Value

Un `data.frame` avec les colonnes `goal`, `target`, `code`, `label_en`
(titre officiel, en anglais – langue de reference internationale des
codes ODD), `unit_hint` (unite typique, a titre indicatif).
