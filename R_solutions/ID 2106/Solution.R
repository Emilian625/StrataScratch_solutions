library(dplyr)
user_flags%>%
  mutate(nulls = rowSums(is.na(.) | . == "" | . == " "))%>%
  filter(nulls>1)%>%
  select(-nulls)