library(dplyr)
uber_request_logs%>%
  mutate(distance_per_dollar = distance_to_travel/monetary_cost, Y_M = format(request_date , "%Y-%m"))%>%
  group_by(Y_M)%>%
  mutate(avg = mean(distance_per_dollar), difs = abs(distance_per_dollar-avg))%>%
  summarise(difference = round(mean(difs),2))