library(tidyverse)
library(lubridate)
library(tidyr)

cust_tracking%>%
  pivot_wider(names_from = state, values_from = timestamp, names_prefix ='state_')%>%
  unnest(state_1, state_0)%>%
  mutate(time = (state_0-state_1)/60)%>%
  group_by(cust_id)%>%
  summarise(sum(time))