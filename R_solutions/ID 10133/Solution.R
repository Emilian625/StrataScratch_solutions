library(dplyr)
airbnb_contacts %>%
  mutate(filter_chk = case_when(!is.na(ts_accepted_at) ~ 'non-na'))%>%
  group_by(filter_chk)%>%
  mutate(count_na=n())%>%
  ungroup()%>%
  mutate(total_count = n())%>%
  filter(!is.na(filter_chk))%>%
  summarise(acceptance_rate = 100*count_na/total_count)%>%
  unique()