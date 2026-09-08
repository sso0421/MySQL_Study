# MySQL 프로그램 설치 > 가입 > 로그인의 방식을 거쳐왔기 때문에, 
# cmd > Workbench 쿼리문을 작성 및 조회가 가능함 = 즉, cmd에서 MySQL Shell사용이 가능하다는 것은 DCL 문법 사용 권한을 가지고 있다는 뜻

# 로컬(내 컴퓨터)에서 접속 가능한 사용자
CREATE USER 'biiig'@'localhost' IDENTIFIED BY '2006';

# 로컬 컴퓨터의 hostname과 port가 아닌 경우에도 접속할 수 있는 사용자(외부에서도 접속이 가능하다는 말) 
CREATE USER 'biiigGlobal'@'%' IDENTIFIED BY '2006';


# 클라우드 컴퓨팅
# 과거에는 어떤 사이트에 접속하려면, 반드시 서버(정보가 저장되어 있는 공간)라는 개념이 존재해야 함
/* 서버의 단점 : 서버는 취급하는 데이터 접속량에 비례하여 사이즈가 커짐(=공간 차지가 크다)
화재, 재난에 따라 서버가 물리적으로 공격을 받을 수 있음
-> 그래서 가상 공간을 만들게 됨. = 서버를 관리하는 전물 기업에서 서버를 빌려 사용하는 것을 말함
분명 재해 관리에 대한 부분은 최소화할 수 있지만, 사이버 공격에 대한 부분은 더 취약
-> 즉, 클라우드라는 가상 공간을 빌려서 그 안에 DB를 적재하여 데이터를 관리
클라우드 컴퓨팅을 지원하는 저장소 ex) MySQL > AWS : EC2, Azure, Firebase


# railway = 클라우드 서비스를 지원해주는 사이트
# -> 여러 사람이 DB를 공유하고 싶을 때, 사용하기 편리함. 단, 실시간 반영은 X

# 블록체인(ex.가상화폐) 은 서버를 통해 저장을 한 것도 아니고, 
로직이 없음. 난수 값을 매번 생산해내기 때문에 해킹할 수가 없음. 앞으로는 이러한 방식으로 변화될 것임
*/

USE student_db;

SELECT host, user FROM  mysql.user;

DROP USER 'biiig'@'localhost';

SET PASSWORD FOR 'biiig'@'localhost' = '2026';
# SET을 통해 비밀번호를 변경함

SHOW GRANTS FOR 'biiigGlobal'@'%';
# 결과 값에서 *.*은 all(모든 DB안에 있는 모든 테이블)을 뜻함. %는 외부에서 들어올 수 있음을 뜻함

GRANT SELECT ON student_db.students TO 'biiigGlobal'@'%';

# 특정(일부) 권한만 허용하고자 할 때
# GRANT INSERT, SELECT, UPDATE ON DB이름.테이블 이름 TO 'userid@host';

# 모든 권한을 주려 할 때
# GRANT ALL ON DB이름.* TO 'userid'@'host';

GRANT ALL ON *.* TO 'biiigGlobal'@'%';

REVOKE SELECT ON student_db.students
FROM 'biiigGlobal'@'%';

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'biiigGlobal'@'%';
# 해당 사용자에게 부여했던 권한을 모두 회수하라는 명령


# SQL 기본 개념, 기본 문법 마무리 함. Sakila를 통해 다양한 문법을 실습할 예정
# 실제 사이트에서 데이터를 수집하고, 수집한 내용을 MySQL에 저장

