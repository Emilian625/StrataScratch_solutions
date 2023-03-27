library(dplyr)
olympics_athletes_events%>%
  filter(age>=20 & age<=30 & sport=="Judo" & !is.na(weight) & !is.na(medal))%>%
  group_by(team)%>%
  summarise(average_player_weight = mean(weight))