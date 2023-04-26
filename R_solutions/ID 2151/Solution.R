library(dplyr)
employees%>%
  filter(joining_date >= as.POSIXct('2022-01-01') & joining_date <= as.POSIXct('2022-07-31'))%>%
  count()