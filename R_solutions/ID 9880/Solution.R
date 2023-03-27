library(dplyr)
hotel_reviews%>%
  group_by(hotel_name)%>%
  summarise(max_total_reviews = max(total_number_of_reviews_reviewer_has_given))%>%
  slice_max(max_total_reviews,n=5)