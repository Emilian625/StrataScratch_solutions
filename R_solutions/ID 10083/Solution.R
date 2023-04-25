library(dplyr)
lyft_drivers%>%
  filter(is.na(end_date))%>%
  slice_max(yearly_salary,n=5)%>%
  select(start_date)