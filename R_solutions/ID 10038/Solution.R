library(dplyr)
df = winemag_p2%>%
  group_by(province)%>%
  summarise(n_p2 = n())
winemag_p1%>%
  group_by(province)%>%
  summarise(n_p1 = n())%>%
  left_join(df,by="province")%>%
  filter(n_p1>n_p2)%>%
  select(province, n_p1)