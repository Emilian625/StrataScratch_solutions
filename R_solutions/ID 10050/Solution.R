library(dplyr)
yelp_business%>%
  filter(stars ==1 )%>%
  select(review_count, name)