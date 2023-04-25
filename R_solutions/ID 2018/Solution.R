library(dplyr)
library(lubridate)

df = rc_calls%>%
  filter(month(date) == 4 & year(date)==2020)

rc_users%>%
  left_join(df, by = "user_id")%>%
  filter(status =='free'& is.na(call_id))%>%
  select(user_id)%>%
  unique()
