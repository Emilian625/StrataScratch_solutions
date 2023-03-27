library(dplyr)
yelp_business%>%
  filter(stars==5)%>%
  group_by(city)%>%
  summarise(count_of_5_stars = n())%>%
  slice_max(count_of_5_stars,n=5)