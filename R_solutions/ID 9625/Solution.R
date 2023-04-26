library(dplyr)
airbnb_search_details%>%
  group_by(city)%>%
  slice_min(price)%>%
  select(city, price)