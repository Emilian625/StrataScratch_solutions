library(dplyr)
library(lubridate)
sf_sales_amount%>%
  left_join(sf_exchange_rate, by = c("currency" = "source_currency", "sales_date"="date"))%>%
  filter(year(sales_date)==2020)%>%
  mutate(change = sales_amount*exchange_rate)%>%
  group_by(quarter = quarter(sales_date))%>%
  summarise(total_sales=sum(change,na.rm=TRUE))%>%
  filter(quarter<=2)