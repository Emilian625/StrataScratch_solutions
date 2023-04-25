library(dplyr)
google_salaries%>%
  group_by(education)%>%
  summarise(mean(salary))