library(dplyr)
yelp_reviews%>%
  slice_max(cool)%>%
  select(business_name,review_text)