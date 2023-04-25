library(dplyr)
library(lubridate)
fb_searches%>%
  filter(month(date) == 8 & year(date) == 2021)%>%
  group_by(user_id)%>%
  summarise(n= n_distinct(search_id))%>%
  filter(n>5)%>%
  ungroup()%>%
  count()