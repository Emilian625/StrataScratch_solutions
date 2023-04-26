library(dplyr)
library(tidyr)
facebook_sales%>%
  left_join(facebook_sales_promotions, by = "promotion_id")%>%
  group_by(promotion_id)%>%
  summarise(start_date_percentage = 100*sum(date == start_date)/n() , end_date_percentage= 100*sum(date == end_date)/n())%>%
  drop_na()