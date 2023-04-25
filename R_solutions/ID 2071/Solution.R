library(dplyr)
facebook_sales%>%
  left_join(facebook_products, by = "product_id")%>%
  filter(brand_name == "Fort West" | brand_name == "Golden")%>%
  group_by(customer_id)%>%
  summarise(brands = n_distinct(brand_name))%>%
  filter(brands == 2)%>%
  select(1)