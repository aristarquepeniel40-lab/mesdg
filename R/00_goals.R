#' Les 17 Objectifs de developpement durable (ODD)
#'
#' Retourne un data.frame des 17 objectifs, avec leur numero et leur
#' titre officiel (traduction francaise des Nations Unies).
#'
#' @return Un `data.frame` avec les colonnes `goal` et `title`.
#' @export
list_sdg_goals <- function() {
  data.frame(
    goal = 1:17,
    title = c(
      "Eliminer la pauvrete sous toutes ses formes et partout dans le monde",
      "Eliminer la faim, assurer la securite alimentaire, ameliorer la nutrition et promouvoir l'agriculture durable",
      "Permettre a tous de vivre en bonne sante et promouvoir le bien-etre de tous a tout age",
      "Assurer l'acces de tous a une education de qualite, sur un pied d'egalite, et promouvoir les possibilites d'apprentissage tout au long de la vie",
      "Parvenir a l'egalite des sexes et autonomiser toutes les femmes et les filles",
      "Garantir l'acces de tous a l'eau et a l'assainissement et assurer une gestion durable des ressources en eau",
      "Garantir l'acces de tous a des services energetiques fiables, durables et modernes, a un cout abordable",
      "Promouvoir une croissance economique soutenue, partagee et durable, le plein emploi productif et un travail decent pour tous",
      "Batir une infrastructure resiliente, promouvoir une industrialisation durable qui profite a tous et encourager l'innovation",
      "Reduire les inegalites dans les pays et d'un pays a l'autre",
      "Faire en sorte que les villes et les etablissements humains soient ouverts a tous, surs, resilients et durables",
      "Etablir des modes de consommation et de production durables",
      "Prendre d'urgence des mesures pour lutter contre les changements climatiques et leurs repercussions",
      "Conserver et exploiter de maniere durable les oceans, les mers et les ressources marines",
      "Preserver et restaurer les ecosystemes terrestres, gerer durablement les forets, lutter contre la desertification, enrayer et inverser la degradation des sols et mettre fin a l'appauvrissement de la biodiversite",
      "Promouvoir l'avenement de societes pacifiques et ouvertes a tous, assurer l'acces de tous a la justice et mettre en place des institutions efficaces, responsables et ouvertes a tous",
      "Renforcer les moyens de mettre en oeuvre le Partenariat mondial pour le developpement durable et le revitaliser"
    ),
    stringsAsFactors = FALSE
  )
}
