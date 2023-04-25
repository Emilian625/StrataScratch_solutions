library(dplyr)
library(lubridate)
sf_events%>%
  filter(month(date)==1 & year(date)==2021)%>%
  group_by(account_id)%>%
  summarise(users_count = n_distinct(user_id))