library(mecore)
library(mesdg)
library(S7)

cat("--- Les 17 objectifs ---\n")
print(list_sdg_goals())

cat("\n--- Recherche par mot-cle ---\n")
print(search_sdg_indicators("education")[, c("code", "label_en")])

cat("\n--- Construction d'un indicateur reel ---\n")
meta <- me_metadata(
  project_name = "Suivi agricole", organization = "o", country = "Benin",
  donor = "d", manager = "m", start_date = Sys.Date(), end_date = Sys.Date() + 365,
  version = "0.1", description = "d", objectives = "o", sdgs = character(0)
)
d <- me_dataset(name = "exploitants",
  data = data.frame(revenu_annuel = c(280000, 450000, 320000, 610000)),
  metadata = meta)

ind <- sdg_indicator("1.2.1", datasets = list(d),
  formula = ~ round(mean(revenu_annuel < 400000) * 100, 1), value = 50, unit = "%")
cat(ind@label, "=", ind@value, ind@unit, "\n")

stopifnot(nrow(list_sdg_goals()) == 17)
stopifnot(nrow(load_sdg_indicators()) >= 180)
stopifnot(S7_inherits(ind, me_indicator))

cat("\nTOUS LES TESTS MESDG PASSENT.\n")
