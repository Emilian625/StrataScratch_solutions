library(dplyr)
library(lubridate)
sf_events %>%
  mutate(next_day = date  + days(1))%>%
  inner_join(sf_events, by = c("user_id", "next_day" = "date"))%>%
  mutate(next_day2 = next_day  + days(1))%>%
  inner_join(sf_events, by = c("user_id", "next_day2" = "date"))%>%
  select(user_id)%>%
  unique()