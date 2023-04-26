library(dplyr)
survey_results%>%
  left_join(loyalty_customers, by ="cust_id")%>%
  filter(age >29 & age <41)%>%
  group_by(class)%>%
  summarise(pc_score = round(mean(satisfaction)))