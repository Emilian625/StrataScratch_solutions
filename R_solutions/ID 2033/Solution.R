library(dplyr)
transactions%>%
  left_join(signups, by = "signup_id")%>%
  group_by(location) %>%
  mutate(mean_revenue =  mean(amt))%>%
  select(signup_id,location, mean_revenue)%>%
  unique()%>%
  left_join(signups, by = c("signup_id","location"))%>%
  mutate(duration = signup_stop_date - signup_start_date)%>%
  group_by(location)%>%
  mutate(mean_duration = mean(duration),ratio =  mean_revenue/as.numeric(mean_duration))%>%
  select(location, mean_duration, mean_revenue, ratio)%>%
  unique()