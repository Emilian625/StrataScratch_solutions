library(dplyr)
library(lubridate)
redfin_call_tracking%>%
  filter(hour(created_on) >=15 & hour(created_on) <=18)%>%
  group_by(request_id)%>%
  count()%>%
  filter(n>=3)%>%
  ungroup()%>%
  count()