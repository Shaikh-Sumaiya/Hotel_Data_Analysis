WITH hotels as (
	SELECT * FROM dbo.['2018$']
	UNION
	SELECT * FROM dbo.['2019$']
	UNION
	SELECT * FROM dbo.['2020$']
)

/*Revenue:
It increases as per time

SELECT 
	arrival_date_year,
	hotel,
	round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr), 0) AS revenue
FROM hotels
GROUP BY arrival_date_year, hotel

*/


SELECT *
FROM hotels
LEFT JOIN dbo.market_segment$
ON hotels.market_segment = market_segment$.market_segment
LEFT JOIN dbo.meal_cost$
ON meal_cost$.meal = hotels.meal