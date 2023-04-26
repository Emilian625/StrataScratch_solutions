library(dplyr)
df = asana_actions%>%
  inner_join(asana_users, by = 'user_id')%>%
  filter(action_name == 'CompleteTask' & date>= '2022-01-01' & date<= '2022-01-31' & company == 'ClassPass')%>%
  group_by(user_id)%>%
  summarise(n_completed_tasks = sum(num_actions))

asana_users%>%
  filter(company == 'ClassPass')%>%
  left_join(df, by = 'user_id')%>%
  mutate(n_completed_tasks = coalesce(n_completed_tasks,0))%>%
  select(user_id,n_completed_tasks)