library(dplyr)
library(lubridate)
lyft_orders%>%
  left_join(lyft_payments,by = "order_id")%>%
  filter(promo_code==0 & month(order_date)==8 & year(order_date)==2021)%>%
  group_by(city)%>%
  summarise(count = n())%>%
  slice_max(count)