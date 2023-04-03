library(dplyr)
library(stringr)
winemag_p2%>%
  mutate(year = str_extract(title, "([0-9])+"))%>%
  filter(country=='Macedonia')%>%
  select(title,year)