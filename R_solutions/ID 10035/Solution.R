library(tidyverse)
winemag_p2%>%
  mutate(filt = if_else(is.na(designation), 'without_designation','with_designation'))%>%
  group_by(country,filt)%>%
  count()%>%
  pivot_wider(id_cols = country, names_from = filt, values_from = n,names_prefix = "total_")%>%
  mutate_all(~ coalesce(., 0))%>%
  mutate(grand_total = total_with_designation + total_without_designation)