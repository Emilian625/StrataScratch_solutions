library(dplyr)
df = uber_employees%>%
  select(date = hire_date)%>%
  mutate(temp = 1)

df1 = uber_employees%>%
  select(date = termination_date)%>%
  filter(!is.na(date))%>%
  mutate(temp = -1)

union = union_all(df,df1)%>%
  arrange(date,temp)%>%
  group_by(date)%>%
  summarise(temp = sum(temp))%>%
  mutate(maxemp = cumsum(temp))%>%
  select(-temp)%>%
  group_by(date)%>%
  summarise(employee = min(maxemp))

uber_employees%>%
  inner_join(union, by = character())%>%
  filter(date >= hire_date & date < coalesce(termination_date, Sys.Date()))%>%
  group_by(id)%>%
  mutate(rank = dense_rank(-employee))%>%
  filter(rank == 1)%>%
  summarise(id,employee,dateaq = min(date))%>%
  distinct()