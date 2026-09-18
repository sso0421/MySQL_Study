CREATE DATABASE IF NOT EXISTS school;

USE school;

CREATE TABLE IF NOT EXISTS students(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT UNSIGNED,
    grade VARCHAR(10)
);
# 코드를 다 짜고 컨트롤 + 쉬프트 + 엔터를 치면 한번에 처리 됨


DESC students; #학생이라는 테이블(구조)를 보여줘 *DESC : DESCRIBE

SELECT * FROM students; #students라는 테이블에 저장되어 있는 모든 데이터를 한 번에 다 보여줘

INSERT INTO students(name, age, grade) VALUES('강백호',15,'1학년'); #키와 값을 1:1로 매칭해서 넣어라, 오토 인크리먼트를 위에서 선언했으니 3개 값 매칭만 하는거
INSERT INTO students(name, age, grade) VALUES('송태섭',16,'2학년');

INSERT INTO students VALUES(3,'서태웅',15,'1학년'); # name, age, grade 안쓰고 싶으면 필드 개수와 값의 개수를 다 맞춰줘야 함

# DELETE FORM students WHERE id IN (3,4); -> 학생이라는 테이블에서 id가 3, 4인 것을 골라 지워라
# DROP TABLE students;



SELECT * FROM  students WHERE age = 15; #학생이라는 테이블에서 나이가 15세 초과인 사람을 모두 찾아와라


INSERT INTO students(name, age, grade) 
VALUES('정대만',17,'3학년'),('채치수',17,'3학년');
    
# 데이터 모델링
# SQL을 활용해서 서로 다른 테이블간 연결을 할 수 있음
# 이때, JOIN이라는 문법을 사용하는데, A와B라는 연결고리 (PK) 
# 결론은, 함부로 ID 값 중간에 비었다고 조정하지 말기

SELECT * FROM  students 
WHERE age >= 16 AND grade = '3학년';

SELECT * FROM  students 
WHERE age >= 16 OR grade = '3학년';
# '*'를 asterik라고 부름 = '모두'라는 뜻

SELECT * FROM students
WHERE NAME LIKE '송%'; # -> NAME에서 송으로 시작하는 값
# '%'는 0개 이상이라는 뜻
#LIKE는 문자열에서만 씀 "~와 같은 것"을 이라는 뜻

SELECT * FROM students
WHERE NAME LIKE '%치%'; # -> 앞뒤에 몇개가 오든 치만 들어있으면 됨

SELECT * FROM students
WHERE NAME LIKE '_치_'; # -> EX) o치o 만 가능

SELECT * FROM students
WHERE NAME LIKE '__수'; # -> oo수 만 가능

SELECT * FROM students
WHERE NAME LIKE '___'; # -> 3글자인 것만 가능