library(tidyverse)
library(lubridate)
uber_orders%>%
  filter(status_of_order == 'Completed')%>%
  group_by(month = month(order_date), service_name)%>%
  summarise(sum = sum(monetary_value,na.rm = TRUE))%>%
  pivot_wider(names_from = service_name, values_from = sum)