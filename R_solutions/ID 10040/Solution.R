library(dplyr)
df = winemag_p1%>%
  group_by(country)%>%
  summarise(total = sum(points))%>%
  slice_max(total)%>%
  select(country)

winemag_p2%>%
  inner_join(df,by = "country")