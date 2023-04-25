library(dplyr)
loans%>%
  filter(type == 'Refinance')%>%
  group_by(user_id)%>%
  mutate(max = max(created_at))%>%
  filter(created_at == max)%>%
  left_join(submissions, by = c("id" = "loan_id"))%>%
  select(user_id, balance)