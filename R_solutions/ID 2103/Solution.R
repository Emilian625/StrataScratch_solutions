library(dplyr)
user_flags%>%
  left_join(flag_review, by = 'flag_id')%>%
  group_by(video_id)%>%
  filter(!is.na(flag_id))%>%
  mutate(n_flags = n())%>%
  summarise(n_flags,num_flags_reviewed_by_yt = sum(coalesce(reviewed_by_yt,0)))%>%
  ungroup()%>%
  slice_max(n_flags)%>%
  distinct()%>%
  select(-2)