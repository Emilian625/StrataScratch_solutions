library(dplyr)
employee%>%
  left_join(bonus,by=c('id'='worker_ref_id'))%>%
  mutate(has_bonus = case_when(bonus_amount>0~ '1', TRUE ~ '0'))%>%
  group_by(has_bonus)%>%
  summarise(n_employees=n_distinct(id))