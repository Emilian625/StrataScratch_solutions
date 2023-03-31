library(dplyr)
world = spotify_worldwide_daily_song_ranking%>%
  filter(position ==1)%>%
  select(date, artist, trackname)

us = spotify_daily_rankings_2017_us%>%
  filter(position ==1)%>%
  select(date, artist, trackname)

inner_join(world,us,by=c("artist","trackname", "date"))%>%
  group_by(trackname)%>%
  summarise(n_days_on_n1_position= n())