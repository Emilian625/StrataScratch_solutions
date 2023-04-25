library(dplyr)
library(lubridate)
wfm_transactions%>%
  filter(year(transaction_date)==2017)%>%
  left_join(wfm_products, by = "product_id")%>%
  group_by(product_category)%>%
  summarise(transactions = n_distinct(transaction_id), sales = sum(sales))%>%
  arrange(-sales)