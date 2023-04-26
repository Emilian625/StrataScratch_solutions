library(dplyr)

deloitte_numbers%>%
  rename(number1 = number)%>%
  full_join(deloitte_numbers,by = character())%>%
  mutate(max_number = if_else(number1>number, number1,number))