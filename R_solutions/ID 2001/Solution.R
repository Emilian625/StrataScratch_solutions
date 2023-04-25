library(dplyr)
submissions %>%
  group_by(rate_type) %>%
  mutate(total=sum(balance), balance_share=balance/total * 100) %>%
  select(loan_id,rate_type,balance,balance_share)