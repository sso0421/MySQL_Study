#SQL 구문 및 문법
# 1. SELECT : 최종적으로 보고싶은 컬럼 / FROM : 접근, 사용 하려고 하는 테이블 
# 2. WHERE & AND, OR : 조건절
# 3. LIMIT : 출력 개수 제한
# 4. DISTINCT : 중복 값 없이
# 5. GROUP BY : 그룹화 해줘
# 6. ORDER BY & ASC, DESC : 정렬 & 오름차순, 내림차순
# 7. HAVING : 그룹화된 데이터에서 다시 조건절 걸 때
# 8. LIKE & %, _ : LIKE 박% -> 박으로 시작하는 것 / LIKE _소_ -> 소 앞뒤로 한글자씩만 올 수 있음
# 9. JOIN : 복수의 서로 다른 테이블을 활용해서 1개의 새로운 테이블로 병합하는 기능
# -> INNER JOIN(*공통된 열이 반드시 하나 이상 있어야 함)
# -> OUTER JOIN : LEFT OUTER JOIN(*왼쪽이 기준), RIGHT OUTER JOIN(*오른쪽이 기준)
# 10. 서브쿼리
# 11. SQL 주요함수


USE sakila;

SHOW TABLES;

DESC film;

SELECT title,
UPPER(title) AS title_len, 
LOWER(title) AS title_len
FROM film 
LIMIT 10;

SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS full_name
FROM actor LIMIT 10;
#CONCAT

SELECT description,
SUBSTRING(description, 3, 10) short_desc
FROM film LIMIT 10;