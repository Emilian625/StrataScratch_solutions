library(dplyr)
facebook_posts%>%
  left_join(facebook_reactions,by = "post_id")%>%
  filter(reaction == 'like')%>%
  summarise(n_posts_with_a_like = n_distinct(post_id))