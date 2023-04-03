library(dplyr)
library(stringr)
winemag_p2%>%
  mutate(year = str_extract(title, "\\d{4}"))%>%
  group_by(year)%>%
  summarise(avg_points = mean(points))%>%
  filter(year>2000)%>%
  mutate(prev_avg_points = coalesce(lag(avg_points),87), difference = avg_points-prev_avg_points)