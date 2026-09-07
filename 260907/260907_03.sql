# bit: 컴퓨터가 취급하는 최소한의 연산처리 단위 = 0,1 
# byte = 8bit = 1byte = 2^8 = 256

CREATE TABLE mytable(
	id INT UNSIGNED #id 컬럼 값에 부호를 사용하지 않겠다 = 음의 정수가 아닌 양의 정수만 사용하겠다
);

CREATE DATABASE IF NOT EXISTS cutomer_db;
SHOW DATABASES;
USE cutomer_db;

# NULL은 결측을 의미함. (0, not, none도 아닌 값이 미정인 상태 = 언제라도 값이 들어올 수 있음)
CREATE TABLE IF NOT EXISTS customer(
	no INT PRIMARY KEY NOT NULL AUTO_INCREMENT, #'AUTO_INCREMENT' 값이 들어올 때마다 자동으로 하나씩 증가되게하라
    name VARCHAR(20) NOT NULL,
    age INT,
    phone VARCHAR(20),
    email VARCHAR(30) NOT NULL,
    address VARCHAR(50)
);

# TABLE 내 컬럼 속성 변경 방법
ALTER TABLE customer 
	MODIFY COLUMN name VARCHAR(30) NOT NULL;
# ALTER(변경) MODIFY(속성만 변경)

# TABLE 내 컬럼명 + 속성 변경 방법
ALTER TABLE customer 
	CHANGE COLUMN name user_name VARCHAR(20) NOT NULL;
# ALTER(변경) CHANGE(컬럼명+속성 변경)

# TABLE 내 복수의 컬럼명 + 복수의 속성 변경 방법(MODIFY와 CHANGE 함께 사용 가능)
# 동시에 여러 구분을 같이 실행하고자 할 때, 가독성을 위해 적절한 들여쓰기 해주기
ALTER TABLE customer 
	CHANGE COLUMN age user_age INT,
	CHANGE COLUMN phone user_phone VARCHAR(30) NOT NULL;


DESC customer;