library(dplyr)
shopify_orders%>%
  left_join(shopify_employees, by = c("resp_employee_id"="id"))%>%
  group_by(resp_employee_id)%>%
  summarise(last_name ,count = n_distinct(order_id))%>%
  ungroup()%>%
  slice_max(count)%>%
  distinct()%>%
  select(last_name)