library(dplyr)
worker_logins%>%
  filter(login_timestamp>='2021-12-13' & login_timestamp<='2021-12-19')%>%
  select(worker_id)%>%
  unique()