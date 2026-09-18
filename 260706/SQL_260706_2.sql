USE sakila;

SHOW TABLES;

DESC customer;
DESC address;

SELECT COUNT(*) AS customer_num 
FROM customer
RIGHT OUTER JOIN address 
ON customer.address_id = address.address_id
WHERE customer.customer_id IS NULL;

# SubQuery = 서브쿼리
# 쿼리문(장)
# 쿼리문 안에 또 다른 쿼리문이 존재 하는 경우  => 서브 쿼리가 존재한다
# 쿼리문을 통해서 어떤 결과값을 도출 및 조회 -> 해당 쿼리문 내 특정 조건에 해당되는 요소들에 한한 도출 및 조회
# WHERE 라는 조건문은, 이미 조회해서 찾아온 결과값을 기준으로 조건을 걸겠다
# 서브쿼리를 통한 조건 : 어떤 값을 찾아오기 전부터 특정 조건을 먼저 건다
# 조건에 한 한 결과 값을 조회해서 조회해온 데이터를 가지고 또 WHERE

# 전체 데이터를 조회 > 여성 신발 카테고리 조건 > 값을 찾아오는 것
# 처음부터 여성신발 카테고리에 한 한 값 조회 > 상품 타이틀을 찾아오는 것
DESC items;

USE bestproducts;

# Inner Join 방식으로 서브카테고리가 여성신발인 경우의 상품명만 조회
# 개발자들이 많이 모여있는 곳에서 좋아할만한 코드
SELECT I.title 
FROM items I 
INNER JOIN ranking R 
ON I.item_code = R.item_code
WHERE R.sub_category = '여성신발';

# SubQuery 구문 방식으로 서브카테고리가 여성신발인 경우 조회
SELECT 
	I.title, 
    MAX(dis_price) max_price,
    ROUND(AVG(dis_price), 0) avg_price,
    COUNT(*) product_count
FROM items I
WHERE item_code IN (
	SELECT R.item_code 
    FROM ranking R 
    WHERE R.sub_category = '여성신발'
)
GROUP BY I.title;

# IN = ALL OR
SELECT * FROM items LIMIT 10;


# 메인 카테고리별 할인가격이 10만원 이상인 상품의 갯수를 조회!!
# ~별 :  그룹바이 생각해
SELECT R.main_category, COUNT(*) dis_items
FROM ranking R
JOIN items I
ON R.item_code = I.item_code
WHERE I.dis_price >= 100000 
GROUP BY R.main_category
ORDER BY dis_items DESC;

#위 조인 구문을 서브쿼리 형태로 만들기
SELECT R.main_category, COUNT(*) dis_items
FROM ranking R
WHERE item_code IN(
	SELECT I.item_code
    FROM  items I
    WHERE I.dis_price >= 100000
)
GROUP BY R.main_category
ORDER BY dis_items DESC;
