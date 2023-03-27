library(dplyr)
anti_join(winemag_p1,winemag_p2, by="country")%>%
  select("country")%>%
  unique()