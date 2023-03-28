library(dplyr)
my_uber_drives %>%
  filter(category == 'Business') %>%
  group_by(purpose) %>%
  summarise(total = sum(miles)) %>%
  slice_max(total, n=3)