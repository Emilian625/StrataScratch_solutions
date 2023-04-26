library(dplyr)

whatsapp_messages%>%
  distinct(message_sender_id, message_receiver_id)%>%
  mutate(across(c(message_sender_id, message_receiver_id), sort)) %>% 
  distinct()%>%
  count()