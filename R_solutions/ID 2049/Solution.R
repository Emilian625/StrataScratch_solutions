library(dplyr)
uber_orders%>%
  group_by(service_name, status_of_order)%>%
  summarise(orders_sum = sum(number_of_orders))