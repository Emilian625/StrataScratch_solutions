library(dplyr)
# The long solution since I used my SQL solution as the base
# Extract region_1 into region and remove region_1 and region_2 columns
df1 <- winemag_p1 %>%
  mutate(region = region_1) %>%
  select(-region_1, -region_2)

# Extract region_2 into region and remove region_1 and region_2 columns
df2 <- winemag_p1 %>%
  mutate(region = region_2) %>%
  select(-region_1, -region_2)

# Combine df1 and df2 and group by region, add columns for min and max price and cheapest/most expensive variety
df_combined <- union_all(df1, df2) %>%
  group_by(region) %>%
  mutate(
    min_price = min(price),
    max_price = max(price),
    cheapest_variety = case_when(price == min_price ~ variety),
    most_expensive_variety = case_when(price == max_price ~ variety)
  )

# Extract the row with the cheapest variety for each region
cheapest_varieties <- df_combined %>%
  filter(cheapest_variety != "") %>%
  group_by(region) %>%
  summarise(cheapest_variety = min(cheapest_variety))

# Extract the row with the most expensive variety for each region
most_expensive_varieties <- df_combined %>%
  filter(most_expensive_variety != "") %>%
  group_by(region) %>%
  summarise(most_expensive_variety = min(most_expensive_variety))

# Combine cheapest_varieties and most_expensive_varieties
result <- left_join(most_expensive_varieties, cheapest_varieties, by = "region")
