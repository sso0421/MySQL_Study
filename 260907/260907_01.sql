# 주석 : 문법관련 내용, 마케팅 관점에서

-- 단문(한줄) 주석

/*
복문 주석
*/


# MySQL : RDBMS(정형화 데이터)를 지원하기 위해서 만들어진 프로그램
# MongoDB : NoSQL(Not Only SQL문법)을 지원하기 위해서 만들어진 프로그램

# DB : 데이터 베이스(여러 데이터들이 모여있는 그룹=집합=저장소를 의미)
# Data : 관찰.측정.조사를 통해 수집된 값, 사실, 기록을 의미

# 데이터를 DB에서 쉽고 빠르게 찾아오기 위해서는 약속을 해야 함 = 스키마
# 스키마: 데이터별로 특정 요소들을 어떤 제약 조건하에 기록/저장 할 것 인가(칼럼별로 저장할 데이터의 형식을 지정하는 것)
# 테이블 : 공통된 주제에 속해있는 데이터들을 별도로 관리하기 위해 만들어 놓은 저장단위를 의미

# DB 안에 복수의 테이블이 있고, 그 테이블은 각각의 컬럼마다 약속(스키마)가 되어 있는 상태에서 데이터가 저장되어 있다. 
# DBMS > RDBMS(대표적 ex 프로그램. MySQL) > DB > Table > Schema > Data


/* SQL 문법 종류의 4가지 분야
# DDL : Data Definition Language(데이터 정의 언어) : CREATE, DROP, ALTER()
# DML : Data Manipulation Language(데이터 조작 언어) : SELECT, INSERT, UPDATE, DELETE, MERGE
# DCL : Data Control Language(데이터 제약 언어) : GRANT, REVOKE
# TCL : Transaction Control Language(데이터 취급=거래 언어) : COMMIT, ROLLBACK, SAVEPOINT
*/


/* 테이블 : 실제 데이터가 저장되어 있는 공간이며, 행과 열로 구성이 되어 있음
-> 1개의 행을 'record (또는) row'라고 부름 = 각 행은 튜플(Tuple)의 형태를 띄고 있음
-> 1개의 열을 '속성(attribute) (또는) 칼럼'이라고 부르며, 칼럼 제목을 '필드명'이라고 부름
*/