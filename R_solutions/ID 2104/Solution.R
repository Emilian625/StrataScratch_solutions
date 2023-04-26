library(dplyr)
user_flags%>%
  left_join(flag_review, by = "flag_id")%>%
  group_by(user_firstname, user_lastname)%>%
  filter(reviewed_outcome == 'APPROVED')%>%
  summarise(count = n_distinct(video_id))%>%
  ungroup()%>%
  slice_max(count)%>%
  summarise(username = paste(user_firstname, user_lastname))