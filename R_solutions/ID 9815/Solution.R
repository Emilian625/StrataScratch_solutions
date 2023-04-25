library(dplyr)

google_adwords_earnings %>%
  filter(n_employees <= 10, business_type == 'handyman') %>%
  count(n = adwords_earnings/n_employees, name = 'count') %>%
  filter(count == max(count)) %>%
  pull(n)