library(dplyr)
airbnb_units%>%
  left_join(airbnb_hosts,by="host_id")%>%
  filter(unit_type=="Apartment"& age<30)%>%
  group_by(nationality)%>%
  unique()%>%
  summarise(apartment_count = n())