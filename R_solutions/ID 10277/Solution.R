library(dplyr)
los_angeles_restaurant_health_inspections%>%
  filter(program_status == 'INACTIVE')