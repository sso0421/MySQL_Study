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

USE bestproducts; #bestproducts DB에 접속하겠다

SHOW TABLES; #bestproducts 테이블을 보여줘
# Oracle 표준 SQL 문법에서는 Table이 아닌 Entity라고 부름
# Oracle 표준 SQL 문법에서는 Field(Column)를 Attribute라고 부름

DESC items; #items 테이블
DESC ranking; #ranking 테이블

SELECT * FROM items INNER JOIN ranking
ON items.item_code = ranking.item_code
WHERE ranking.main_category = 'ALL';
#items와 ranking이라는 테이블을 item_code를 기준으로 연결할 것이며, 랭킹의 메인 카테고리가 ALL 인 것들에 한해 모두 보여줘

# 위 코드 = 아래 코드

SELECT * FROM items AS I # AS는 생략 가능
INNER JOIN ranking AS R
ON I.item_code = R.item_code #items와 ranking이라는 테이블을 item_code를 기준으로 연결하겠다
WHERE R.main_category = 'ALL';

# 코드와 문법을 알아도 문제를 해결하는 것은 별도의 일!

# 전체 베스트상품 (bestproducts DB)중, 메인카테고리가 ALL에 한해 있는 
# 판매자별 등록 상품 갯수를 조회해 보자!
SELECT provider, COUNT(*) AS product_count
FROM items AS I
JOIN ranking AS R
ON I.item_code = R.item_code
WHERE I.provider <> "" AND R.main_category = 'ALL'
GROUP BY I.provider 
ORDER BY product_count DESC;

# CRUD, Divide & Conquor -> 나눠서 하나하나 해보자

# -> 많은 노력과 훈련이 필요해!! 머리를 쓰자...
# 보험, 카드 등의 SQL 쿼리문을 많이 사용하는 회사에 취업을 하게되는 경우, 코딩 테스트를 보는 경우가 많음


# 메인카테고리가 "패션의류"라는 전제하에
# 판매자별 등록상품 갯수가 5개 이상인 판매자의 이름과 현재 등록되어있는
# 전체 상품 갯수를 출력해주세요!
DESC items; #items 테이블
DESC ranking; #ranking 테이블

SELECT I.provider, COUNT(*) product_count
FROM items I 
JOIN ranking R ON I.item_CODE = R.item_code
WHERE MAIN_CATEGORY = '패션의류'
GROUP BY I.provider
HAVING product_count >= 5
ORDER BY product_count DESC;


# 메인카테고리가 화장품/헤어 인 조건하에 전체 조회된 
# 상품들의 평균, 최대, 최소 할인가격 출력하기
DESC items; #items 테이블
DESC ranking; #ranking 테이블

# 출력 대상부터 적기 = 할인가격 => SELECT I.dis_price FROM items AS I; 
# 상품들의 평균, 최대, 최소

SELECT 
	ROUND(AVG(I.dis_price), 0) AS avg_dis_price, 
	MAX(I.dis_price) AS max_dis_price, 
	MIN(I.dis_price) AS min_dis_price 
FROM items AS I
JOIN ranking AS R 
ON I.item_code = R.item_code
WHERE main_category = '화장품/헤어';





# --- 위 3가지 문제를 내가 혼자 다시 풀어봄_260707 ---
# 문제1.
# 전체 베스트상품 (bestproducts DB)중, 메인카테고리가 ALL에 한해 있는 판매자별 등록 상품 갯수를 조회해라!
SELECT main_category, provider, COUNT(*) AS product_count 
FROM items AS I JOIN ranking AS R ON I.item_code = R.item_code 
WHERE provider <>"" AND main_category = "ALL"
GROUP BY main_category, provider;


# 문제 2.
# 메인카테고리가 "패션의류"라는 전제하에 판매자별 등록상품 갯수가 5개 이상인 판매자의 이름과 현재 등록되어있는 전체 상품 갯수를 출력해라!



# 문제 3.
# 메인카테고리가 화장품/헤어인 조건하에 전체 조회된 상품들의 평균, 최대, 최소 할인가격 출력하기
