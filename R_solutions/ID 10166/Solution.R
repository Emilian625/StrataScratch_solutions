library(dplyr)
hotel_reviews%>%
  filter(hotel_name == 'Hotel Arena')%>%
  group_by(hotel_name, reviewer_score)%>%
  summarise(n())