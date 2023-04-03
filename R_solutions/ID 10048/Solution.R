library(dplyr)
yelp_business%>%
  slice_max(review_count, n=5)%>%
  select(name, review_count)