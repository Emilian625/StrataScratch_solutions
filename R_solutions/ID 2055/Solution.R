library(dplyr)
linkedin_customers%>%
  left_join(linkedin_city, by = c("city_id"="id"))%>%
  left_join(linkedin_country, by = c("country_id"="id"))%>%
  group_by(city_id,country_id)%>%
  mutate(count = n())%>%
  ungroup()%>%
  mutate(avg = mean(count))%>%
  filter(count > avg)%>%
  select(country_name, city_name , count)%>%
  unique()