library(lubridate)
library(dplyr)
postmates_orders%>%
  mutate(day = format(order_timestamp_utc, "%Y-%m-%d-%H") )%>%
  group_by(day)%>%
  mutate(count = n())%>%
  group_by(hour = hour(order_timestamp_utc))%>%
  summarise(avg_orders = mean(count))%>%
  slice_max(avg_orders)