library(dplyr)
fact_events%>%
  filter(client_id == 'mobile')%>%
  group_by(customer_id)%>%
  summarise(events = n())%>%
  mutate(rank = dense_rank(events))%>%
  filter(rank<=2)%>%
  select(customer_id,events)