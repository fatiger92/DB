/* 테이블에 같은 성씨를 가진 사람이 몇명이 있는지
SELECT name, count(*) FROM users
GROUP BY name
*/

/* 신씨만 가져오기
SELECT * FROM users
where name = '신**' 
*/

/* 신씨 14개 확인
select name, count(*) from users
group by name;
*/

/* 퀴즈
SELECT name, email, count(*)  FROM users
WHERE email LIKE '%naver.com'
GROUP BY name
*/

/* 동일한 범주의 개수 구하기 */
/* 주차별 '오늘의 다짐' 개수 구하기
SELECT week, COUNT(*)  FROM checkins
group by week 
*/

/* 검증
SELECT * FROM checkins
WHERE week = 1
*/

/* 주차별 '오늘의 다짐' 좋아요 최솟값 구하기
SELECT week, min(likes) FROM checkins
group by week
*/

/* 주차별 '오늘의 다짐'의 좋아요 최댓값 구하기
SELECT week, MAX(likes) FROM checkins
group by week
*/

/* 주차별 '오늘의 다짐'의 좋아요 평균값 구하기 
select week, avg(likes) from checkins
group by week;
*/

/* 평균 반올림 (소수 2째 자리까지)
select week, round(avg(likes),2) from checkins
group by week;
*/

/* 주차별 '오늘의 다짐'의 좋아요 합계 구하기
select week, sum(likes) from checkins
group by week;
*/

/* 기본적으로 order by는 오름 차순
 * 하지만 asc로 명시해줘도 상관없음
SELECT * FROM users
group by name
order by count(*) asc
*/

/* 내림 차순은 뒤에 desc를 추가하면 됨
SELECT * FROM users
group by name
order by count(*) desc
*/

/* 웹개발 종합반의 결제수단별 주문건수 세어보기
select payment_method, count(*) from orders 
WHERE course_title = '웹개발 종합반'
group by payment_method 
order by count(*) desc
*/

/* 문자열을 기준으로 정렬 - 영어
select * from users
order by email;
*/

/* 문자열을 기준으로 정렬 - 한글
select * from users
order by name;
*/

/* 시간을 기준으로 정렬
select * from users
order by created_at desc;
*/

/* 퀴즈 1
select payment_method, count(*) from orders 
WHERE course_title = '앱개발 종합반'
group by payment_method 
*/

/* 퀴즈 2
SELECT name, count(*)  FROM users
WHERE email LIKE '%gmail.com'
GROUP BY name
*/

/* 퀴즈 3
select course_id , avg(likes) from checkins
group by course_id
*/

/* 별칭 Alias
select payment_method, count(*) as cnt from orders o 
WHERE o.course_title  = '앱개발 종합반'
group by payment_method 
*/

/* 숙제
select payment_method, count(*) from orders o 
where email like '%naver.com' and course_title = '앱개발 종합반'
group by payment_method 
*/