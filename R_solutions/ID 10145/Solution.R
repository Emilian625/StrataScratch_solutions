library(dplyr)
df_11 = sf_public_salaries%>%
  group_by(employeename)%>%
  filter(year==2011)%>%
  select(employeename, pay_2011 = totalpay)

df_12=sf_public_salaries%>%
  group_by(employeename)%>%
  filter(year==2012)%>%
  select(employeename, pay_2012 = totalpay)

df_13=sf_public_salaries%>%
  group_by(employeename)%>%
  filter(year==2013)%>%
  select(employeename, pay_2013 = totalpay)

df_14=sf_public_salaries%>%
  group_by(employeename)%>%
  filter(year==2014)%>%
  select(employeename, pay_2014 = totalpay)

merge <- sf_public_salaries%>%
  select(employeename)%>%
  unique()%>%
  left_join(df_11, by = "employeename")%>%
  left_join(df_12, by = "employeename")%>%
  left_join(df_13, by = "employeename")%>%
  left_join(df_14, by = "employeename")%>%
  arrange(employeename)%>%
  mutate(pay_2011=coalesce(pay_2011,0),pay_2012=coalesce(pay_2012,0),pay_2013=coalesce(pay_2013,0),pay_2014=coalesce(pay_2014,0))
