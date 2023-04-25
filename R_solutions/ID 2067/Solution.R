library(dplyr)
facebook_products%>%
  mutate(count = n())%>%
  filter(is_low_fat == 'Y'& is_recyclable == 'Y')%>%
  mutate(fil = n(), percentage = fil/count*100)%>%
  select(percentage)