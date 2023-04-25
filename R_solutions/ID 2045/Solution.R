library(dplyr)
uber_employees%>%
  arrange(hire_date)%>%
  mutate(next_hire = lead(hire_date))%>%
  arrange(termination_date)%>%
  mutate(next_fire = lead(termination_date),hire = (next_hire-hire_date)/86400, fire = (next_fire- termination_date)/86400)%>%
  summarise(max(hire,na.rm=TRUE),max(fire,na.rm=TRUE))