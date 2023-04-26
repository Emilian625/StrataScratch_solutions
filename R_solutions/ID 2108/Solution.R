library(dplyr)
map_employee_territory%>%
  left_join(map_customer_territory, by = "territory_id")%>%
  group_by(empl_id)%>%
  count()%>%
  ungroup()%>%
  slice_max(n)