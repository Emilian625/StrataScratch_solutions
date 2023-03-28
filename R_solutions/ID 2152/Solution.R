library(dplyr)
customer_responses%>%
  filter(grepl("[0-9]{10}", customer_response))%>%
  group_by(employee_id)%>%
  summarise(cust_numbers = n())%>%
  slice_max(cust_numbers,n=1)

