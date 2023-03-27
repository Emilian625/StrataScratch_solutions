library(dplyr)
library(lubridate)
online_retail%>%
  mutate(paid = unitprice*quantity)%>%
  group_by(month = month(invoicedate),stockcode)%>%
  summarise(total_paid = sum(paid), description = min(description))%>%
  ungroup()%>%
  group_by(month)%>%
  mutate(ranks = rank(desc(total_paid)))%>%
  filter(ranks==1)%>%
  select(month, description, total_paid)
