library(tidyverse)
google_gmail_emails%>%
  left_join(google_gmail_labels, by = c("id"="email_id"))%>%
  group_by(to_user, label)%>%
  filter(label %in% c('Promotion', 'Social', 'Shopping'))%>%
  count()%>%
  pivot_wider(names_from = "label", values_from = 'n',values_fill = 0,names_prefix = "Count_")