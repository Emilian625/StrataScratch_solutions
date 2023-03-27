library(dplyr)
oscar_nominees%>%
  left_join(nominee_information, by= c("nominee"="name"))%>%
  filter(winner ==1) %>%
  group_by(nominee)%>%
  mutate(counts = n())%>%
  arrange(desc(counts), nominee)%>%
  head(1)%>%
  select(top_genre)