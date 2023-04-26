library(tidyverse)
winemag_p1%>%
  group_by(country, winery)%>%
  summarise(avg = mean(points))%>%
  mutate(rank = row_number(-avg), winery = paste0(winery, ' (',avg,')'))%>%
  select(country,winery, rank)%>%
  filter(rank <=3)%>%
  pivot_wider(names_from = 'rank', values_from='winery')%>%
  rename(top_winery = 2,second_winery = 3, third_winery = 4)%>%
  mutate(second_winery = coalesce(second_winery,'No second winery'), third_winery = coalesce(third_winery,'No third winery'))