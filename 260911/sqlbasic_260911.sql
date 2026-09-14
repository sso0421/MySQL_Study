# SQL 기초문법
# 실제 데이터를 활용한 응용 & 활용 문법
# sakila 데이터베이스 활용 기초문법 + 중/고급문법alter

USE sakila; # 데이터 베이스 선택

SELECT * FROM film LIMIT 10; # 조회할 행의 수

SELECT COUNT(*) FROM  film; # 데이터 행의 수

SELECT DISTINCT rating FROM film; # 중복되는 관람등급을 1번만 조회

SELECT DISTINCT release_year FROM film; # 중복되는 연도를 1번만 조회

SELECT * FROM rental WHERE inventory_id = 367; # Where 조건절을 사용하여 조건부로 조회

SELECT * FROM payment LIMIT 10;

SELECT COUNT(*) FROM payment; # 16044건 / 집계함수

SELECT 
	SUM(amount), AVG(amount), MAX(amount), MIN(amount) # 연산처리 및 조회함수
FROM payment;

SELECT * FROM rental
WHERE inventory_id = 367 AND staff_id = 1; # 논리연산 + 조건식

SELECT rating, COUNT(*) AS rating_count
FROM film
GROUP BY rating;

# distinct : 중복요소를 아예 제거하고 조회
# groupby : 중복요소를 하나의 대표값으로 그룹핑 (폴딩되어있는 상태= 접힌상태)
# 그룹핑의 대상이 된 요소들은 집계함수와 사용이 가능함
