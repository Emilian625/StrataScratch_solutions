library(dplyr)
facebook_sales%>%
  left_join(facebook_products, by = "product_id")%>%
  group_by(product_class)%>%
  summarise(total = n())%>%
  slice_max(total,n=3)%>%
  select(product_class)