library(dplyr)
users_friends%>%
  inner_join(users_pages, by = c("friend_id"="user_id"))%>%
  anti_join(users_pages, by =c("user_id", "page_id"))%>%
  select(-2)%>%
  distinct()