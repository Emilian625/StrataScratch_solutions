library(dplyr)
loans%>%
  filter(type == "Refinance"|type == "InSchool")%>%
  select(user_id,type)%>%
  unique()%>%
  group_by(user_id)%>%
  count()%>%
  filter(n>1)%>%
  select(user_id)