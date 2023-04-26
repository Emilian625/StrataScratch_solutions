library(dplyr)
online_orders%>%
  left_join(online_products, by = "product_id")%>%
  mutate(total= n_distinct(customer_id))%>%
  group_by(brand_name)%>%
  filter(product_family == 'CONSUMABLE')%>%
  summarise(pc_cust = floor(n_distinct(customer_id)/total*100))%>%
  distinct()