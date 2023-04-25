library(dplyr)
amazon_shipment%>%
  group_by(shipment_id)%>%
  mutate(total_weight = sum(weight))