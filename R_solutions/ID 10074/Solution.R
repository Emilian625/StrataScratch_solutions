library(dplyr)
airbnb_reviews%>%
  filter(from_type == 'host')%>%
  left_join(airbnb_guests,by = c("to_user" = "guest_id"))%>%
  group_by(from_user)%>%
  summarise(mean(age))