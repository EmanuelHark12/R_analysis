library(tidyverse)
years <- seq(2014, 2025)

list_files <- paste0("data/lol_historic/", years, "_LoL_esports_match_data_from_OraclesElixir.csv")

df <- list_files %>% map_df(~read.csv(.))
num_champion <- df %>% dplyr::count(champion)
num_champion
