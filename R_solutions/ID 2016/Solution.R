library(dplyr)
library(data.table)
postmates_orders%>%
  left_join(postmates_partners, by = c("seller_id" = "id"))%>%
  left_join(postmates_markets, by = c("city_id" = "id"))%>%
  filter(name.x %ilike% 'pizza' & name.y == 'Boston')%>%
  group_by(name = name.x)%>%
  summarise(avg = mean(amount))