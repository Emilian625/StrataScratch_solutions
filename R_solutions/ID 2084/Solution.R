library(dplyr)
library(lubridate)
fb_blocked_users%>%
  mutate(block_end = block_date + days(block_duration))%>%
  filter(block_date<='2021-12-31'& (is.na(block_end) | block_end>='2021-12-01' ))%>%
  group_by(block_reason)%>%
  summarise(n_distinct(user_id))