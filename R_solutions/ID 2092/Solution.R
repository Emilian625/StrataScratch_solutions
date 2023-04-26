library(dplyr)
order_details%>%
  group_by(merchant_id, order_day = format(order_timestamp, '%Y-%m-%d'))%>%
  count()%>%
  group_by(order_day)%>%
  mutate(rank = dense_rank(-n))%>%
  left_join(merchant_details, by=c('merchant_id'='id'))%>%
  filter(rank<=3)%>%
  select(order_day, name, rank)%>%
  arrange(order_day,rank)