library(dplyr)
fb_eu_energy%>%
  full_join(fb_asia_energy,by='date')%>%
  full_join(fb_na_energy,by='date')%>%
  rowwise()%>% 
  mutate(total_energy = sum(c(consumption.x, consumption.y, consumption), na.rm = TRUE))%>%
  ungroup()%>%
  slice_max(total_energy)%>%
  select(date, total_energy)