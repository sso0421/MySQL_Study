# SET = 집합 쿼리 구문

# UNION = 두개 이상의 SELECT문의 결과 -> 집합으로 출력해주는 구문 (중복행 제거) = 중복은 제거된 합집합
# UNION ALL = UNION과 기능은 동일하나, 중복된 행을 포함 = 중복이 제거되지 않은 합집합

# INTERSECT : 교집합 -> MySQL 지원X
# EXCEPT : 차집합 -> MySQL 지원X

# UNION / UNION ALL / INTERSECT / EXCEPT 과 같은 집합 쿼리 구문을 사용하려면, 
# 반드시 각 SELECT 구문의 열이 같은 순서로 되어있어야 함
# 데이터의 유형도 동일해야 함 (스키마 타입이 같아야 함)

-- SELECT film_id FROM film
-- EXCEPT -- UNION ALL
-- SELECT film_id FROM inventory;


# TRANSACTION 구문 (거래 구문) : 반드시 START TRANSACTION이 시작되어야 COMMIT과 ROLLBACK 적용이 유효함
SELECT * FROM customer LIMIT 10;

SET SQL_SAFE_UPDATES = 0;
START TRANSACTION; #지금부터 이 작업들은 한 묶음이야!

UPDATE customer
SET first_name = "DAVE";

SELECT* FROM customer LIMIT 10;

ROLLBACK;

UPDATE customer
SET first_name = "MARY"
WHERE customer_id = 1;

SELECT* FROM customer LIMIT 10;

COMMIT;

SET SQL_SAFE_UPDATES = 1;