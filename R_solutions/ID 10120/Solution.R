library(dplyr)
library(data.table)
google_gmail_emails%>%
  left_join(google_gmail_labels, by=c("id"="email_id"))%>%
  filter(label %ilike% "custom")%>%
  group_by(label, to_user)%>%
  summarise(n_occurences = n())