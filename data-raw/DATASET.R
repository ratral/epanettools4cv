## code to prepare `DATASET` data-set goes here

library(dplyr)
library(tibble)
library(epanetReader)
libray(here)

# tibble with the different network models
network_models <- tibble::tibble(
  ntw.name = c(
    "Res2Res_001",
    "basicDMA_001",
    "basicDMA_002",
    "basicDMA_003",
    "basicDMA_004"
  ),
  inp.file = as.list(NA),
  rpt.file = as.list(NA)
)

network_models$inp.file <- purrr::map(
    here::here("data-raw", "epanet", paste0(network_models$ntw.name, ".inp")),
    ~read.inp(.x)
  )




# usethis::use_data(network_models, overwrite = TRUE)

