library(dplyr)
facebook_employees%>%
  left_join(facebook_employees, by = c("location", "gender"))%>%
  filter(is_senior.x!=is_senior.y & age.x!=age.y)%>%
  select(employee_1= id.x, employee_2 = id.y)