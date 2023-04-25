library(dplyr)
airbnb_hosts%>%
  inner_join(airbnb_guests, by = c("nationality", "gender"))%>%
  select(host_id, guest_id)%>%
  unique()