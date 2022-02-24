
library(tidyverse)

df <-read.csv2("data/0301935S_20220224-161616.csv", skip=1)
df %>%
  filter(!grepl("^[.]", TRANSAKCIJE)) %>%
  filter(X2020 != "100.0") %>%
  mutate(X2020 = as.numeric(X2020)) %>%
  select(-MERITVE) ->  level1

waffle(round(level1$X2020), rows = 5, size = 2)

df %>%
  filter(grepl("^[.]{2}\\w", TRANSAKCIJE))

x <- c(`končna potrošnja` = 70.8,
       `bruto investicije`=30,
       `saldo menjave` = 9.2)
waffle(x * 10, rows = 20)
