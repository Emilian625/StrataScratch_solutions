library(dplyr)
airbnb_guests%>%
  mutate(rank = rank(desc(age)))%>%
  select(guest_id,rank)%>%
  mutate(rank = floor(rank))%>%
  arrange(rank)
