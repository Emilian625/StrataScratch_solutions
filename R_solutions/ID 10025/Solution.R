library(dplyr)
union_all(winemag_p1,winemag_p2)%>%
  select(variety)%>%
  unique()%>%
  arrange(variety)