Display the average number of times a user performed a search which led to a successful booking and the average number of times a user performed a search but did not lead to a booking. 
The output should have a column named action with values 'does not book' and 'books' as well as a 2nd column named average_searches with the average number of searches per action. 
Consider that the booking did not happen if the booking date is null. 
Be aware that search is connected to the booking only if their check-in dates match.