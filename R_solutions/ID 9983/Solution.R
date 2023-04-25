library(dplyr)
sf_public_salaries%>%
  group_by(jobtitle)%>%
  summarise(median_pay = median(totalpay))%>%
  arrange(desc(median_pay))