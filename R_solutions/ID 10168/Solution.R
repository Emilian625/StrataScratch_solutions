library(dplyr)
iris %>%
  group_by(variety)%>%
  summarise(n())