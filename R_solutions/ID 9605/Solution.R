library(dplyr)
nominee_filmography%>%
  group_by(name)%>%
  summarise(avg_rating = mean(rating, na.rm = TRUE))%>%
  left_join(nominee_information, by = 'name')%>%
  select(birthday, name, avg_rating)