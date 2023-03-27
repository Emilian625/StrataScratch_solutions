library(dplyr)
library(lubridate)
crunchbase_acquisitions%>%
  mutate(acquired_quarter=paste0(year(acquired_quarter),"-Q",quarter(acquired_quarter)))%>%
  group_by(acquired_quarter)%>%
  summarise(cnt_acq=n())%>%
  arrange(desc(cnt_acq))