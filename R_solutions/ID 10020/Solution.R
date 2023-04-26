library(dplyr)
winemag_p1%>%
  filter(country == 'Italy' | country == 'France' | country == 'Spain')%>%
  select(price)