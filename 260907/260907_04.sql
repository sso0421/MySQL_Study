# DB를 생성하고 테이블에 값을 넣기 위해 스키마를 정의하고, 정의한 스키마를 수정(MODIFY)하고 스키마 속성 변경(CHANGE)해 봄
# 이제 데이터를 만들어보자

CREATE DATABASE student_db;
USE student_db;
CREATE TABLE students(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, #제약조건 작성 순서는 상관 없음
    name VARCHAR(30), #파란색으로 뜬다고 해서 모두 예약어는 아님
    age INT UNSIGNED,
    grade VARCHAR(10)
);

# 값을 넣기. 당연하게도 컬럼의 개수와 값의 개수를 맞춰서 만들어야 함.
INSERT INTO students VALUES(1, "David", 15, "2학년");

INSERT INTO students(name, age, grade) VALUES("David", 13, "3학년");

INSERT INTO students(name, age, grade) 
VALUES("jane", 14, "1학년"), ("julet", 15, "2학년"), ("romeo", 16, "3학년");


SELECT * FROM students;


## 이제 DB 값을 업데이트(UPDATE) 해보자.

# 값 수정 방법
UPDATE students SET grade="2학년", age=15
WHERE id=3;

# 아래 문법은 조건이 없으므로 실행이 안 됨(SAFE UPDATE 모드니까)
UPDATE students SET grade="3학년", age=16;
# 만약, SAFE UPDATE 모드를 끄고 싶다면, SET SQL_SAFE_UPDATES=0;을 먼저 실행하고 할 것
SET SQL_SAFE_UPDATES=0;
# SET SQL_SAFE_UPDATES=1;은 다시 켜는 것
SET SQL_SAFE_UPDATES=1;

# grade="2학년" AND age=15인 조건의 경우에 grade="1학년", age=14으로 바꿔라
# 하지만 아래 문법도 실행이 안 됨
# 조건절에 반드시 프라이머리 키가 들어가야 하기 때문!
UPDATE students SET grade="1학년", age=14
WHERE grade="2학년" AND age=15;

# => 즉, 부득이 한 경우에는 SET SQL_SAFE_UPDATES=0;를 켜서 쿼리문을  작성할 수 있지만,
# 굳이 권장하지 않는다.


### 이제 테이블 내 값을 조회(SELECT)해보자!
SELECT * FROM students;
SELECT * FROM students WHERE age >=15; 
SELECT * FROM students WHERE age <>15;
#WHERE 조건절에서 비교연산자(=, >=, <=, >, <, !=, <>)와 논리연산자가 많이 사용됨
#파이썬이 아닌 다른 프로그래밍 언어에서는 1=="1"을 같다고 하기도 함(느슨한 연산) 그래서 1==="1"와 같은(타이트한 연산)이 따로 있기도 함 -> 이는 틀린것임

SELECT * FROM students WHERE NOT age=15;
#NOT은 연산자가 아닌, 논리 부정 키워드(예약어로 취급 가능)
#NOT은 단순 부정 연산을 위한 목적보다, NULL의 연산처리를 위한 목적이 큼
#NOT은 독립적인 키워드임! IS NOT NULL이라는 문법이 있는 것이 아님. 관례상 이리 쓰이는 것일 뿐. 그러니까 위에서 NOT age=15와 같은 구문이 사용 가능한 것
SELECT * FROM students WHERE age IS NOT NULL;

SELECT * FROM students
WHERE (age > 15 AND grade="3학년") OR grade="1학년"; #<- 이 경우에는 괄호로 우선 연산을 하게 해야 함
#AND는 좌항과 우항이 모두 TRUE여야 함

SELECT * FROM students
WHERE name LIKE "D%"; #%는 0개 혹은 그 이상의 존재를 정의 = D로 시작하기만 하면 됨

SELECT * FROM students
WHERE name LIKE "%D%"; #%는 0개 혹은 그 이상의 존재를 정의 = D가 들어가기만 하면 됨
