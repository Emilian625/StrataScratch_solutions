library(dplyr)
airbnb_contacts%>%
  group_by(id_guest)%>%
  summarise(total_n = sum(n_messages))%>%
  ungroup()%>%
  summarise(ranking = dense_rank(desc(total_n)),id_guest,total_n)%>%
  arrange(desc(total_n))