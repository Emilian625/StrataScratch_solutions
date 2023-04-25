library(dplyr)
df2 = marathon_male%>%
  mutate(diff = abs(gun_time - net_time))%>%
  summarise(mean_male = mean(diff))
df1 = marathon_female%>%
  mutate(diff = abs(gun_time - net_time))%>%
  summarise(mean_female = mean(diff))

result = df1$mean_female- df2$mean_male