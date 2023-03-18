library(dplyr)
playbook_events %>%
  left_join(playbook_users, by="user_id") %>%
  filter(language!= "spanish", device == "macbook pro", location =="Argentina") %>%
  group_by(company_id, language) %>%
  summarise(n_macbook_pro_events = n())