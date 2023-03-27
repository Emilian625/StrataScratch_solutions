library(dplyr)
df = facebook_post_views%>%
  group_by(post_id)%>%
  summarise(views = n())

df2 = facebook_posts %>%
  left_join(df,by = "post_id")

spam = facebook_posts %>%
  left_join(df,by = "post_id")%>%
  filter(grepl("spam", post_keywords)) %>%
  rename(spam_views = views) 


df2 %>% left_join(spam, by =c("post_id", "post_text", "post_keywords","post_date", "poster"))%>% 
  mutate(views1 = coalesce(views,0))%>%
  mutate(spam_views1 = coalesce(spam_views,0))%>%
  group_by(post_date)%>%
  summarise(spam_share =  100*sum(spam_views1)/sum(views1)) 