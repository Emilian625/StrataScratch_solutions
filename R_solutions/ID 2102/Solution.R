library(dplyr)

user_flags%>%
  filter(!is.na(flag_id))%>%
  group_by(video_id)%>%
  summarise(num_unique_users = n_distinct(user_firstname,user_lastname))