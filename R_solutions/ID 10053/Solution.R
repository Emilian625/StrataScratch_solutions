library(dplyr)
yelp_checkin%>%
  slice_max(checkins,n=5)%>%
  select(business_id, checkins)