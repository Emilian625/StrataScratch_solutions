library(dplyr)
google_competition_participants%>%
  left_join(google_competition_scores, by='member_id')%>%
  group_by(team_id)%>%
  summarise(avg_score = mean(member_score))%>%
  arrange(desc(avg_score))