library(dplyr)
library(tidyverse)
df = union(winemag_pd%>%select(region = region_1, variety, price),winemag_pd%>%select(region = region_2, variety, price))%>%
  group_by(region)%>%
  mutate(min = dense_rank(price), max = dense_rank(-price))%>%
  filter(min==1| max == 1)%>%
  drop_na(region)

df%>%
  slice_min(max,n=1)%>%
  select(region, most_expensive_variety = variety)%>%
  inner_join(df%>% filter(min ==1), by = 'region')%>%
  select(1,2,cheapest_variety = variety)