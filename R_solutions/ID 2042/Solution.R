library(dplyr)
uber_employees%>%
  mutate(years_spent = coalesce(termination_date,as.POSIXct('2021-05-01')), years_spent = (years_spent-hire_date)/365,still_employed = if_else(is.na(termination_date),'Yes','No'))%>%
  filter(years_spent>2)%>%
  select(first_name,last_name,years_spent,still_employed)