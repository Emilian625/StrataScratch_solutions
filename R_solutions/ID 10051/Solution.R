library(dplyr)
yelp_business%>%
  filter(is_open==1)%>%
  summarise(business_open = n())