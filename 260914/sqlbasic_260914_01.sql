USE sakila;

SELECT 
	rating, 
    COUNT(*) rating_count, 
    AVG(rental_rate) avg_rental_rate
FROM film 
GROUP BY rating
ORDER BY avg_rental_rate DESC; #default ASC DESC;

SELECT 
	rating, 
    COUNT(*) rating_count, 
    AVG(rental_rate) avg_rental_rate
FROM film 
WHERE release_year = 2006 OR release_year = 2007
GROUP BY rating
HAVING rating_count >= 200
ORDER BY avg_rental_rate DESC; #default ASC DESC;
# GROUP화를 하고자 하는 대상이 존재 : 해당 그룹화 대상의 조건이 직접적이지 않다면, WHERE절 사용이 가능
# 그룹화 되어 있는 대상의 조건을 설정하고자 할 때 : Having

# 표기순서 : SELECT -> FROM ->  WHERE -> GROP -> HAVING -> ORDER
# 실행순서 : FROM ->  WHERE -> GROP -> HAVING -> SELECT -> ORDER