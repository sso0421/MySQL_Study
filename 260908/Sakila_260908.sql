USE sakila;
SELECT * FROM film LIMIT 10;

SELECT COUNT(*) FROM film;
# 경쟁사 사이트  크롤링 : 상품개수 확인

SELECT COUNT(*) FROM category;
# 경쟁사 사이트  크롤링 : 카테고리 개수 확인

SELECT 
	customer_id, 
    SUM(amount) AS total_revenue
FROM payment 
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;