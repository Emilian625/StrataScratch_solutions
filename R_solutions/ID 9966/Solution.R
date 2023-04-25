library(dplyr)
library(stringr)
qbstats_2015_2016%>%
  filter(year==2016)%>%
  slice_max(lg)%>%
  select(qb,lg)%>%
  mutate(lg_num = str_extract(lg ,"\\d+"))