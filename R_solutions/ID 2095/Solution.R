library(tidyverse)
library(lubridate)

amazon_orders%>%
  filter(year(order_date)== 2020 | year(order_date)== 2021)%>%
  group_by(user_id,year = year(order_date))%>%
  count()%>%
  pivot_wider(names_from = year,names_prefix = 'year_', values_from=n)%>%
  filter(year_2020>=3 & year_2021>=3)%>%
  select(1)