library(dplyr)
training_details%>%
  group_by(u_id, training_id,training_date)%>%
  count()%>%
  filter(n>1)%>%
  left_join(users_training, by = 'u_id')