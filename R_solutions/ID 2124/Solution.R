library(dplyr)
facebook_sales_promotions%>%
  group_by(media_type)%>%
  summarise(total_spent = sum(cost))%>%
  slice_max(total_spent, n =2)