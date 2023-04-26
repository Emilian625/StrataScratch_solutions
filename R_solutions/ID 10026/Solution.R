library(dplyr)
library(stringr)
winemag_p1%>%
  mutate(description = tolower(description))%>%
  filter(str_detect(description, "\\b(plum|cherry|rose|hazelnut)\\b"))%>%
  select(winery)%>%
  distinct()