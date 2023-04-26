library(dplyr)
df = facebook_sales%>%
  left_join(facebook_products, by = "product_id")

facebook_product_categories%>%
  mutate(total_count = n_distinct(category_id))%>%
  inner_join(df, by = c('category_id'='product_category'),keep=TRUE)%>%
  mutate(total_sold = n_distinct(product_category))%>%
  summarise(percentage_of_unsold_categories = 100*(total_count-total_sold)/total_count)%>%
  distinct()