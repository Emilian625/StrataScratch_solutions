library(dplyr)
library(data.table)
players_results%>%
  arrange(player_id,match_date)%>%
  group_by(player_id,rleid = rleid(match_result == "W"))%>%
  filter(match_result == 'W')%>%
  summarise(streak_length = n())%>%
  ungroup()%>%
  slice_max(streak_length)