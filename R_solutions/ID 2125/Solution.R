library(dplyr)
noom_signups%>%
  left_join(noom_transactions, by="signup_id")%>%
  left_join(noom_plans, by = "plan_id")%>%
  mutate(days = refunded_at-settled_at)%>%
  filter(started_at>='2019-01-01')%>%
  group_by(billing_cycle_in_months)%>%
  summarise(min_days = min(days), avg_days= mean(days), max_days=max(days))