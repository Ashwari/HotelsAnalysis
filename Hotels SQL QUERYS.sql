with hotels as(
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$'])

--Q.1: Is our hotel revenue growing yearly?
--REVENUE
	--select (stays_in_week_nights+stays_in_weekend_nights) * adr as revenue from hotels

--SUM OF REVENUE WHILE GROUPING THE DATA BY YEAR.
	--select arrival_date_year,sum((stays_in_week_nights + stays_in_weekend_nights) * adr)
	--as revenue 
	--from hotels 
	--group by arrival_date_year

--REVENUE TREND BY TYPE OF HOTEL THROUGH THE YEARS
	--select arrival_date_year, hotel,
	--sum((stays_in_week_nights + stays_in_weekend_nights) * adr)
	--as revenue from hotels group by arrival_date_year, hotel

--Q.2: Should we increase our parking lot size?
--THE car_parking_spaces AND NUMBER OF GUESTS STAYING IN THE HOTEL
	--select arrival_date_year, hotel,
	--sum((stays_in_week_nights + stays_in_weekend_nights) * adr) as renenue,
	--concat (round((sum(required_car_parking_spaces)/sum(stays_in_week_nights +
	--stays_in_weekend_nights)) * 100, 2), '%') as parking_percentage
	--from hotels group by arrival_date_year, hotel

--First Left Join: 
--Combines the hotels table with the market_segment table 
--by matching the market_segment column in the “hotels” table 
--with the market_segment.market_segment column.

--Second Left Join: 
--Combines the hotels table with the meal_cost table 
--by matching the meal column in the hotels table 
--and the meal_cost.meal column.
	select * from hotels
	left join dbo.market_segment$
	on hotels.market_segment = market_segment$.market_segment
	left join dbo.meal_cost$
	on meal_cost$.meal = hotels.meal