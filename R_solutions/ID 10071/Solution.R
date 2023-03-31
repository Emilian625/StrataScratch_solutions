library(dplyr)
airbnb_hosts%>%
  left_join(airbnb_apartments, by='host_id')%>%
  filter(nationality!=country)%>%
  summarise(count=n_distinct(host_id))