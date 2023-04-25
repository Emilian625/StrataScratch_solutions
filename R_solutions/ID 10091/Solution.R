library(dplyr)
facebook_friends%>%
  filter(user1!=1 & user2!=1)%>%
  count()