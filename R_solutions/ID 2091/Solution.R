library(dplyr)
players_logins%>%
  group_by(player_id)%>%
  summarise(max(login_date))