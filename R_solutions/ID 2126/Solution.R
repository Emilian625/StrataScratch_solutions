library(dplyr)
noom_signups%>%
  group_by(format(started_at,'%Y-%m'))%>%
  count()