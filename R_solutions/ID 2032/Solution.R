library(tidyverse)
library(lubridate)
signups%>%
  left_join(plans, by=c("plan_id" = "id"))%>%
  mutate(weekday = wday(signup_start_date, week_start=1))%>%
  group_by(weekday,billing_cycle)%>%
  summarise(count = n())%>%
  select(weekday, billing_cycle, count)%>%
  pivot_wider(names_from = billing_cycle, values_from = count)%>%
  mutate_all(~coalesce(.,0))