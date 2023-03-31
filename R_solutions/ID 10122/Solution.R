library(dplyr)
library(data.table)
airbnb_search_details%>%
  filter(amenities %ilike% 'TV' & neighbourhood=='Westlake' & property_type =='House')%>%
  summarise(n_searches = n())