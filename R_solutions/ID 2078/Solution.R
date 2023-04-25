library(dplyr)
linkedin_users%>%
  group_by(user_id)%>%
  arrange(user_id,start_date)%>%
  mutate(nex_employer = lead(employer,1))%>%
  filter(employer == 'Microsoft', nex_employer == 'Google')%>%
  count()