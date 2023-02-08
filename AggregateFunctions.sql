--@BLOCK
SELECT ROUND(AVG(price), 2)
FROM fake_apps;

--@BLOCK
SELECT price , COUNT(*) 
FROM fake_apps WHERE downloads > 20000
GROUP BY price ;

--@BLOCK
SELECT category SUM(downloads) FROM fake_apps;

--@BLOCK
SELECT category, SUM(downloads)
 FROM fake_apps GROUP BY category;

 --@BLOCK
 SELECT category, 
   price,
   AVG(downloads)
FROM fake_apps
GROUP BY 1,2;

--@BLOCK
SELECT price, 
   ROUND(AVG(downloads)),
   COUNT(*)
FROM fake_apps
GROUP BY price
HAVING COUNT(*) > 10;
-- COUNT(): count the number of rows
-- SUM(): the sum of the values in a column
-- MAX()/MIN(): the largest/smallest value
-- AVG(): the average of the values in a column
-- ROUND(): round the values in the column
-- Aggregate functions combine multiple rows together to form a single value of more meaningful information.

-- GROUP BY is a clause used with aggregate functions to combine data from one or more columns.
-- HAVING limit the results of a query based on an aggregate property.
