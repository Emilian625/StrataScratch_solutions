library(dplyr)
yelp_business%>%
  group_by(state)%>%
  summarise(mean(stars))