library(dplyr)
amazon_transactions%>%
  group_by(user_id)%>%
  arrange(user_id,created_at)%>%
  mutate(next_purchase = lead(created_at,1),time_diff = (lead(created_at,1)-created_at)/86400)%>%
  filter(time_diff<=7)%>%
  select(user_id)%>%
  unique()