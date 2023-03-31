library(dplyr)
union_all(fb_eu_energy,fb_na_energy)%>%
  union_all(.,fb_asia_energy)%>%
  group_by(date)%>%
  summarise(total = sum(consumption))%>%
  ungroup()%>%
  mutate(cum_sum=cumsum(total),percentage_of_total_energy=round(100*cum_sum/sum(total),0))%>%
  select(-total)