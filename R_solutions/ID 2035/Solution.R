library(dplyr)
library(lubridate)
doordash_delivery%>%
  mutate(hour = hour(customer_placed_order_datetime))%>%
  filter(hour>=15 & hour<=18 & delivery_region == 'San Jose')%>%
  group_by(hour)%>%
  summarise(mean(order_total))