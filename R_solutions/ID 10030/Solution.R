library(dplyr)
winemag_p1%>%
  group_by(winery, variety)%>%
  mutate(min = min(points))%>%
  filter(min>=90)%>%
  summarise(sum(price))