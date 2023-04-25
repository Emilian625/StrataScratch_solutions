library(dplyr)
df = facebook_hack_survey%>%
  mutate(hater = row_number(popularity), love = row_number(desc(popularity)))
df%>%
  inner_join(df,by = c("love"= "hater"))%>%
  arrange(love)%>%
  select(employee_fan_id = employee_id.x, employee_opposition_id = employee_id.y)