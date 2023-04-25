library(dplyr)
fb_searches%>%
  filter(year(date) == 2021 & quarter(date) == 2)%>%
  summarise(result = n_distinct(search_id))