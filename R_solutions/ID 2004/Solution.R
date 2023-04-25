library(dplyr)
fb_comments_count%>%
  filter(created_at <= "2020-02-10" & created_at>"2020-01-10") %>%
  select(user_id, number_of_comments)%>%
  group_by(user_id)%>%
  summarise(sum(number_of_comments))