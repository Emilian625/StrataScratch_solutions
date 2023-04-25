library(dplyr)
submissions%>%
  mutate(fixed = if_else(rate_type=='fixed',1,0),variable = if_else(rate_type=='variable',1,0))%>%
  select(2,6,7)