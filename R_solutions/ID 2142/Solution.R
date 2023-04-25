library(dplyr)
amazon_shipment%>%
  group_by(shipment_id)%>%
  summarise(total_weight  = sum(weight))%>%
  ungroup()%>%
  mutate(rank = dense_rank(-total_weight))%>%
  filter(rank ==3)