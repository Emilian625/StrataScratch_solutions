library(dplyr)
shopify_orders%>%
  left_join(shopify_users, by=c("user_id"="id"))%>%
  filter(country == 'Germany')%>%
  left_join(map_product_order, by="order_id")%>%
  left_join(dim_product, by = c("product_id"="prod_sku_id"))%>%
  group_by(market_name)%>%
  count()%>%
  ungroup()%>%
  slice_max(n)