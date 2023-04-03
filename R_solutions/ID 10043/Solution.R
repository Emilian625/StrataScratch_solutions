library(dplyr)
union_all(winemag_p1,winemag_p2)%>%
  group_by(variety)%>%
  summarise(median(price, na.rm = TRUE))