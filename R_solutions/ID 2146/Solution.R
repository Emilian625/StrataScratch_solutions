library(dplyr)
dep_mean = employee_o%>%
  filter(id!=manager_id)%>%
  group_by(department)%>%
  summarise(dep_mean = round(mean(salary),0))

employee_o%>%
  filter(id!=manager_id)%>%
  left_join(dep_mean, by = 'department')%>%
  left_join(employee_o, by =c("manager_id"="id"))%>%
  select(department.x, id, salary.x, salary.y, dep_mean)