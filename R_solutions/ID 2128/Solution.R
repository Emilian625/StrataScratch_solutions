library(dplyr)
amazon_books%>%
  left_join(amazon_books_order_details, by = 'book_id')%>%
  mutate(total = quantity*unit_price)%>%
  group_by(book_id)%>%
  summarise(total_sales=coalesce(sum(total),0))