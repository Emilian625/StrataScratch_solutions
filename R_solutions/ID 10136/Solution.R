library(dplyr)
library(lubridate)
worker%>%
  filter(month(joining_date)==2 & worker_id%%2!=0)