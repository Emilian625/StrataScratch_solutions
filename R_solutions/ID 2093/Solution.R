library(dplyr)
df = order_details%>%
  group_by(customer_id)%>%
  mutate(min = min(order_timestamp))%>%
  filter(order_timestamp == min)%>%
  group_by(merchant_id)%>%
  summarise(first_time_orders = n())%>%
  distinct()

df1 = order_details%>%
  group_by(merchant_id)%>%
  summarise(total_number_of_orders = n())

merchant_details%>%
  left_join(df, by = c('id'= 'merchant_id'))%>%
  inner_join(df1, by = c('id'= 'merchant_id'))%>%
  mutate(first_time_orders = coalesce(first_time_orders,0))%>%
  select(name,total_number_of_orders, first_time_orders)