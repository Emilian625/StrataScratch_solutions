library(dplyr)
wfm_transactions%>%
  left_join(wfm_stores, by = "store_id")%>%
  filter(year(transaction_date)==2017)%>%
  group_by(customer_id,store_brand)%>%
  mutate(avf_bask = mean(sales), segment = case_when(avf_bask<20 ~ "Low",avf_bask>30 ~ "High",avf_bask<=30 & avf_bask>=20 ~ "Medium"))%>%
  group_by(store_brand, segment)%>%
  summarise(number_customers = n_distinct(customer_id), total_transactions = n_distinct(transaction_id), total_sales = sum(sales), avg_basket_size = total_sales/total_transactions)