library(dplyr)
sf_crime_incidents_2014_01%>%
  group_by(day_of_week)%>%
  count()%>%
  arrange(desc(n))