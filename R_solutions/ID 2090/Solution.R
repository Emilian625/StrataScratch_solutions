library(dplyr)
library(lubridate)
players_logins%>%
  group_by(player_id)%>%
  mutate(login_date = min(login_date)+days(1))%>%
  left_join(players_logins, by = c('player_id', 'login_date'), keep = TRUE)%>%
  distinct()%>%
  summarise(retention_rate = mean(!is.na(login_date.y)))