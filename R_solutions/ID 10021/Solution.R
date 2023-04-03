library(dplyr)
winemag_p1%>%
  filter(points>=95)%>%
  select(winery)%>%
  unique()