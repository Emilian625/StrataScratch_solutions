library(dplyr)
df_max = worker %>%
  select(worker_id, salary, department) %>%
  slice_max(salary)%>%
  mutate(salary_type="Highest Salary")

df_min = worker %>%
  select(worker_id, salary, department) %>%
  slice_min(salary)%>%
  mutate(salary_type="Lowest Salary")

union(df_max,df_min)