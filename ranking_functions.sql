-- Ranking Functions: Rank, Dense_Rank, Row_Number

-- 1. Rank every restaurant from most expensive to least expensive
SELECT * , RANK() OVER(ORDER BY COST DESC) AS rank_cost 
FROM restaurants;


-- 2. Rank every restaurant from most visited to least visited
SELECT * ,RANK() OVER(ORDER BY rating_count DESC) AS rank_visited
FROM RESTAURANTS;


-- 3. Rank every restaurant from most expensive to least expensive as per their city
SELECT * ,RANK() OVER(PARTITION BY CITY ORDER BY COST DESC) AS rank 
FROM RESTAURANTS;


-- 4. Dense-rank every restaurant from most expensive to least expensive 
SELECT * , DENSE_RANK() OVER(ORDER BY COST DESC) AS dense_rank_cost 
FROM restaurants;


-- 5. Row-number every restaurant from most expensive to least expensive
SELECT * , ROW_NUMBER() OVER(ORDER BY COST DESC) AS row_number_cost 
FROM restaurants;


-- 6. Rank every restaurant from most expensive to least expensive as per their city along with its city [Adilabad - 1, Adilabad - 2]
SELECT * , CONCAT(CITY,'-',ROW_NUMBER() OVER(PARTITION BY CITY ORDER BY COST DESC)) AS rank 
FROM RESTAURANTS;


-- 7. Find top 5 restaurants of every city as per their revenue
SELECT * FROM(
    SELECT * ,
            ROW_NUMBER() OVER(PARTITION BY CITY ORDER BY cost*rating_count DESC) AS rank_city 
    FROM restaurants) t 
WHERE t.rank < 6;


-- 8. Find top 5 restaurants of every cuisine as per their revenue
SELECT * FROM(
    SELECT * ,
            ROW_NUMBER() OVER(PARTITION BY cuisine ORDER BY cost*rating_count DESC) AS rank_cuisine 
    FROM restaurants) t 
WHERE t.rank < 6;