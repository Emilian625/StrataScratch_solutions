library(dplyr)

doordash_delivery%>%
  group_by(restaurant_id)%>%
  summarise(total  = sum(order_total))%>%
  mutate(percentile_cutoff = quantile(total,0.02)) %>% 
  filter(total < percentile_cutoff)%>%
  select(-3)