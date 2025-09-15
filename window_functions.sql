CREATE DATABASE IF NOT EXISTS swiggy;
USE swiggy;

SELECT * FROM restaurants; 

-- WINDOW FUNCTIONS : Averages, Min, Max per city/cuisine

-- 1. Average rating across all restaurants
SELECT * , ROUND(AVG(rating) OVER(),2) AS avg_rating 
FROM restaurants;


-- 2. Average rating count across all restaurants
SELECT * , ROUND(AVG(rating_count) OVER(),0) AS avg_rating_count 
FROM restaurants;


-- 3. Average cost across all restaurants
SELECT * , ROUND(AVG(cost) OVER(),0) AS avg_cost 
FROM restaurants;


-- 4. Average, min, max of cost and rating of restaurants throught the dataset
SELECT id , name, city, cuisine,rating,
	ROUND(AVG(rating) OVER(),2) AS avg_rating,
    ROUND(MIN(rating) OVER(),2) AS min_rating,
    ROUND(MAX(rating) OVER(),2) AS max_rating,
    
    ROUND(AVG(cost) OVER(),2) AS avg_cost,
    ROUND(MIN(cost) OVER(),2) AS min_cost,
    ROUND(MAX(cost) OVER(),2) AS max_cost
FROM restaurants;

    
-- 5. Average cost per city
SELECT *, ROUND(AVG(cost) OVER(PARTITION BY city)) as avg_cost_city 
FROM restaurants;  


-- 6. Average cost per cuisine
SELECT *, ROUND(AVG(cost) OVER(PARTITION BY cuisine)) as avg_cost_cuisine
FROM restaurants; 


-- 7. Both city & cuisine averages together
SELECT *, 
ROUND(AVG(cost) OVER(PARTITION BY city)) as avg_cost_city ,
ROUND(AVG(cost) OVER(PARTITION BY cuisine)) as avg_cost_cuisine
FROM restaurants; 


-- 8. Restaurants whose cost is more than the average cost of the restaurants
SELECT * FROM restaurants WHERE cost > (SELECT avg(cost) FROM restaurants);
SELECT * FROM (SELECT *,AVG(cost) OVER() AS avg_cost FROM restaurants)t WHERE t.cost > t.avg_cost;


-- 9. Restaurants whose cuisine cost is more than the average cost
SELECT * FROM (SELECT *,AVG(cost) OVER(PARTITION BY cuisine) AS avg_cost FROM restaurants)t WHERE t.cost > t.avg_cost;
