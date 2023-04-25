library(dplyr)
amazon_shipment%>%
  group_by(year_month = format(shipment_date, '%Y-%m'))%>%
  summarize(count=n_distinct(shipment_id,sub_id))