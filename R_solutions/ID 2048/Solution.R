library(tidyverse)
uber_orders%>%
  select(-order_date)%>%
  group_by(service_name, status_of_order)%>%
  summarise(sum_1 = sum(monetary_value,na.rm=TRUE),sum_2 = sum(number_of_orders,na.rm=TRUE))%>%
  group_by(service_name)%>%
  mutate(total= sum(sum_1), profit_loss_percent = 100-(sum_1/total)*100, total_or= sum(sum_2), orders_loss_percent = 100-(sum_2/total_or)*100)%>%
  filter(status_of_order =='Completed')%>%
  select(service_name, orders_loss_percent, profit_loss_percent)