library(dplyr)
df = playbook_events%>%
  left_join(playbook_users,by="user_id")%>%
  group_by(language)%>%
  summarise(n_total_users = n_distinct(user_id))%>%
  ungroup()

df1=playbook_events%>%
  left_join(playbook_users,by="user_id")%>%
  filter(device =="iphone 5s"|device=="macbook pro"|device=="ipad air")%>%
  group_by(language)%>%
  mutate(n_apple_users = n_distinct(user_id))%>%
  select(language,n_apple_users)%>%
  unique()
left_join(df,df1,by="language")%>%
  mutate(n_apple_users = coalesce(n_apple_users,0))%>%
  arrange(desc(n_total_users))
