library(dplyr)
library(lubridate)
delivery_orders%>%
  filter(!is.na(actual_delivery_time) & year(actual_delivery_time)==2021)%>%
  left_join(order_value, by = 'delivery_id')%>%
  group_by(month = month(actual_delivery_time), restaurant_id)%>%
  summarise(total = sum(sales_amount))%>%
  group_by(month)%>%
  summarise(perc_over_100 = sum(total >=100)/n()*100)