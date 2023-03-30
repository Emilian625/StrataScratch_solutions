library(dplyr)
library(lubridate)

sf_transactions%>%
  mutate(year = year(created_at),month = month(created_at))%>%
  group_by(year_month = format(as.Date(sf_transactions$created_at), "%Y-%m"))%>%
  summarise(revenue = sum(value))%>%
  mutate(revenue_diff_pct = round((revenue-lag(revenue))/lag(revenue)*100,2))%>%
  ungroup()%>%
  select(year_month,revenue_diff_pct)