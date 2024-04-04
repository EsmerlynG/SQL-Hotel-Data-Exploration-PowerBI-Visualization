/*
Hotel Data Analysis Project

Goal: Develope a Database to Analyze and Visualize Hotel Booking Data

--Stake Holder Questions being answerd

"Is our hotel revenue Growing by year?"  (We have two hotel types so it woud be good to segement revenue by hotel)

"Should we increase our parking lot size?" (We want to understand if there is a trend in guests with personal vehicles)

"What trends can we see in the data?" (Focus on average daily rate and guests to explore seasonality)

This Data Will be visualized in PowerBI

*/

-- Exploring the data

With hotels as (
Select * 
From PortfolioProject..[2018]
Union
Select * 
From PortfolioProject..[2019]
Union
Select * 
From PortfolioProject..[2020]
)
select *
from hotels


-- Creating revenue collumn to visualize Year by Year Revenue

select *
From PortfolioProject

With hotels as (
Select * 
From PortfolioProject..[2018]
Union
Select * 
From PortfolioProject..[2019]
Union
Select * 
From PortfolioProject..[2020]
)
select stays_in_week_nights+stays_in_weekend_nights
from hotels






With hotels as (
Select * 
From PortfolioProject..[2018]
Union
Select * 
From PortfolioProject..[2019]
Union
Select * 
From PortfolioProject..[2020]
)
select arrival_date_year, (stays_in_week_nights+stays_in_weekend_nights)*adr as revenue
from hotels






With hotels as (
Select * 
From PortfolioProject..[2018]
Union
Select * 
From PortfolioProject..[2019]
Union
Select * 
From PortfolioProject..[2020]
)
select arrival_date_year, sum((stays_in_week_nights+stays_in_weekend_nights)*adr) as revenue
from hotels
group by arrival_date_year


-- Segmenting by Hotel Type


With hotels as (
Select * 
From PortfolioProject..[2018]
Union
Select * 
From PortfolioProject..[2019]
Union
Select * 
From PortfolioProject..[2020]
)
select arrival_date_year, hotel, round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as revenue
from hotels
group by arrival_date_year, hotel



-- Bringing in other Tables 
--joining Market Segment table to Market Segemnt Collumn and Meal_Cost Table to Meal Collumn

With hotels as (
Select * 
From PortfolioProject..[2018]
Union
Select * 
From PortfolioProject..[2019]
Union
Select * 
From PortfolioProject..[2020]
)
select *
from hotels
join market_segment
on hotels.market_segment = market_segment.market_segment





With hotels as (
Select * 
From PortfolioProject..[2018]
Union
Select * 
From PortfolioProject..[2019]
Union
Select * 
From PortfolioProject..[2020]
)
select *
from hotels
left join market_segment
on hotels.market_segment = market_segment.market_segment





With hotels as (
Select * 
From PortfolioProject..[2018]
Union
Select * 
From PortfolioProject..[2019]
Union
Select * 
From PortfolioProject..[2020]
)
select *
from hotels
left join market_segment
on hotels.market_segment = market_segment.market_segment
left join meal_cost
on meal_cost.meal = hotels.meal

--Now the data will be tranford and vizualized in PowerBI
