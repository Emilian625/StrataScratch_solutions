library(dplyr)
google_gmail_emails%>%
  group_by(day)%>%
  mutate(send = n_distinct(from_user), recive = n_distinct(to_user))%>%
  filter(recive>send)%>%
  select(id, from_user, to_user, day)