library(tidyverse)
yelp_business%>%
  mutate(categories = strsplit(categories, ";"))%>%
  unnest(categories, .drop = FALSE)%>%
  group_by(categories)%>%
  summarise(review_cnt= sum(review_count))%>%
  arrange(-review_cnt)