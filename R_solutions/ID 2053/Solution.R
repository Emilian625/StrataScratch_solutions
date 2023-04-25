library(dplyr)

dec <- sf_events %>% 
  mutate(date = format(date,'%Y-%m')) %>% 
  group_by(account_id, user_id) %>% 
  mutate(last_day = max(date)) %>% 
  filter(date == '2020-12') %>% 
  distinct(account_id, .keep_all = TRUE) %>% 
  mutate(retain_dec = as.numeric(last_day > '2020-12')) %>% 
  group_by(account_id) %>% 
  summarise(retain_dec = mean(retain_dec))

jan <- sf_events %>% 
  mutate(date = format(date,'%Y-%m')) %>% 
  group_by(account_id, user_id) %>% 
  mutate(last_day = max(date)) %>% 
  filter(date == '2021-01') %>% 
  distinct(account_id, .keep_all = TRUE) %>% 
  mutate(retain_jan = as.numeric(last_day > '2021-01')) %>% 
  group_by(account_id) %>% 
  summarise(retain_jan = mean(retain_jan))

result = left_join(dec,jan,by = "account_id")%>%
  summarise(account_id,retention = retain_jan/retain_dec)