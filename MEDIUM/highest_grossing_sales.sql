WITH gross_sales AS (
SELECT 
  category, 
  product, 
  SUM(spend) as total_spend,
  RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) ranking
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY category, product)

SELECT category, product, total_spend
FROM gross_sales
WHERE ranking<=2
ORDER BY category, ranking;