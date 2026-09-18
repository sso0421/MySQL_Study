# 실제 데이터를 기반으로 쿼리구문 연습
# sakila 데이터와 gmarket 데이터를 가지고 진행!

USE sakila; #샤킬라 라는 데이터에 접근하겠다
SHOW TABLES; # 샤킬라 안에 있는 복수의 테이블들을 보여줘
SELECT * FROM country; #컨트리라는 테이블에 모든 데이터를 찾아와줘
SELECT COUNT(*) FROM film; #film이라는 테이블에 몇개의 데이터(행)가 있는지 알려줘
SELECT COUNT(*) AS film_count FROM film; #film이라는 테이블의 카운트 열 이름을 film_count로 바꿔줘
SELECT * FROM film LIMIT 10; #필름이라는 테이블 안에 있는 모든 값들 중 10번째 까지 보여줘
SELECT title, release_year FROM film LIMIT 10; #필름이라는 테이블 안에 있는 값 중 title과 release_year열만 10번째 까지 보여줘

SELECT DISTINCT rating FROM film; #필름 테이블에서 등급 열을 중복 없이 보여줘

SELECT * FROM rental #rental(대여) 테이블의 모든 값을 보여줘
WHERE inventory_id = 367; #inventory_id(재고 ID)가 367번인 행을 보여줘

SELECT COUNT(*) FROM customer; #고객이라는 테이블의 모든 행의 개수를 보여줘
#COUNT와 함께 자주 사용되는 대표적인 집계함수 = SUM, AVG, MAX, MIN

SELECT * FROM customer LIMIT 10; #고객이라는 테이블에서 10개의 모든 값을 보여줘

SELECT * FROM payment LIMIT 100;

SELECT SUM(amount) FROM payment; #페이먼트라는 테이블에서 amount의 합계를 보여줘
SELECT 
	SUM(amount), AVG(amount), 
	MAX(amount), MIN(amount)
FROM payment;

SELECT * FROM rental
WHERE inventory_id = 367 AND staff_id = 1;

# 아래 두 구문의 차이점은? 보여지는 것은 같은데 무슨 차이가 있느냐!
# DISTINCT는 중복값을 제거해라! 1000개의 행 가운데 PG라는 값이 여러개여도 최상위 하나만 찾아오고 다 버려짐. 
# 하지만 그룹바이는 1000개의 행 가운데 PG라는 값이 여러개라면 그 모든 값을 하나로 합쳐서 하나로 보여줘라! 즉, 버려지는 것이 아닌 그룹화가 된 것임.
# 즉, 보여지는 것만 같고 완전 다른 구문임

SELECT DISTINCT rating FROM film; #필름이라는 테이블에서 등급의 중복값 없이 보여줘 > 각 등급을 1개 빼고 다 버림
SELECT rating FROM film GROUP BY rating; #필름이라는 테이블에서 등급열을 그룹화하고 그 등급열을 보여줘 > 각 등급 그룹에 n개가 들어있음


#카운팅 됨 -> 그룹화 시켰으니까!
SELECT rating, COUNT(*) AS rating_count FROM film GROUP BY rating;
# 필름이라는 테이블에서 등급을 그룹화하고, 그 등급이 몇개인지 세어라. 이때, 각 등급별 개수를 센 값의 열 이름은 rating_count라고 하겠다.

#카운팅 안 됨 -> 그룹이 아니고 하나 빼고 다 지웠으니까 매칭이 안되어서..?
SELECT DISTINCT rating, COUNT(*) FROM film;

SELECT rating, COUNT(*) rating_count FROM film
WHERE rating = 'PG' OR rating = 'G' GROUP BY rating;
# 필름이라는 테이블에서 등급이 PG이거나 G인 것을 그룹화하고, 개수를 세어서 보여줘라. 
# 이때, COUNT(*) AS rating_count -> AS는 생략을 밥먹듯이 함

SELECT title, rating FROM film WHERE rating = 'G';
# 필름이라는 테이블에서 등급이 G인 타이틀을 등급과 함께 보여줘

# 우선연산자
SELECT title, rating, release_year FROM film
WHERE 
	(rating ='G' OR rating = 'PG') AND
	(release_year = 2006 OR release_year = 2007);
    
    
SELECT title, rating, release_year FROM film
WHERE 
	(rating ='G' OR rating = 'PG') AND
	(release_year = 2007);
#위에 충족하는 2007년이 없음 ㅠ
    

SELECT rating, COUNT(*) rating_count,
AVG(rental_rate) rental_rate_avg
FROM film
GROUP BY rating
ORDER BY rental_rate_avg;
#rental_rate_avg 기준으로 정렬을 시켜줘(오름차순이 기본! 그래서 ASC는 잘 안 씀 <-> DESC는 내림차순)

# ----- 문 제 풀 이 ----- #
# 각 등급별 영화 길이가 130분 이상인 영화의 갯수와 등급을 출력해주세요!
# 필름에서 등급열(rating), 영화길이열(length)
SELECT rating, COUNT(*) AS rating_count FROM film WHERE length >= 130 GROUP BY rating ORDER BY rating_count DESC;
# 모든 코드 문장의 시작을 SELECT * FROM으로 적어놓기!
# 필름이라는 테이블에서 130분 이상의 길이를 가진 것을 찾을거고, 등급열을 그룹화 하고 각 그룹마다 몇개인지 셀거야. 그리고 그 등급열 카운팅 한 열 이름은 레이팅_카운트고, 레이팅_카운트 열의 정렬 순서를 내림차순으로 만들어줘.


# ----- 문 제 풀 이(혼자 도전)_260707 ----- #
# 각 등급별 영화 길이가 130분 이상인 영화의 갯수와 등급을 출력해주세요!
# 필름에서 등급열(rating), 영화길이열(length)
SELECT rating, COUNT(*) FROM film WHERE length >= 130 GROUP BY rating;
# ~별 이면 그룹바이..!
