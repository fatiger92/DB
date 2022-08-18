-- select u.user_id, u.name, u.email from users u 
-- inner join orders o on u.user_id  = o.user_id 
-- where o.payment_method = 'kakaopay'

-- Where 절에 들어가는 Subquery
-- select user_id, name, email from users u 
-- where user_id in 
-- (
-- 	select user_id from orders o 
-- 	where payment_method = 'kakaopay'
-- )

-- Select 절에 들어가는 Subquery
-- select c.checkin_id, 
-- 	   c.user_id, 
-- 	   c.likes,
-- 	   (
-- 	   	select avg(likes) from checkins
-- 		where user_id = c.user_id 
-- 	   ) as avg_likes_user
--    from checkins c

-- From 절에 들어가는 Subquery (가장 많이 사용되는 유형)
-- select pu.user_id, pu.point, a.avg_likes from point_users pu 
-- inner join 
-- (
-- 	select user_id, round(avg(likes),1) as avg_likes from checkins c 
-- 	group by user_id
-- ) a on pu.user_id = a.user_id


-- 연습 1 - Where 절에 들어가는 Subquery
-- select * from point_users pu
-- where point > 
-- (
-- 	select avg(point) from point_users
-- )

-- 연습 2 - Where 절에 들어가는 Subquery
-- select * from point_users pu
-- where pu.point > (
-- 	select round(avg(pu2.point)) from point_users pu2
-- 	inner join users u 
-- 	on u.user_id = pu2.user_id 
-- 	where u.name = '이**'
-- )

-- 연습 1 - Select 절에 들어가는 Subquery
-- select c.checkin_id , 
-- 	   c.course_id,
-- 	   c.user_id,
-- 	   c.likes,
-- 	   (
-- 	   	select round(avg(c2.likes),1) from checkins c2
-- 	   	where c.course_id = c2.course_id 
-- 	   ) as course_avg
-- 	   from checkins c 

-- 연습 2 - Select 절에 들어가는 Subquery 어려웠음.
-- select c.checkin_id,
-- 	   c3.title,
-- 	   c.user_id,
-- 	   c.likes,
-- (
-- 	select round(avg(c2.likes),1) from checkins c2
-- 	where c3.course_id = c2.course_id 
-- ) as course_avg
-- from checkins c
-- inner join courses c3 
-- on c.course_id = c3.course_id
-- order by c3.title desc, c.likes desc

-- 연습 1 - From 절에 들어가는 Subquery
-- select c.title,
-- 	   a.course_id, 
-- 	   a.cnt_checkins, 
-- 	   b.cnt_total, 
-- 	   (a.cnt_checkins/b.cnt_total) as ratio
-- from 
-- (
-- 	select course_id, count(DISTINCT(user_id)) as cnt_checkins from checkins c 
-- 	group by course_id 
-- ) a
-- inner join
-- (
-- 	select course_id, count(*) as cnt_total from orders o 
-- 	group by course_id 
-- ) b on a.course_id = b.course_id
-- inner join courses c on a.course_id = c.course_id

-- with 절
-- with table1 as (
-- 	select course_id, count(DISTINCT(user_id)) as cnt_checkins from checkins c 
-- 	group by course_id 
-- ), 
-- table2 as (
-- 	select course_id, count(*) as cnt_total from orders o 
-- 	group by course_id 
-- )
-- select c.title,
-- 	   a.course_id, 
-- 	   a.cnt_checkins, 
-- 	   b.cnt_total, 
-- 	   (a.cnt_checkins/b.cnt_total) as ratio
-- from table1 a
-- inner join table2 b on a.course_id = b.course_id
-- inner join courses c on a.course_id = c.course_id

-- 문자열 쪼개기
-- SUBSTRING_INDEX(자를 문자열,자를 기준의 char,1) 앞에 것
-- SUBSTRING_INDEX(자를 문자열,자를 기준의 char,-1) 마지막 것 
-- select user_id, email, SUBSTRING_INDEX(email,'@',1)  from users

-- SUBSTRING(자를 문자열, 시작 인덱스(1부터 시작), 끝마칠 인덱스)
-- select SUBSTRING(created_at,1,10) as date, count(*) from orders o 
-- group by date

-- select created_at, SUBSTRING(created_at,12,8)  from orders

-- 경우에 따라 원하는 값을 새 필드에 출력해보기
-- with table1 as (
-- 		select pu.user_id, point,
-- 			(case when pu.point > 10000 then '1만 이상'
-- 				  when pu.point > 5000 then '5천 이상'
-- 			else '5천 미만' end) as lv
-- 		from point_users pu 
-- )
-- select a.lv, count(*) as cnt from table1 a
-- group by a.lv

-- 퀴즈 1
-- select a.point_user_id, a.point, a.msg from (
-- 	select pu.point_user_id, pu.point,
-- 		(
-- 		case when pu.point > 
-- 		(
-- 			select avg(pu2.point) from point_users pu2 
-- 		) then '잘하고 있어요!'
-- 	    else '열심히 합시다!' end) as msg
-- 	from point_users pu
-- ) a

-- 퀴즈 *2
-- 서브 쿼리 사용 정답
-- select domain, count(*) from
-- (
--   select SUBSTRING_INDEX(u.email,'@',-1) as domain from users u
-- ) a
-- group by domain

-- 이렇게 짧게도 됨, 서브 쿼리 쓸 필요 ㄴ
-- select SUBSTRING_INDEX(u.email,'@',-1) as domain, count(*) from users u
-- group by domain

-- 퀴즈 3
-- select * from checkins 
-- where comment like '%화이팅%'

-- 퀴즈 4
-- with done as (
-- 	select enrolled_id, count(*) as done_cnt from enrolleds_detail ed 
-- 	where done != 0
-- 	group by ed.enrolled_id 
-- ), total as (
-- 	select enrolled_id, count(*) as total_cnt from enrolleds_detail ed 
-- 	group by ed.enrolled_id 
-- )
-- select a.enrolled_id, a.done_cnt, b.total_cnt from done a 
-- inner join total b on a.enrolled_id = b.enrolled_id 

-- 퀴즈 5
-- with done as (
-- 	select enrolled_id, count(*) as done_cnt from enrolleds_detail ed 
-- 	where done != 0
-- 	group by ed.enrolled_id 
-- ), total as (
-- 	select enrolled_id, count(*) as total_cnt from enrolleds_detail ed 
-- 	group by ed.enrolled_id 
-- )
-- select a.enrolled_id, 
-- 	   a.done_cnt, 
-- 	   b.total_cnt,  
-- 	   round((a.done_cnt / b.total_cnt),2) as ratio
--    from done a 
-- inner join total b on a.enrolled_id = b.enrolled_id 

-- 이렇게 줄일 수도 있음
-- select enrolled_id,
--        sum(done) as cnt_done,
--        count(*) as cnt_total,   
--        round(sum(done)/count(*),2) as ratio
-- from enrolleds_detail ed
-- group by enrolled_id









 



