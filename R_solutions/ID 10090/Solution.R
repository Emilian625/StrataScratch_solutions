library(dplyr)
orders %>%
  left_join(customers, by=c("cust_id"="id"))%>%
  mutate(total = n())%>%
  filter(!is.na(address)) %>%
  summarise(percent_shipable = 100*n()/total)%>%
  unique()