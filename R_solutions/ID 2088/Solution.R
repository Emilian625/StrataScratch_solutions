library(dplyr)
theater_seatmap%>%
  left_join(theater_availability, by = 'seat_number')%>%
  left_join(theater_availability, by = c('seat_left'='seat_number'))%>%
  left_join(theater_availability, by = c('seat_right'='seat_number'))%>%
  filter((is_available.x == 1 & is_available.y == 1) | (is_available.x == 1 & is_available == 1))%>%
  mutate(available_seat2 = if_else(coalesce(is_available.y,0) == 1, seat_left,seat_right))%>%
  group_by(available_seat1 = pmin(seat_number, available_seat2), available_seat2 = pmax(seat_number, available_seat2)) %>%
  slice_head(n = 1) %>%
  ungroup() %>%
  select(available_seat1, available_seat2)