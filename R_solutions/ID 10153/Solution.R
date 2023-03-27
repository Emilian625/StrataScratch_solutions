library(dplyr)
library(data.table)
yelp_business%>%
  filter(categories %ilike% 'pizza')%>%
  summarise(count = n())