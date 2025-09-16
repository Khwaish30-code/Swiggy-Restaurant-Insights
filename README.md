# 📚 Swiggy Restaurant Revenue & Rating Analysis Using SQL

## 🔍 Objective
Analyze Swiggy restaurant performance using cost, rating, and rating_count data to derive actionable business insights city-wise, cuisine-wise, and overall.

## 📑 Dataset
- **Source:** Swiggy restaurant dataset  
- **Rows:** 61,426  
- **Columns:** id, name, city, cuisine, rating, rating_count, cost  
- **Location:** `data/restaurants.csv`

## 🛠️ Technologies Used
- MySQL   
- SQL (Window Functions, Ranking, CTEs, Subqueries)  
- VS Code (for editing scripts)  

## 📂 Project Structure
```
data/
├── restaurants.csv        
window_functions.sql
ranking_functions.sql
revenue_analysis.sqls
README.md             # Project README
```

## 💻 SQL Concepts Demonstrated
1. Window Functions (`AVG() OVER()`, `MIN()`, `MAX()`, `PARTITION BY`)  
2. Ranking Functions (`RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`)  
3. Aggregations & Subqueries  
4. CTEs for top X% revenue analysis  
5. Filtering & conditional analysis  

## 📊 Key Insights
- Average, minimum, and maximum cost and rating across restaurants  
- City-wise and cuisine-wise average cost and ranking  
- Top 5 restaurants by revenue per city and cuisine  
- Revenue contribution of top 1% and 20% restaurants  
- Top cuisines by revenue

## 🚀 Usage Instructions
1. Import `restaurants.csv` into MySQL database `swiggy`  
2. Run the scripts in the following order:
   - `window_functions.sql`  
   - `ranking_functions.sql`  
   - `revenue_analysis.sql`  
