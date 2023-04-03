library(dplyr)

df2= winemag_p1%>%
  select(region = region_1,variety,price)
df1=winemag_p1%>%
  select(region = region_2,variety,price)
df = union(df1,df2)%>%
  filter(region!="")

df%>%
  group_by(region,variety)%>%
  summarise(sum = sum(price,na.rm=TRUE))%>%
  filter(sum>0)%>%
  arrange(desc(sum))