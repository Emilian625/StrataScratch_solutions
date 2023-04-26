library(dplyr)
online_orders%>%
  left_join(online_products, by = 'product_id')%>%
  filter(product_class  ==  'FURNITURE')%>%
  group_by(product_id, brand_name)%>%
  mutate(unique_cust_no = n_distinct(customer_id))%>%
  select(product_id,brand_name, customer_id,unique_cust_no)%>%
  distinct()