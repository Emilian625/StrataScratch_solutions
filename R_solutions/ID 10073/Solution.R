library(dplyr)
airbnb_reviews%>%
  filter(to_type =='host')%>%
  left_join(airbnb_hosts,by=c('to_user'='host_id'))%>%
  group_by(from_user)%>%
  filter(review_score == max(review_score))%>%
  select(from_user, nationality)%>%
  unique()