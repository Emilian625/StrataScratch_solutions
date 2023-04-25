library(dplyr)
voting_results%>%
  group_by(voter)%>%
  mutate(weight = 1/n())%>%
  group_by(candidate)%>%
  summarise(score = sum(weight))%>%
  filter(!is.na(candidate))%>%
  slice_max(score)