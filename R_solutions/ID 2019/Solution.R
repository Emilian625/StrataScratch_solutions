library(dplyr)
rc_users%>%
  left_join(rc_calls, by= "user_id")%>%
  group_by(user_id, company_id)%>%
  summarise(count = n())%>%
  group_by(company_id)%>%
  mutate(ranks = dense_rank(-count))%>%
  filter(ranks <=2)%>%
  select(-count)