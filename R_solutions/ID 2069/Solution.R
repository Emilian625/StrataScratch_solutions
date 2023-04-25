library(dplyr)
facebook_sales%>%
  left_join(facebook_promotions%>% mutate(valid = 1), by = "promotion_id")%>%
  summarise(valid_n = sum(valid,na.rm=TRUE)/n()*100)