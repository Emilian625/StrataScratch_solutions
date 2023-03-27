library(dplyr)
fraud_score%>%
  group_by(state)%>%
  filter(fraud_score >= quantile(fraud_score, c(0.95)))