library(dplyr)
library(lubridate)
cvs_claims%>%
  filter(is.na(date_accepted) & is.na(date_rejected) & year(date_submitted)==2021 & month(date_submitted) == 12)%>%
  count()