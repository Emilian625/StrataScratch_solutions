library(dplyr)

df = airbnb_contacts%>%
  filter(!is.na(ts_booking_at))

airbnb_searches%>%
  left_join(df, by =c("id_user"="id_guest"))%>%
  unique()%>%
  mutate(action = coalesce(if_else(ds_checkin.x == ds_checkin.y,'books','does not book'), 'does not book'))%>%
  select(n_searches, id_user, action, ds_checkin.x,ds_checkin.y)%>%
  group_by(action)%>%
  summarise(average_searches = mean(n_searches))