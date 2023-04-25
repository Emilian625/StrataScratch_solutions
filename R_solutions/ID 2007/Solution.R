library(tidyverse)
fb_comments_count%>%
  left_join(fb_active_users, by= "user_id")%>%
  filter(!is.na(country))%>%
  mutate(created_at = format(created_at, "%Y-%m"))%>%
  group_by(created_at, country)%>%
  summarise(number_of_comments = sum(number_of_comments))%>%
  group_by(created_at)%>%
  pivot_wider(names_from = created_at, values_from = number_of_comments)%>%
  select(country, dec = "2019-12", jan = "2020-01")%>%
  mutate(dec = coalesce(dec,0),jan = coalesce(jan,0))%>%
  mutate(dec = dense_rank(-dec), jan = dense_rank(-jan))%>%
  filter(jan<dec)%>%
  select(country)