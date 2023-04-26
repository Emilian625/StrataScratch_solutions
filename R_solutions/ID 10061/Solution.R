library(tidyverse)
facebook_hack_survey%>%
  left_join(facebook_employees, by = c("employee_id"= "id"))%>%
  drop_na(location)%>%
  group_by(location)%>%
  summarise(avg_popularity = mean(popularity))