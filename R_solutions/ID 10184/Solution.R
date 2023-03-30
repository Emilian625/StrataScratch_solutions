library(dplyr)
olympics_athletes_events%>%
  group_by(noc)%>%
  summarise(first_time_year = min(year))