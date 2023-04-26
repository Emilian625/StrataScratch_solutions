library(dplyr)
map_employee_hierarchy%>%
  left_join(dim_employee, by = "empl_id")%>%
  left_join(dim_employee, by = c("manager_empl_id" = "empl_id"))%>%
  group_by(manager_empl_id)%>%
  summarise(avg_employee_salary = mean(salary.x), manager_salary = min(salary.y))%>%
  filter(avg_employee_salary*2 >manager_salary)