library(dplyr)
library(lubridate)
library(tidyr)
fct_customer_sales%>%
  left_join(map_customer_territory, by = 'cust_id')%>%
  filter(year(order_date) == 2021 & (quarter(order_date) == 3| quarter(order_date) == 4))%>%
  group_by(territory_id, quarter = quarter(order_date))%>%
  summarise(sales = sum(order_value))%>%
  ungroup()%>%
  pivot_wider(values_from = 'sales', names_from = 'quarter',names_prefix  = 'Q')%>%
  mutate(sales_growth = (Q4-Q3)/Q3*100)%>%
  drop_na()%>%
  select(1,4)