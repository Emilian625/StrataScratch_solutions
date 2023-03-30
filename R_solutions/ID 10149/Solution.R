library(dplyr)
airbnb_reviews%>%
  filter(from_type == 'guest')%>%
  left_join(airbnb_guests,by=c('from_user'='guest_id'))%>%
  group_by(gender)%>%
  summarise(avg_score = mean(review_score))%>%
  slice_max(avg_score)