library(dplyr)
airbnb_apartments %>%
  left_join(airbnb_hosts, by = "host_id") %>%
  group_by(nationality) %>%
  summarise(total_beds = sum(n_beds)) %>%
  arrange(desc(total_beds))