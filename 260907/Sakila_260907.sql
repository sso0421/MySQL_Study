USE sakila;
SHOW TABLES;
#sakila : 미국 DVD 영화 렌탈 서비스를 진행했던 실제 기업의 DB를 벤치마킹하여 만들어 놓은 예제 샘플 데이터
#현재 우리가 sakila에 신규 입사한 마케터라면?!

SELECT * FROM  payment LIMIT 10;

SELECT 
	DATE_FORMAT(payment_date, "%y-%m") AS payment_month, 
    SUM(amount) 
FROM payment
GROUP BY payment_month
ORDER BY payment_month;

SELECT customer_id,
COUNT(*) AS rental_count 
FROM rental
GROUP BY customer_id;