library(dplyr)
fb_active_users%>%
  filter(country == 'USA')%>%
  mutate(open = if_else(status == 'open',1,0), closed = if_else(status == 'closed',1,0))%>%
  summarise(active_users_share = sum(open)/(sum(open)+sum(closed)))