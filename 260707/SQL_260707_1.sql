USE bestproducts;  #bestproducts라는 DB안에 접속해줘

SHOW TABLES;  #bestproducts라는 DB안에 어떤 테이블이 있는지 보여줘alter

# Hierarchy : 어떤 내용 및 값들이 계층구조의 형태로 되어있는 구조를 말 함 
# ex) 국가 > 도시 > 시.군.구 / 날짜 > 년.월.일.시alter
# 데이터베이스 > 테이블 > 데이터

DESC items;  #items라는 테이블 안에는 몇개의 열(컬럼=속성)로 구성이 되어있는가

SELECT COUNT(*) FROM items;  #items라는 테이블은 몇개의 행으로 이루어져 있는가
# => 10201(행) X 6(열) (*열 = 컬럼 = 속성 = 필드명)

#field name => 컬럼
#item_code => 10201
#title => 상품명
#ori_price => 판매가
#dis_price => 할인가
#discount_percent => 할인율
#provider => 판매자
# ---> 도메인


DESC ranking;  #ranking라는 테이블 안에는 몇개의 열(컬럼=속성)로 구성이 되어있는가

SELECT COUNT(*) FROM ranking;  #ranking라는 테이블은 몇개의 행으로 이루어져 있는가
# => 11902(행) X 5(열)
#num
#main_category 
#sub_category
#item_ranking
#item_code


# Foreign Key = FK : 서로다른 테이블에서 공통적으로 가지고 있는 열 값
