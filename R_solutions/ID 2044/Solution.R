library(dplyr)
library(tidyr)
uber_employees%>%
  mutate(max = max(hire_date),min = min(hire_date))%>%
  filter((hire_date== max| hire_date == min) & is.na(termination_date))%>%
  mutate(shortest_tenured_count = sum(hire_date == max),longest_tenured_count = sum(hire_date == min),days_diff = max-min)%>%
  distinct(shortest_tenured_count,longest_tenured_count,days_diff)