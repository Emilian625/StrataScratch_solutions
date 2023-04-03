library(dplyr)
yelp_business%>%
  filter(stars==5)%>%
  group_by(state)%>%
  summarise(count = n_distinct(business_id))%>%
  slice_max(count, n=5)%>%
  arrange(desc(count),state)