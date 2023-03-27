library(dplyr)
google_adwords_earnings%>%
  group_by(business_type)%>%
  summarise(sum(adwords_earnings))