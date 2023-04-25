library(dplyr)
library(lubridate)
values = sf_events%>%
  filter(month(date)==1, year(date)==2021)%>%
  group_by(account_id)%>%
  summarise(n = n(),average = n/31)%>%
  select(-n)