library(tidyverse)
postmates_orders%>%
  mutate(order_timestamp_utc = format(order_timestamp_utc, '%Y-%m-%d'))%>%
  filter(order_timestamp_utc == '2019-03-11' | order_timestamp_utc == '2019-04-11')%>%
  select(order_timestamp_utc, city_id, amount)%>%
  group_by(city_id,order_timestamp_utc)%>%
  mutate(amount= sum(amount))%>%
  unique()%>%
  pivot_wider(names_from = order_timestamp_utc, values_from =  amount)%>%
  left_join(postmates_markets, by = c("city_id" = "id"))%>%
  ungroup()%>%
  select(name, march = "2019-03-11", april = "2019-04-11")%>%
  summarise(name,diff = april-march)%>%
  arrange(diff)%>%
  slice(c(1, n()))