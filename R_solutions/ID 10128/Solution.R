library(dplyr)
oscar_nominees%>%
  filter(nominee == 'Abigail Breslin')%>%
  summarise(n_movies_by_abi=n_distinct(movie))