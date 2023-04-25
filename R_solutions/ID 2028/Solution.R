library(dplyr)
library(lubridate)
fact_events%>%
  group_by(user_id)%>%
  mutate(first = min(time_id), month = month(time_id), filter = if_else(time_id == first,1,0))%>%
  select(month, filter,user_id)%>%
  unique()%>%
  group_by(month)%>%
  summarise(share_new_users = sum(filter)/n_distinct(user_id), share_existing_users = 1-share_new_users)