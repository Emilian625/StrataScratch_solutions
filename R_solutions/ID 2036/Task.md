Write a query that returns a list of the bottom 2% revenue generating restaurants. 
Return a list of restaurant IDs and their total revenue from when customers placed orders in May 2020.

You can calculate the total revenue by summing the order_total column. 
And you should calculate the bottom 2% by partitioning the total revenue into evenly distributed buckets.