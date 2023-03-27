library(dplyr)
library(data.table)
olympics_athletes_events%>%
  filter(team %ilike% "/")%>%
  select(name, team, games, sport, medal)