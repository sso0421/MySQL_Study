# DROP과 DELETE와 TRUNCATE의 차이

# DROP 스키마 or 테이블; => 스키마와 테이블이 완전 싹 다 삭제 됨
# DELETE FROM 테이블; => 모든 구조(제약조건)를 포함한 테이블 내 모든 값이 다 사라짐
# TRUNCATE 테이블; => 테이블의 구조(제약조건) 및 필드명(컬럼 값)은 유지하면서 값(행과 열이 교차되는)만 싹 다 제거 함(선택 삭제가 불가)


DELETE FROM students WHERE name = "David";
# 얘도 불가능. 조건절에는 pk가 있어야 삭제 가능. 위와같이 하려면 안전장치 제거 해야 함