library(dplyr)
db_employee%>%
  left_join(db_dept, by=c("department_id" = "id"))%>%
  group_by(department)%>%
  filter(department == "engineering"||department == "marketing")%>%
  summarise(salary = max(salary))%>%
  summarise(salary_difference = abs(max(salary)-min(salary)))