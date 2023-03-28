library(dplyr)
airbnb_apartments %>%
  group_by(host_id) %>%
  summarise(total_beds = sum(n_beds))  %>%
  mutate(rank = dense_rank(desc(total_beds))) %>%
  arrange(rank)