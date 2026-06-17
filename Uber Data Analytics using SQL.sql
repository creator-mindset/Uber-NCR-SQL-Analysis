CREATE DATABASE uber;
SELECT * FROM uber_ncr_ride_bookings;

-- Revenue & Profitability
-- What is the total revenue generated?
SELECT SUM(`Booking Value`)  AS total_revenue
FROM uber_ncr_ride_bookings;

-- What are the top 5 revenue generating routes?
SELECT 
    `Pickup Location`,
    `Drop Location`,
    SUM(`Booking Value`) AS Revenue
FROM uber_ncr_ride_bookings
GROUP BY `Pickup Location`,`Drop Location`
ORDER BY Revenue DESC
LIMIT 5;

-- Ride Demand Analysis
-- What are the busiest hours of the day?
SELECT HOUR(`Time`) AS hour_,COUNT(*) AS rides
FROM uber_ncr_ride_bookings
GROUP BY `Time`
ORDER BY rides DESC
LIMIT 1;

-- Which day of the week has the highest demand?
SELECT DAYNAME(`Date`) AS Day_name,COUNT(*) AS Total_rides
FROM uber_ncr_ride_bookings
GROUP BY `Date`
ORDER BY Total_rides DESC
LIMIT 1;
-- Which month recorded maximum rides?
SELECT MONTHNAME(`Date`) AS Month_name,COUNT(*) AS Total_rides
FROM uber_ncr_ride_bookings
GROUP BY `Date`
ORDER BY Total_rides DESC
LIMIT 1;
-- What is the average trip distance by pickup to drop location?
SELECT `Pickup Location`,`Drop Location`,AVG(`Ride Distance`) AS avg_trip_distance
FROM uber_ncr_ride_bookings
GROUP BY `Pickup Location`,`Drop Location`;

-- Customer Analysis
-- Who are the top 10 customers by spending?
SELECT `Customer ID`,`Booking Value`
FROM uber_ncr_ride_bookings
GROUP BY `Customer ID`,`Booking Value`
ORDER BY `Booking Value` DESC
LIMIT 10;

-- Which customer completed the most rides?
SELECT `Customer ID`,COUNT(*) AS Rides
FROM uber_ncr_ride_bookings
GROUP BY `Customer ID`
ORDER BY Rides DESC;

-- What percentage of customers are repeat customers?
SELECT COUNT(DISTINCT `Customer ID`) * 100/COUNT(*) AS repeated_customers
FROM uber_ncr_ride_bookings;

-- Vehicle Analysis
-- Which vehicle type has the highest completed rides?
SELECT `Vehicle Type`,COUNT(*) AS Completed_rides
FROM uber_ncr_ride_bookings
WHERE `Booking Status` = 'Completed'
GROUP BY `Vehicle Type`
LIMIT 1;
-- Which Vehicle type has the lowest cancellation rate?
SELECT `Vehicle Type`,ROUND(SUM(CASE WHEN `Booking Status` = 'Cancelled by Driver' OR `Booking Status` = 'Cancelled by Customer' THEN 1 ELSE 0 END) *100.0/COUNT(*),2) AS Cancellation_rate_in_percentage
FROM uber_ncr_ride_bookings
GROUP BY `Vehicle Type`
ORDER BY Cancellation_rate_in_percentage ASC
LIMIT 1;

-- Cancellation Analysis
-- Which pickup and drop location has the highest cancellation rate?
SELECT `Pickup Location`,`Drop Location`,
ROUND(SUM(CASE WHEN `Booking Status` = 'Cancelled by Driver' OR `Booking Status` = 'Cancelled by Customer' THEN 1 ELSE 0 END) * 100/COUNT(*),2) AS Cancellation_rate_in_percentage
FROM uber_ncr_ride_bookings
GROUP BY `Pickup Location`,`Drop Location`
ORDER BY Cancellation_rate_in_percentage DESC
LIMIT 1;
-- During which hour do most cancellations occur?
SELECT 
    HOUR(`Time`) AS Hour_,
    ROUND(SUM(CASE WHEN `Booking Status` IN ('Cancelled by Driver', 'Cancelled by Customer') THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS Cancellation_rate_in_percentage
FROM uber_ncr_ride_bookings
GROUP BY HOUR(`Time`)
ORDER BY Cancellation_rate_in_percentage DESC
LIMIT 1;

-- Payment Analysis
-- Which payment method is most popular?
SELECT 	(`Payment Method`) ,COUNT(*) AS Total_Bookings
FROM uber_ncr_ride_bookings
GROUP BY `Payment Method`
ORDER BY Total_Bookings DESC
LIMIT 1;
-- Which payment method contributes the highest revenue?
SELECT `Payment Method`,SUM(`Booking Value`) AS Total_Revenue
FROM uber_ncr_ride_bookings
GROUP BY `Payment Method`
ORDER BY Total_Revenue DESC
LIMIT 1;

-- Customer analysis
-- Top 3 customerrs who spent the most money on rides
WITH CustomerRevenue AS(
    SELECT `Customer ID`, SUM(`Booking Value`) AS revenue,
    DENSE_RANK() OVER(ORDER BY SUM(`Booking Value`)DESC) AS rnk
    FROM uber_ncr_ride_bookings
    GROUP BY `Customer ID`
    )
SELECT * FROM CustomerRevenue
WHERE rnk <=3;
SELECT * FROM  uber_ncr_ride_bookings
