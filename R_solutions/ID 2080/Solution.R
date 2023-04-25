library(dplyr)
mobile_logs%>%
  inner_join(web_logs,by=c("date","user_id"))%>%
  group_by(date)%>%
  summarise(n_users = n_distinct(user_id))