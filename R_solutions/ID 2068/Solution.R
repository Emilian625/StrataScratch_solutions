library(dplyr)
facebook_sales%>%
  left_join(facebook_products, by = "product_id")%>%
  group_by(product_id)%>%
  mutate(sales = n(), avg = mean(cost_in_dollars))%>%
  filter(sales>1 & avg>=3)%>%
  distinct(product_id, brand_name)