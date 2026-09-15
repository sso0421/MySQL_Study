# VIEW = 가상 테이블 = Virtual Table
# SubQuery | JOIN => 쿼리구문 행수가 많아짐 =>  코드 가독성 저하
# 사람이 코드를 보면서 쿼리구문 작성 => 실수가 많아질 수 있음
# 사전에 가상으로 값을 저장시켜 놓은 테이블을 준비
# 해당 테이블을 필요에 따라서 가져다가 사용 => 쿼리구문 독립성 유지 / 실수 저하
# VIEW => 실제 데이터가 저장 X / SELECT 형식의 쿼리 구문 저장


CREATE VIEW ActorINfo AS 
SELECT first_name, last_name
FROM actor
WHERE  actor_id < 100;


SELECT * FROM ActorInfo;

# VIEW는 한번 생성이 되면, 다른 프로젝트 구문에서도 사용이 가능함
# VIEW는 동일한 이름으로 이미 생성되어있다면, 같은 이름을 또 다시 사용할 수는 없다!
# 다만, 덮어쓸 수는 있음

CREATE OR REPLACE VIEW ActorINfo AS 
SELECT first_name
FROM actor
WHERE  actor_id < 50;

DROP VIEW ActorInfo;

# WITH는 저장 자체가 안 됨


CREATE OR REPLACE VIEW myview AS 
SELECT * FROM customer
WHERE customer_id = 1;

SELECT * FROM myview;

UPDATE customer
SET first_name = "MARY"
WHERE cusomer_id = 1;

DROP VIEW myview;