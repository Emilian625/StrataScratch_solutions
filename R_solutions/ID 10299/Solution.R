library(dplyr)
ms_employee_salary%>%
  group_by(first_name,last_name)%>%
  summarise(id = max(id),department_id = max(department_id),max = max(salary))%>%
  arrange(id)