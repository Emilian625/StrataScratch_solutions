library(dplyr)
yelp_reviews%>%
  filter(business_name == "Lo-Lo's Chicken & Waffles") %>%
  group_by(stars)%>%
  count()