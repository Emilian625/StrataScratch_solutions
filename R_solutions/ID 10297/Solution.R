library(dplyr)
library(lubridate)
fb_comments%>%
  left_join(fb_users, by = c('user_id'='id'))%>%
  filter(joined_at<=created_at & created_at>= '2020-01-01' & created_at<= '2020-01-31' & year(joined_at)>=2018 & year(joined_at)<=2020)%>%
  group_by(user_id)%>%
  summarise(count=n_distinct(body))%>%
  group_by(count)%>%
  summarise(n_users = n())