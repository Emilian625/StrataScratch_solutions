library(dplyr)
playbook_events%>%
  left_join(playbook_users,by = "user_id")%>%
  group_by(location, language)%>%
  summarise(n_speakers=n_distinct(user_id)) %>%
  arrange(location)