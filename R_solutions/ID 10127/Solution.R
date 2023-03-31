library(dplyr)
sales_performance%>%
  filter(salesperson == 'Samantha'|salesperson == 'Lisa')%>%
  summarise(sum(sales_revenue))