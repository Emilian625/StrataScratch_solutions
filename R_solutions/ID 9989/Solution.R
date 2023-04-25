library(dplyr)
sf_public_salaries%>%
  group_by(jobtitle)%>%
  mutate(ranks = row_number(desc(totalpaybenefits)) , best = case_when(row_number(desc(totalpaybenefits)) == 1 ~ employeename), second_best = case_when(row_number(desc(totalpaybenefits)) == 2 ~ employeename))%>%
  select(jobtitle, best, second_best)%>%
  summarise(best = max(best,na.rm = TRUE), second_best = min(second_best,na.rm = TRUE))