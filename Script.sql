/*
SELECT * FROM point_users
WHERE point > 20000
*/

/*
SELECT * FROM users
WHERE name = '황**'
*/

/*
SELECT * FROM orders
WHERE course_title = '앱개발 종합반' and payment_method = 'CARD'
*/

/* 같지 않음
SELECT * FROM orders
WHERE course_title != '웹개발 종합반'
*/

/* 범위
SELECT * FROM orders
WHERE created_at BETWEEN '2020-07-13' and '2020-07-15'
*/

/* 포함 - 두개 뿐만 아니라 여러 개 사용 가능
SELECT * FROM checkins
WHERE weeK in (1,3) 
*/

/* 패턴으로 검색
SELECT * FROM users
where email like '%daum.net'

SELECT * FROM users
where email like 'a%t'
*/

/* 1번
SELECT * FROM orders
WHERE payment_method != 'CARD'
*/

/* 2번
SELECT * FROM point_users
WHERE point BETWEEN 20000 and 30000
*/

/* 3번
SELECT * FROM users
WHERE email like 's%com'
*/

/* 4번
SELECT * FROM users
WHERE email like 's%com' and name = '이**'
*/

/* 일부 데이터만 가져오기
SELECT  * FROM orders
WHERE payment_method = 'kakaopay'
LIMIT 5
*/

/* 중복 제거
SELECT DISTINCT payment_method FROM orders 
*/

/* 몇개 인지 숫자 세보기
SELECT count(*) FROM orders
WHERE payment_method = 'kakaopay'
*/

/* 응용
SELECT count(DISTINCT(name)) FROM users
*/