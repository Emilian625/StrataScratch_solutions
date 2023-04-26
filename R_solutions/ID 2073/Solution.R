library(dplyr)
user_sessions%>%
  left_join(post_views, by = 'session_id')%>%
  mutate(viewtime = (session_endtime- session_starttime)*perc_viewed/100)%>%
  group_by(post_id)%>%
  summarise(total_viewtime = sum(viewtime))%>%
  filter(total_viewtime>5)