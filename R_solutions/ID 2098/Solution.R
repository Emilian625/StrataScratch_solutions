library(dplyr)
travel_history%>%
  group_by(traveler)%>%
  filter(date == min(date) | date == max(date))%>%
  mutate(start = lag(start_city,1))%>%
  filter(start == end_city)%>%
  ungroup()%>%
  count()