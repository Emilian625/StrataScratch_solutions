library(dplyr)
cookbook_titles%>%
  summarise(max_num = max(page_number))%>%
  summarise(page_number = seq(from = 0, to = max_num, by = 2), page_number2=page_number+1)%>%
  left_join(cookbook_titles, by = 'page_number')%>%
  left_join(cookbook_titles, by = c('page_number2'='page_number'))%>%
  select(1,3,4)%>%
  rename(left_page_number = 1, left_title = 2, right_title =3)