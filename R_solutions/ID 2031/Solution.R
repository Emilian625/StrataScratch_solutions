library(dplyr)
library(lubridate)
signups%>%
  left_join(plans, by=c("plan_id"="id"))%>%
  left_join(transactions, by="signup_id")%>%
  mutate(added = add_with_rollback(transaction_start_date, period(10,"month")))%>%
  filter(added <'2021-03-01')%>%
  group_by(billing_cycle,signup_id)%>%
  summarise(avg_amt = mean(amt))%>%
  arrange(desc(billing_cycle),signup_id)