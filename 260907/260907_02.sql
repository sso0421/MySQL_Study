# 쿼리문 작성 또는 모델링을 통해 SQL문을 작성할 수 있음

# DB : 데이터를 관리할 수 있는 가장 큰 카테고리

# 일단 DB가 있어야 DB를 저장할 수 있기 때문에 테이블 부터 만들자!


CREATE DATABASE dbname; #dbname이라는 이름의 DB를 만들겠다.
SHOW DATABASES; #내가 만든 DB를 보여줘.
USE dbname; #dbname이라는 DB를 선택해 사용하겠다.

CREATE TABLE mytable(
	id INT,
    name VARCHAR(50),
    PRIMARY KEY(id)
); 
#mytable이라는 이름의 테이블을 만들겠다. 정수 값만 담는  id와, 가변 문자값(최대 50자)을 담는 name 총 2개의 열로 구성하고 싶어.
#그리고, 주요키는 id야.

#현업에서는 아래 구성을 더 많이 사용, AUTO_INCREMENT의 경우, id에 자동으로 값을 부여한다는 의미
CREATE TABLE mytable(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
); 

#현재 생성된 테이블이 어떤 규칙으로 정의되어 있는가 확인하고자 할 때
DESC mytable;

#현재 생성된 테이블 안에서 값을 조회 하겠다.
SELECT * FROM mytable;

#데이터 베이스 삭제
DROP DATABASE dbname;

# Q. 서로 다른 테이블간에 어떤 연결 및 관계를 맺도록 할 것 인가?!