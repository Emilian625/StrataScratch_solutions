library(dplyr)
library(data.table)
winemag_p1%>%
  filter(winery %ilike% 'bodega' & country != 'Spain' & description %ilike% 'blackberry')%>%
  group_by(country, region_1)%>%
  summarise(n_distinct(winery))