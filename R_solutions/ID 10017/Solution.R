library(dplyr)
library(lubridate)
lyft_drivers%>%
  group_by(year = year(end_date))%>%
  summarise(n_churned = n())%>%
  filter(!is.na(year))%>%
  mutate(n_churned_prev = coalesce(lag(n_churned),0), case = case_when(n_churned == n_churned_prev ~ 'no change', n_churned < n_churned_prev ~ 'decrease', n_churned > n_churned_prev ~ 'increase'))