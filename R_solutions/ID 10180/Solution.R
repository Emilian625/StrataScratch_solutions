library(dplyr)
library(data.table)
los_angeles_restaurant_health_inspections %>%
  filter(facility_address %ilike% "HOLLYWOOD BLVD")%>%
  group_by(facility_name)%>%
  summarise(min_score = min(score))%>%
  arrange(desc(min_score),facility_name)