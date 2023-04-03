library(dplyr)

spannish = winemag_p1%>%
  filter(country == 'Argentina'| country == 'Spain')%>%
  select(variety)%>%
  unique()

df = winemag_p1%>%
  group_by(variety)%>%
  mutate(min = min(points))%>%
  filter(min>=90)%>%
  slice_max(price)%>%
  filter(country == 'US')%>%
  anti_join(spannish,by='variety')%>%
  select(variety,price)