library(dplyr)
customers %>%
  anti_join(orders, by=c("id"="cust_id"))%>%
  summarise(n_customers_without_orders = n())