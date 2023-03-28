library(dplyr)
billboard_top_100_year_end %>%
  filter(year >=2003, year_rank==1) %>%
  select(song_name) %>%
  unique()