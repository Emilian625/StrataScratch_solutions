library(tidyverse)
sf_restaurant_health_violations%>%
  select(business_name)%>%
  mutate(filt = str_replace_all(business_name, "[^[:alnum:][:space:]]+", ""),word_count = str_count(str_to_lower(filt),'\\w+'))%>%
  select(business_name,word_count)%>%
  unique()