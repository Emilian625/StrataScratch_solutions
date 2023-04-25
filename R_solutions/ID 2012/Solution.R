library(dplyr)
df = twitch_sessions%>%
  group_by(user_id)%>%
  mutate(min = min(session_start))%>%
  filter(session_start == min & session_type == 'viewer')

twitch_sessions%>%
  inner_join(df, by = "user_id")%>%
  group_by(user_id)%>%
  filter(session_type.x == 'streamer')%>%
  summarise(n_distinct(session_id.x))