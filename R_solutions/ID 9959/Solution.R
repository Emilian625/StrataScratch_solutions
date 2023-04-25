library(dplyr)
library(tidyr)
olympics_athletes_events%>%
  filter(year>=2000 & year<=2016 & team=='China')%>%
  mutate(year = paste0('medals_',year))%>%
  group_by(medal,year)%>%
  summarise(medals = n())%>%
  complete(year = c('medals_2000', 'medals_2004', 'medals_2008', 'medals_2012', 'medals_2016')) %>%
  pivot_wider(names_from = year, values_from = medals)%>%
  mutate_all(~coalesce(., 0))%>%
  mutate(total_medals=medals_2000+medals_2004+medals_2008+medals_2012+medals_2016)