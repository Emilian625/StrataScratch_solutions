library(dplyr)
marathon_male%>%
  group_by(hometown)%>%
  summarise(avg_net_time = mean(net_time))%>%
  slice_max(-avg_net_time,n =3)    