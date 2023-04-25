library(dplyr)
library(lubridate)
order_details%>%
  mutate(order_timestamp = format(order_timestamp, '%Y-%m-%d'))%>%
  group_by(merchant_id, order_timestamp)%>%
  summarise(total = sum(total_amount_earned))%>%
  group_by(order_timestamp)%>%
  slice_max(total)%>%
  inner_join(merchant_details, by = c('merchant_id' = 'id'))%>%
  select(order_timestamp,name)%>%
  mutate(order_timestamp = format(as.POSIXct(order_timestamp)+days(1), '%Y-%m-%d'))