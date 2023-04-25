library(dplyr)
marathon_male%>%
  mutate(rank = dense_rank(net_time), rank  = if_else(rank==10,net_time,NULL), chris = if_else(person_name=='Chris Doe',net_time,NULL))%>%
  summarise(difference = abs(max(rank,na.rm = TRUE)- max(chris,na.rm = TRUE)))