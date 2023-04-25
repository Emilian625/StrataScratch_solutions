library(dplyr)
library(lubridate)
wfm_transactions%>%
  filter(sales>=5, year(transaction_date)==2017)%>%
  group_by(month(transaction_date))%>%
  summarise(transactions = n_distinct(transaction_id) ,customers = n_distinct(customer_id))