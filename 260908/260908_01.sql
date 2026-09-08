USE student_db;
SHOW TABLES;
DESC students;
SELECT * FROM students;

UPDATE students
   SET name = 'Dave',
       age = 16
 WHERE id = 2;
 
 /*
 UPDATE students
   SET name = 'Dave', age = 16
 WHERE name = 'David' AND age = 13 AND grade = '3학년';
 
 -> 위 쿼리문은 잘못됨. WHERE 조건절에 반드시 프라이머리 키가 들어가야 하기 때문!
 */

SELECT * FROM students
WHERE name LIKE "_a__"; #두번째 값이 a인 총 4개의 문자열

SELECT * FROM students
WHERE name LIKE "_____"; #총 5개의  문자열

SELECT * FROM students
WHERE name NOT LIKE "_____"; #총 5개의  문자열


