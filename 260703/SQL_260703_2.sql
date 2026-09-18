CREATE DATABASE IF NOT EXISTS bestproducts; #bestproducts가 데이터베이스에 존재하지 않는다면 생성해라

USE bestproducts; #bestproducts라는 데이터 베이스를 사용하겠다

SELECT * FROM items LIMIT 10; #아이템이라는 테이블의 모든 행 중, 10개만 보여줘

SELECT COUNT(*) FROM items; #아이템이라는 테이블의 행의 개수를 구해줘

# G마켓에 등록된 베스트셀링 상품 목록
# 상품을 잘 판매하는 소수의 20%의 셀러가 대부분의 상품을 차지하고 있음 ex) 어떤 바이어는 N00개의 상품을 등록했을 것임
# 그래서 조건을 걸고 싶음 -> 등록된 상품수가 100개 이상인 바이어만 조회하겠다
SELECT provider, COUNT(*) AS provider_item_count 
FROM items 
WHERE provider !=''
GROUP BY provider
HAVING provider_item_count >= 100
ORDER BY provider_item_count DESC
LIMIT 5;

# --- 아래는 내가 재 실습 ---
SELECT provider, COUNT(*) AS provider_item_count
FROM items 
WHERE provider !='' GROUP BY provider
HAVING provider_item_count >= 100;
#아이템이라는 테이블에서 공급자(셀러)가 빈 값이 아닌 것들 중 공급자를 그룹화 하고 공급자별 개수를 세서 보여줘. 
#이때, 공급자별 카운트의 열 이름은 provider_item_count라고 하고, provider_item_count이 100개 이상인 것들만 보여줘.

# 일반 컬럼(열)의 조건을 따질 때에는 WHERE절을 사용하지만, 조건을 따지고자 하는 열이 만약 집계함수로 연산처리된 것이라면, WHERE절 사용불가
# 집계 함수가 사용된 조건이 들어간 열에는 반드시 HAVING절을 써야 함!
# 위 절의 순서를 반드시 지켜야 함


SELECT * FROM items LIMIT 10;

SELECT * FROM ranking LIMIT 10;

DESC items;
DESC ranking;
# 두 요소의 교집합은 item_code

SELECT * FROM items AS I INNER JOIN ranking AS R
ON I.item_code = R.item_code;
# ON절을 통해 두 테이블이 어떤 기준으로 연결되어야 하는지 알려줌