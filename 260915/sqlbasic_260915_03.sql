# VIEW : DB에 저장 / 여러 쿼리에서 계속 사용이 가능 / 생성 방식 : CREATE VIEW / "재사용"의 강점이 있음

# WITH 절 = CTE(Common Table Expression)절 : 저장  X, WITH절을 사용한 그 순간의 쿼리에서만 한시적 사용 가능,
# 재사용이 불가하기 때문에 생성 명령어가 따로 필요없고, 삭제도 필요 없음 어차피 한 번만 사용 가능하니까. "가독성"의 강점이 있음

# 위 두가지 절의 큰 차이점 저장이 안 됨 

WITH FilmInventory AS(
	SELECT DISTINCT film_id FROM inventory
)

SELECT 
	F.film_id, F.title
FROM film F
JOIN FilmInventory FI USING(film_id);


# CASE WHEN
SELECT * FROM film LIMIT 10; #rental_rate

SELECT
	title,
    CASE
		WHEN rental_rate < 1 THEN "Cheap"
        WHEN rental_rate BETWEEN 1 AND 3 THEN "Moderate"
        ELSE "Expensive"
	END AS price_category
FROM film;


# Sakila > 각 고객별 총 결제금액을 계산
# 총 결제금액 구간에 따라서 고객을 다음 항목으로 분류 후, 출력
# 총 결제금액 0 - 50 : Low / 51 -- 100 : Medium / 100 초과 : High
# 단, 고객별 총 결제금액은 WITH절로 작성 후, 위 쿼리 구문을 조회 및 출력하세요.

SELECT * FROM payment; # customer_id, amount
SELECT * FROM customer; # customer_id, first_name, last_name

WITH CustomerPayment AS(
	SELECT customer_id, SUM(amount) total_payment
    FROM payment 
    GROUP BY customer_id
)

SELECT customer_id,
	CASE 
		WHEN total_payment BETWEEN 0 AND 50 THEN "Low"
		WHEN total_payment BETWEEN 51 AND 100 THEN "Medium"
		ELSE "High"
	END AS paymentStatus
FROM CustomerPayment;