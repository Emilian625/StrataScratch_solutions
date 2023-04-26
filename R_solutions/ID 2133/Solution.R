library(dplyr)
videos_watched%>%
  group_by(user_id)%>%
  mutate(rank = dense_rank(watched_at))%>%
  filter(rank <=3)%>%
  group_by(video_id)%>%
  count()%>%
  ungroup()%>%
  mutate(rank = dense_rank(-n))%>%
  filter(rank <=3)