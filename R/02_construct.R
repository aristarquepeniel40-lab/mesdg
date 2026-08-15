#' Instancier un me_indicator a partir d'un code ODD du registre mesdg
#'
#' Sur le meme principe que `mecore::me_indicator_from_sdg()` (registre
#' minimal de 4 indicateurs), mais contre le registre complet de
#' `mesdg` (190 indicateurs). Nom different (`sdg_indicator` plutot que
#' `me_indicator_from_sdg`) pour eviter toute confusion entre les deux
#' registres si les deux packages sont charges ensemble.
#'
#' @param code Code de l'indicateur ODD (ex. "4.1.1").
#' @param datasets Liste de `mecore::me_dataset` sources.
#' @param formula Formule de calcul specifique au contexte du projet.
#' @param value Valeur calculee (optionnelle a la creation).
#' @param unit Unite de mesure. Si `NULL`, utilise `unit_hint` du
#'   registre (a titre indicatif -- a verifier selon le contexte).
#' @return Un `mecore::me_indicator`.
#' @export
sdg_indicator <- function(code, datasets, formula, value = NULL, unit = NULL) {
  info <- sdg_indicator_info(code)  # leve une erreur si code inconnu

  if (is.null(unit)) unit <- info$unit_hint
  if (is.null(unit) || !nzchar(unit)) unit <- "n/a"

  mecore::me_indicator(
    label    = sprintf("[ODD %s] %s", info$code, info$label_en),
    formula  = formula,
    datasets = datasets,
    value    = if (is.null(value)) NA_real_ else value,
    unit     = unit
  )
}
