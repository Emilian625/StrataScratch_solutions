library(dplyr)
amazon_shipment%>%
  group_by(shipment_id)%>%
  mutate(min = min(shipment_date))%>%
  filter(shipment_date == min)%>%
  select(shipment_id, weight)