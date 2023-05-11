use [Inflation Project]

-- The Full Tables

SELECT * FROM prices;
SELECT * FROM inflation;

-- The Full Tables


-- Added A New Column Called "date" Contains Year And Mounth

ALTER TABLE prices
ADD [date] DATE;

UPDATE prices
SET [date] = CONVERT(DATE, CONVERT(VARCHAR(4), [Year]) + '-' + CONVERT(VARCHAR(2), [Month]) + '-01');

-- Added A New Column Called Date Contains Year And Mounth


-- Cheacking What Columns Have No Null Values (Done On Every Column) 

SELECT 

COUNT(CASE
	WHEN [Avocado (1 kg)] IS NULL THEN 1 END) AS null_values,
COUNT(CASE
	WHEN [Avocado (1 kg)] IS NOT NULL THEN 1 END) [values]

FROM prices

-- Cheacking What Columns Have No Null Values (Done On Every Column)


-- The Columns That Will Be Used (Not Null Values Columns)

SELECT [date], [Cucumbers (1 kg)], 
[Potatoes (1 kg)], [eggplants (1 kg)], [lemons (1 kg)], 
[Carrot (1 kg)], [Margarine for spreading in a cup (250 grams)]
, [Black coffee (100 g)],[Chicken Breast (1 kg)]
FROM prices
WHERE YEAR([date]) > 1985
ORDER BY [date]

-- The Columns That Will Be Used (Not Null Values Columns)


-- Creating TWO Views - For Vegtebales Called "Veg_prices"
-- , And For Random Items Called "random_items" 

CREATE VIEW Veg_prices AS
SELECT [date], [Cucumbers (1 kg)], 
[Potatoes (1 kg)], [eggplants (1 kg)], [lemons (1 kg)], 
[Carrot (1 kg)]
FROM prices
WHERE YEAR([date]) > 1985



CREATE VIEW random_items AS
SELECT [date]
, [Margarine for spreading in a cup (250 grams)]
, [Black coffee (100 g)],[Chicken Breast (1 kg)]
FROM prices
WHERE YEAR([date]) > 1985

-- Creating TWO Views - For Vegtebales Called "Veg_prices"
-- , And For Random Items Called "random_items" 


--The Views            --           --         
SELECT * FROM random_items
ORDER BY [date]
--            --           --         
SELECT * FROM Veg_prices
ORDER BY [date]
--The Views            --           --         


-- Rounded Average Price By Year  ------------------

SELECT YEAR([date]) AS [year],
ROUND(AVG([Cucumbers (1 kg)]), 1) AS cucumbers,
ROUND(AVG([Potatoes (1 kg)]), 1) AS potatoes, 
ROUND(AVG([eggplants (1 kg)]), 1) AS eggplants,
ROUND(AVG([lemons (1 kg)]), 1) AS lemons,
ROUND(AVG([Carrot (1 kg)]), 1) AS carrot
FROM Veg_prices
GROUP BY YEAR([date])

-- Rounded Average Price By Year  ------------------


-- Min And Max Price Per Year ------------------------

SELECT YEAR(date) AS [year],
	   MAX([Cucumbers (1 kg)]) AS MaxCucumbersPrice,
       MIN([Cucumbers (1 kg)]) AS MinCucumbersPrice,
       MAX([Potatoes (1 kg)]) AS MaxPotatoesPrice,
       MIN([Potatoes (1 kg)]) AS MinPotatoesPrice,
       MAX([eggplants (1 kg)]) AS MaxEggplantsPrice,
       MIN([eggplants (1 kg)]) AS MinEggplantsPrice,
       MAX([lemons (1 kg)]) AS MaxLemonsPrice,
       MIN([lemons (1 kg)]) AS MinLemonsPrice,
       MAX([Carrot (1 kg)]) AS MaxCarrotPrice,
       MIN([Carrot (1 kg)]) AS MinCarrotPrice
FROM Veg_prices
	   GROUP BY YEAR(date)

-- Min And Max Price Per Year ------------------------


-- Checking CPI Data, PPI Data, And Food CPI Data

SELECT [Series Name], [Note], [1986],[1987],[1988],[1989],[1990],[1991],[1992],
[1993],[1994],[1995],[1996],[1997],[1998],[1999],[2000],[2001],[2002],[2003],
[2004],[2005],[2006],[2007],[2008],[2009],[2010],[2011],[2012],[2013],[2014],
[2015],[2016],[2018],[2019],[2020],[2021],[2022]
FROM inflation
WHERE [Country] = 'Israel' 

-- Checking CPI Data, PPI Data, And Food CPI Data
