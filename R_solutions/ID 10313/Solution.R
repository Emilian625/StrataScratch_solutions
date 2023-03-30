library(dplyr)
library(lubridate)
uber_request_logs%>%
  mutate(year = year(request_date),month = month(request_date))%>%
  group_by(year,month)%>%
  arrange(request_date)%>%
  summarise(distance_per_dollar = sum(distance_to_travel)/sum(monetary_cost))%>%
  ungroup()%>%
  mutate(forecast = lag(distance_per_dollar))%>%
  summarise(RMSE = round(sqrt(mean((distance_per_dollar-forecast)^2,na.rm)),2))