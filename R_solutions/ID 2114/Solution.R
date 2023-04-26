library(dplyr)
delivery_orders%>%
  filter(!is.na(actual_delivery_time))%>%
  group_by(driver_id)%>%
  slice_min(order_placed_time)%>%
  ungroup()%>%
  summarise(perc_zero_rating = 100*mean(delivery_rating==0))