# Cache interne pour eviter de relire le CSV a chaque appel.
.mesdg_cache <- new.env(parent = emptyenv())

#' Charger le registre complet des indicateurs ODD
#'
#' Charge les indicateurs officiels du cadre mondial des Nations Unies
#' (source : unstats.un.org/sdgs/metadata/, recupere aout 2026). Couvre
#' integralement les objectifs 1 a 12 (texte officiel complet) et un
#' sous-ensemble verifie des objectifs 13 a 17 -- ce registre n'est PAS
#' exhaustif des 234 indicateurs officiels, mais couvre les indicateurs
#' les plus courants pour un usage M&E.
#'
#' @return Un `data.frame` avec les colonnes `goal`, `target`, `code`,
#'   `label_en` (titre officiel, en anglais -- langue de reference
#'   internationale des codes ODD), `unit_hint` (unite typique, a titre
#'   indicatif).
#' @export
load_sdg_indicators <- function() {
  if (is.null(.mesdg_cache$data)) {
    path <- system.file("extdata", "sdg_indicators.csv", package = "mesdg")
    .mesdg_cache$data <- utils::read.csv(path, stringsAsFactors = FALSE, encoding = "UTF-8")
  }
  .mesdg_cache$data
}

#' Rechercher des indicateurs ODD par code, mot-cle ou objectif
#'
#' @param query Code exact (ex. "4.1.1"), mot-cle du libelle (ex.
#'   "poverty"), ou `NULL` pour ne filtrer que par `goal`.
#' @param goal Numero d'objectif (1 a 17) pour restreindre la recherche.
#' @return Un `data.frame` filtre (0 a n lignes).
#' @export
search_sdg_indicators <- function(query = NULL, goal = NULL) {
  df <- load_sdg_indicators()

  if (!is.null(goal)) {
    df <- df[df$goal == goal, , drop = FALSE]
  }

  if (!is.null(query)) {
    hit_code <- df$code == query
    hit_label <- grepl(query, df$label_en, ignore.case = TRUE)
    df <- df[hit_code | hit_label, , drop = FALSE]
  }

  df
}

#' Obtenir les informations d'un indicateur ODD par son code exact
#'
#' @param code Code de l'indicateur (ex. "4.1.1").
#' @return Une liste avec `goal`, `target`, `code`, `label_en`, `unit_hint`.
#' @export
sdg_indicator_info <- function(code) {
  df <- load_sdg_indicators()
  ligne <- df[df$code == code, , drop = FALSE]
  if (nrow(ligne) == 0) {
    mecore::me_validation_error(sprintf(
      "code ODD inconnu dans le registre mesdg : '%s' (%d indicateurs references, couverture partielle -- voir load_sdg_indicators())",
      code, nrow(df)
    ))
  }
  as.list(ligne[1, ])
}
