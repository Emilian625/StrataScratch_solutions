library(dplyr)
df = facebook_web_log%>%
  group_by(user_id,as.Date(timestamp))%>%
  filter(action == 'page_load')%>%
  slice_max(timestamp, n=1)

df2 = facebook_web_log%>%
  group_by(user_id,as.Date(timestamp))%>%
  filter(action == 'page_exit')%>%
  slice_min(timestamp, n=1)

merge = inner_join(df,df2, by =c('as.Date(timestamp)','user_id'))%>%
  mutate(time_diff = timestamp.y - timestamp.x)%>%
  group_by(user_id)%>%
  summarise(avg = mean(time_diff))