library(dplyr)
employee%>%
  group_by(salary)%>%
  count()%>%
  filter(n==1)%>%
  ungroup()%>%
  summarise(max(salary))