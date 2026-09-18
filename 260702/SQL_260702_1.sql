/*
모든 프로그램 언어는 CRUD에 입각해서 먼저 공부를 하고, 살을 붙여나감
Create : 생성 기능
Read :  읽기 기능
Update : 수정 기능
Delete : 삭제 기능
*/

#CREATE DATABASE : 아래는 만약 mega라는 DB가 없다면 새로 생성하겠다라는 생성문법 (즉, IF NOT EXISTS는 옵션)
CREATE DATABASE IF NOT EXISTS mega; #mega라는 데이터베이스를 생성해줘 -> '컨트롤 + 엔터'를 쳐서 실행
CREATE DATABASE IF NOT EXISTS rainyday;

#SHOW DATABASES : DB를 나에게 보여달라는 생성문법
SHOW DATABASES;

#USE : 아래는 mega DB에 접속하겠다라는 생성문법
USE mega;
USE rainyday;

#DROP : 아래는 만약 mega라는 DB가 있다면 삭제를 하겠다라는 생성문법(즉, IF EXISTS는 옵션)
DROP DATABASE IF EXISTS mega;

# Schema = 약속된 구조의 형태
# MySQL, BIGQUERY는 동일한 문법 체계를 사용 => SQL
# SQL : Structred Query Language
# 테이블을 생성 -> ex) 4개의 열을 생성하겠다 : 숫자, 문자, 숫자, 문자 <= 단, 해당 열과 다른 경우는 넣을 수 없음(이것을 파괴하는 문법이 noSQL)
# 필드명 = field name = 컬럼명
# 문자열 = CHAR(무조건 10자를 채운다고 생각. 2자리면, 남은 8자리는 공백으로) / VARCHAR(가변적인 경우에 선택하기)
# 테이블 생성 => 어떤 테이블이던지 간에 해당 테이블안에 포함된 각 행들의 대표값
# name VARCHAR(50) #50자 까지 허용할게
# PRIMARY KEY(id) #id를 고유의 값으로 만들겠다

#CREATE TABLE IF NOT EXISTS : 아래는 firststable이라는 테이블이 존재하지 않는다면 테이블을 생성하겠다
CREATE TABLE IF NOT EXISTS firststable (
	id INT,
    name VARCHAR(50),
    PRIMARY KEY(id)
);

# id INT : id 필드는 숫자로만 구성된다
# name VARCHAR(50) : 네임 필드는 바차를 사용하고, 50자까지만 허용하겠다 -> 차랑 바차는 무조건 문자열
# id 필드는 프라이머리키(고유의 값)으로 만들겠다

# 생성된 테이블의 구조 확인
DESC firststable;

# 테이블 안에 있는 내부 값을 조회하겠다
SELECT * FROM firststable;

#id INT UNSIGNED NOT NULL AUTO_INCREMENT: id에 양의 정수값만 넣을거야, 그리고 무조건 값이 들어오게 할거야, 그리고 값이 들어올 때마다 자동으로 증가하게 해
CREATE TABLE IF NOT EXISTS secondstable (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL, #name 필드는 바차를 사용하고, 50자 까지만 허용하고, 무고건 값이 들어오게 할거야
    PRIMARY KEY(id) #프라이머리 키를 id, name 함께 묶을 수 도 있음?
);

# 생성된 테이블의 구조 확인
DESC secondstable;


#컬럼 내 데이터 타입 = 스키마(전체 설계도)
# 빅쿼리, MYSQL에서 사용되는 데이터 타입
#-> 문자열 데이터 타입 : VARCHAR(현업 주 사용), CHAR, TINY TEXT..
#-> 날짜 데이터 타입 : DATE, TIME..
#-> 숫자 데이터 타입 : TINYINT, SAMLLINT, INT(현업 주 사용)..
#-> 각각 데이터 메모리의 가용범위가 다름 : 1byte(8bit), 4byte

CREATE TABLE IF NOT EXISTS thirdstable (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    modelnumber VARCHAR(10) NOT NULL,
    series VARCHAR(30) NOT NULL
);


#생성된 테이블의 구조 확인
DESC firststable;
DESC secondstable;
DESC thirdstable;