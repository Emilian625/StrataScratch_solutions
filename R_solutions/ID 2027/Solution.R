library(dplyr)
anti = fact_events%>%
  filter(client_id!='desktop')%>%
  select(user_id)%>%
  unique()

fact_events%>%
  anti_join(anti, by = "user_id")%>%
  group_by(customer_id)%>%
  summarise(count = n_distinct(user_id))%>%
  slice_max(count)%>%
  select(customer_id)