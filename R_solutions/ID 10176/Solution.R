library(dplyr)
dc_bikeshare_q1_2012%>%
  group_by(bike_number)%>%
  summarise(max(end_time))