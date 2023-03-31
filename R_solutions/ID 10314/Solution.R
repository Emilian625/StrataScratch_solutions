library(dplyr)
amazon_purchases%>%
  filter(purchase_amt>0)%>%
  mutate(month = format(created_at,  "%Y-%m"))%>%
  group_by(month)%>%
  summarise(total_revenue = sum(purchase_amt))%>%
  mutate(lag_1 = lag(total_revenue,1),lag_2 = lag(total_revenue,2))%>%
  ungroup()%>%
  mutate(avg_revenue= rowMeans(.[, 2:4], na.rm=TRUE))%>%
  select(month,avg_revenue)