library(dplyr)
natera_subscriptions%>%
  mutate(t1 = sum(contract_start<='2021-09-01' & (contract_end >='2021-09-01' | is.na(contract_end))), t2 = sum(contract_start<='2021-09-30' & (contract_end >='2021-09-30' | is.na(contract_end))))%>%
  distinct(t1,t2)%>%
  summarise(churn_rate = 100*(t1-t2)/t1)