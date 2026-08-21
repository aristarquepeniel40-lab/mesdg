# mesdg 1.0.0

Première version stable.

## Fonctionnalités

* Registre de 190 indicateurs officiels du cadre mondial des ODD des
  Nations Unies (source : unstats.un.org, récupéré août 2026).
  Couverture intégrale des objectifs 1 à 12, sous-ensemble vérifié des
  objectifs 13 à 17 (non exhaustif des 234 indicateurs officiels).
* `list_sdg_goals()` — les 17 objectifs, titres officiels en français.
* `load_sdg_indicators()`/`search_sdg_indicators()`/`sdg_indicator_info()`
  — chargement et recherche dans le registre.
* `sdg_indicator()` — construit un `mecore::me_indicator` directement à
  partir d'un code ODD.

## Notes de conception

* Remplace le petit registre de 4 indicateurs initialement embarqué
  dans `mecore` (conservé pour rétrocompatibilité). Noms de fonctions
  différents (`search_sdg_indicators` pluriel, `sdg_indicator`) pour
  éviter toute ambiguïté si les deux registres sont chargés ensemble.
