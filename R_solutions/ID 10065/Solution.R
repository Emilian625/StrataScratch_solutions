library(dplyr)
facebook_employees%>%
  count(is_senior == 1)%>%
  left_join(facebook_employees%>%count(location == 'USA'), by = c('is_senior == 1'='location == "USA"'))%>%
  rename(condition=1)%>%
  filter(condition==1)%>%
  summarise(winner = case_when(n.x>n.y~ 'More seniors',n.x<n.y~'More USA-based'))