library(dplyr)
uber_employees%>%
  left_join(uber_annual_review, by = c("id"="emp_id"))%>%
  filter(is.na(review_date))%>%
  select(first_name, last_name,hire_date, termination_date)%>%
  unique()