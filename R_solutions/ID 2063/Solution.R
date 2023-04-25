library(tidyverse)
sf_exchange_rate%>%
  filter(date=='2020-01-01'| date == '2020-07-01')%>%
  pivot_wider(names_from = date, values_from = exchange_rate)%>%
  select(-target_currency, jan = '2020-01-01', jul = '2020-07-01')%>%
  summarise(source_currency,difference=jul-jan )