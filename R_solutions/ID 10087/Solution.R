library(dplyr)
facebook_reactions%>%
  filter(reaction == 'heart')%>%
  inner_join(facebook_posts,by='post_id')%>%
  select(post_id, poster.y,post_text,post_keywords,post_date)%>%
  unique()