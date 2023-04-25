library(dplyr)
df = sf_public_salaries%>%
  filter(year==2012)%>%
  select(employeename, totalpaybenefits)

max = df%>%
  slice_max(totalpaybenefits, n = 5)

min = df%>%
  slice_min(totalpaybenefits, n = 5)

union(min,max)