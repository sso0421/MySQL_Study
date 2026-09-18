USE sakila; #sakila라는 데이터베이스를 사용하겠다

DESC film; #sakila 데이터베이스 안에 있는 flim 테이블 구조를 보여줘

SELECT COUNT(*) FROM film; #film 테이블 내에 있는 데이터 행(Row)의 전체 개수
SELECT * FROM film LIMIT 10; # 전체 행에서 10개만 보여줘라 라는 뜻 (SELECT * FROM film은 다 가져옴)
# SELECT : 어떤 항목을 보여줄지 / FROM : 어느 테이블에서 데이터를 가져올지
# COUNT() 함수 : 어떤 숫자를 집계하려고 하는 함수 = 집계함수

# Domain 학습 : EDA => 탐색적 데이터 분석과정

SELECT rating FROM film LIMIT 10; #필름이라는 테이블에서 rating(등급) 값을 10개만 가져와서 보여줘
SELECT DISTINCT rating FROM film; #DISTINCT는 중복값을 제외하고 고유한 값들만 보여준다

SELECT DISTINCT rating, COUNT(*) FROM film; #에러남 그 이유는 아래
# Error Code: 1140. In aggregated query without GROUP BY, 
# expression #1 of SELECT list contains nonaggregated column 'sakila.film.rating'; this is incompatible with sql_mode=only_full_group_by
#rating별로 묶어서 개수를 세라는 건지, 아니면 그냥 전체 개수를 구하라는 건지" 혼란스러워 함
# 특히 대부분의 데이터베이스 환경에서는 GROUP BY가 없는 상태에서 SELECT문에 일반 컬럼과 집계 함수를 섞어 쓰는 것을 허용하지 않음.
# COUNT(*)는 집계함수

SELECT DISTINCT rating, COUNT(*) FROM film GROUP BY rating; #에러를 보고 수정해서 나온 정상 코드
# 필름 테이블 찾고, 등급(컬럼) 값을 기준으로 같은 것들끼리 묶어서 그룹화해줘. 그리고 묶여진 그룹은 중복이 없어야 하며, 각 그룹에 속한 데이터 개수를 세어서 함께 보여줘

SELECT DISTINCT rating, COUNT(*) AS rating_count FROM film GROUP BY rating; 
#새로 만든 등급별 개수가 적힌 열 이름을 ratind_count으로 변경해줌
