library(dplyr)
yelp_reviews%>%
  filter(business_name == "Lo-Lo's Chicken & Waffles" & stars==5)%>%
  count()