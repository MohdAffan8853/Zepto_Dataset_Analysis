create database zepto_data;
use zepto_data;

-- Q1. Find the top 10 best-value products based on the discount percentage.

SELECT DISTINCT name, mrp, discountpercent
FROM product
ORDER BY discountpercent DESC
LIMIT 10;

-- Q2. What are the Products with High MRP but Out of Stock

SELECT DISTINCT name,mrp
FROM product
WHERE outofstock = TRUE and mrp > 300
ORDER BY mrp DESC;

-- Q3. Calculate Estimated Revenue for each category

SELECT category,
SUM(discountedsellingprice * availablequantity) AS total_revenue
FROM product
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

SELECT DISTINCT name, mrp, discountpercent
FROM product
WHERE mrp > 500 AND discountpercent < 10
ORDER BY mrp DESC, discountpercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.

SELECT category,
ROUND(AVG(discountpercent),2) AS avg_discount
FROM product
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.

SELECT DISTINCT name, weightingms, discountedsellingprice,
ROUND(discountedsellingprice/weightingms,2) AS price_per_gram
FROM product
WHERE weightingms >= 100
ORDER BY price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.

SELECT DISTINCT name, weightingms,
CASE WHEN weightingms < 1000 THEN 'Low'
	WHEN weightingms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM product;

-- Q8.What is the Total Inventory Weight Per Category 

SELECT category,
SUM(weightingms * availablequantity) AS total_weight
FROM product
GROUP BY category
ORDER BY total_weight;