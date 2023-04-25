library(dplyr)
not_1500 = uber_advertising%>%
  filter(customers_acquired<1500)%>%
  select(advertising_channel)%>%
  unique() 

uber_advertising%>%
  anti_join(not_1500, by="advertising_channel")%>%
  group_by(advertising_channel)%>%
  slice_max(money_spent)%>%
  ungroup()%>%
  slice_min(money_spent)%>%
  select(advertising_channel)