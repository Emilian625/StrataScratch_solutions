library(dplyr)
medical_appointments%>%
  group_by(gender)%>%
  summarise(n())%>%
  slice_max(n())