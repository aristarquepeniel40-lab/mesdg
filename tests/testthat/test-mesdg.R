test_that("list_sdg_goals retourne les 17 objectifs", {
  goals <- list_sdg_goals()
  expect_equal(nrow(goals), 17)
  expect_equal(goals$goal, 1:17)
})

test_that("load_sdg_indicators charge le registre complet", {
  reg <- load_sdg_indicators()
  expect_gt(nrow(reg), 100)
  expect_true(all(c("goal", "target", "code", "label_en", "unit_hint") %in% names(reg)))
})

test_that("search_sdg_indicators trouve un code exact", {
  res <- search_sdg_indicators("4.1.1")
  expect_equal(nrow(res), 1)
  expect_equal(res$code, "4.1.1")
})

test_that("search_sdg_indicators trouve par mot-cle", {
  res <- search_sdg_indicators("poverty")
  expect_gt(nrow(res), 0)
  expect_true(all(grepl("poverty", res$label_en, ignore.case = TRUE)))
})

test_that("search_sdg_indicators filtre par objectif", {
  res <- search_sdg_indicators(goal = 5)
  expect_true(all(res$goal == 5))
})

test_that("sdg_indicator_info leve une erreur sur un code inconnu", {
  expect_error(sdg_indicator_info("99.9.9"), regexp = "inconnu")
})

test_that("sdg_indicator construit un me_indicator valide", {
  meta <- mecore::me_metadata(
    project_name = "p", organization = "o", country = "c", donor = "d", manager = "m",
    start_date = Sys.Date(), end_date = Sys.Date() + 1,
    version = "0.1", description = "d", objectives = "o", sdgs = character(0)
  )
  d <- mecore::me_dataset(name = "d1", data = data.frame(x = 1:3), metadata = meta)
  ind <- sdg_indicator("4.1.1", datasets = list(d), formula = ~ mean(x), value = 42, unit = "%")
  expect_true(S7::S7_inherits(ind, mecore::me_indicator))
  expect_equal(ind@value, 42)
  expect_true(grepl("ODD 4.1.1", ind@label))
})

test_that("sdg_indicator utilise unit_hint si unit non fourni", {
  meta <- mecore::me_metadata(
    project_name = "p", organization = "o", country = "c", donor = "d", manager = "m",
    start_date = Sys.Date(), end_date = Sys.Date() + 1,
    version = "0.1", description = "d", objectives = "o", sdgs = character(0)
  )
  d <- mecore::me_dataset(name = "d1", data = data.frame(x = 1:3), metadata = meta)
  ind <- sdg_indicator("1.1.1", datasets = list(d), formula = ~ mean(x), value = 10)
  expect_equal(ind@unit, "%")
})
