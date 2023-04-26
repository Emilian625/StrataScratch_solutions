library(dplyr)
trip_details%>%
  filter(status == 'completed')%>%
  mutate(diff = (actual_time_of_arrival - predicted_eta)/60)%>%
  summarise(ninetieth_percentile = quantile(diff,0.9))