library(tidyverse)
df = user_flags%>%
  left_join(flag_review, by ='flag_id')%>%
  filter(reviewed_outcome == 'REMOVED')%>%
  group_by(reviewed_date)%>%
  summarise(n_removed = n_distinct(video_id))

user_flags%>%
  left_join(flag_review, by ='flag_id')%>%
  group_by(user_firstname, user_lastname)%>%
  filter(reviewed_by_yt==1)%>%
  summarise(max = max(reviewed_date))%>%
  left_join(df, by = c('max' = 'reviewed_date'))%>%
  mutate(n_removed = coalesce(n_removed,0))