library(dplyr)

emails = google_gmail_emails%>%
  group_by(to_user, day)%>%
  count()

fit = google_fit_location%>%
  group_by(user_id, day)%>%
  summarise(fit = n_distinct(session_id))

emails%>%
  full_join(fit,by=c("to_user"="user_id", "day"))%>%
  mutate(n = coalesce(n,0), fit = coalesce(fit,0))%>%
  ungroup()%>%
  summarise(corr = cor(n,fit))