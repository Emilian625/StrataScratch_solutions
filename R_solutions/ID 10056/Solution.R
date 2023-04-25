library(tidyverse)
yelp_reviews%>%
  mutate(stars = str_extract(stars,'[0-9]'))%>%
  filter(!is.na(stars))