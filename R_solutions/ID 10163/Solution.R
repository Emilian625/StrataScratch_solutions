library(dplyr)
excel_sql_inventory_data %>%
  right_join(excel_sql_transaction_data, by = "product_id") %>%
  group_by(product_name) %>%
  summarise(count = n()) %>%
  arrange(count)