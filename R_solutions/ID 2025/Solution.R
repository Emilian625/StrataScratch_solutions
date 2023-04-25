library(dplyr)
fact_events%>%
  group_by(user_id)%>%
  mutate(n_clients = n_distinct(client_id))%>%
  filter(n_clients == 1)%>%
  group_by(client_id)%>%
  summarise(count = n_distinct(user_id))