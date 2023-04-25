library(dplyr)
user_sessions%>%
  group_by(platform)%>%
  summarise(n_distinct(user_id))