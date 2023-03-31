library(dplyr)
airbnb_reviews%>%
  group_by(from_type)%>%
  summarise(winner = round(mean(review_score),2))%>%
  slice_max(winner)