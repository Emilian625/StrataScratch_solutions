library(dplyr)
housing_units_completed_us%>%
  mutate(total = south+west+midwest+northeast)%>%
  group_by(year)%>%
  summarise(n_units = sum(total))