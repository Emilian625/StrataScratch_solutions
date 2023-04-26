library(dplyr)
linkedin_users%>%
  filter(employer == 'Google' & (start_date != '2021-11-01' | end_date != '2021-01-11') & (end_date >= '2021-11-01' | is.na(end_date)))%>%
  select(user_id)
