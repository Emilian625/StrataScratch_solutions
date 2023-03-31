library(dplyr)
sf_employee%>%
  left_join(sf_bonus, by=c('id'='worker_ref_id'))%>%
  filter(bonus>0)%>%
  group_by(id)%>%
  summarise(compensation = max(salary)+ sum(bonus), employee_title = min(employee_title),sex = min(sex))%>%
  group_by(employee_title, sex)%>%
  summarise(avg_compensation = mean(compensation))