library(dplyr)
df = fb_messages %>% mutate(y = user1, user1=user2 ) %>% mutate(user2 = user1)%>%
  group_by(user1) %>% summarise(sum = sum(msg_count))
df2 = fb_messages %>%
  group_by(user1) %>%
  summarise(sum = sum(msg_count))

union(df, df2) %>% arrange(desc(sum)) %>% slice_max(sum, n = 10)