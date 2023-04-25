library(dplyr)
library(data.table)
df = az_employees%>%
  group_by(department_name)%>%
  summarise(count = n())%>%
  slice_max(count,n=1)

az_employees%>%
  inner_join(df, by = "department_name")%>%
  filter(position %ilike% 'manager')%>%
  select(first_name, last_name)