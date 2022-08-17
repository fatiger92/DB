-- Join - left join : 모든 요소
-- select * from users u
-- left join point_users p on u.user_id = p.user_id 

-- Join - inner join : 교집합
-- select * from users u
-- inner join point_users p on u.user_id = p.user_id 

-- SELECT * FROM orders o 
-- inner join users u on o.user_id = u.user_id 

-- SELECT * from checkins c 
-- inner join users u on c.user_id = u.user_id 

-- SELECT * from enrolleds e 
-- inner join courses c on e.course_id = c.course_id

-- select c1.course_id, c2.title, count(*) as cnt from checkins c1
-- inner join courses c2 on c1.course_id = c2.course_id 
-- group by c1.course_id 

-- select pu.user_id, u.name, u.email, pu.point from point_users pu 
-- inner join users u on pu.user_id = u.user_id 
-- order by pu.point desc

-- select u.name, count(*) as cnt from orders o
-- inner join users u on o.user_id = u.user_id 
-- where o.email like '%naver.com'
-- group by u.name 

-- 퀴즈 1
-- select o.payment_method, round(avg(pu.point),0) as avg_point from point_users pu 
-- inner join orders o on pu.user_id = o.user_id 
-- group by o.payment_method 

-- 퀴즈 2
-- select u.name, count(*) as cnt_name from enrolleds e 
-- inner join users u on e.user_id = u.user_id 
-- where e.is_registered = 0
-- group by u.name 
-- order by cnt_name desc

-- 퀴즈 3
-- select c.course_id, title, count(*) as cnt_notstart from courses c 
-- inner join enrolleds e on c.course_id = e.course_id 
-- where e.is_registered = 0
-- group by title 

-- 퀴즈 4
-- select c1.title, c2.week, count(*) as cnt from courses c1 
-- inner join checkins c2 on c1.course_id = c2.course_id 
-- group by c1.title, c2.week 
-- order by c1.title, c2.week
 
-- 퀴즈 5
-- orders와 checkins를 inner join 시킬 때 무엇을 기준으로 잡느냐가 중요했음.
-- select c1.title, c2.week, count(*) as cnt from courses c1 
-- inner join checkins c2 on c1.course_id = c2.course_id
-- inner join orders o on c2.user_id  = o.user_id  
-- where o.created_at > '2020-08-01'
-- group by c1.title, c2.week 
-- order by c1.title, c2.week

-- Null 값을 사용해야할 때 left join 을 사용
-- select u.name, count(*) as cnt from users u 
-- left join point_users pu on u.user_id = pu.user_id 
-- where pu.point_user_id  is NULL 
-- group by u.name 

-- 퀴즈
-- count는 NULL을 세지 않는다.
-- select count(point_user_id) as pnt_user_cnt,
--        count(*) as tot_user_cnt,
--        round(count(point_user_id)/count(*),2) as ratio
--   from users u
--   left join point_users pu on u.user_id = pu.user_id
--  where u.created_at between '2020-07-10' and '2020-07-20'

-- union all
-- (
-- 	select '7월' as month, c1.title, c2.week, count(*) as cnt from courses c1
-- 	inner join checkins c2 on c1.course_id = c2.course_id
-- 	inner join orders o on c2.user_id = o.user_id
-- 	where o.created_at < '2020-08-01'
-- 	group by c1.title, c2.week
-- )
-- union all
-- (
-- 	select '8월' as month, c1.title, c2.week, count(*) as cnt from courses c1
-- 	inner join checkins c2 on c1.course_id = c2.course_id
-- 	inner join orders o on c2.user_id = o.user_id
-- 	where o.created_at >= '2020-08-01'
-- 	group by c1.title, c2.week
-- )

-- 숙제
-- select e.enrolled_id, e.user_id, count(*) as cnt from enrolleds e 
-- inner join enrolleds_detail ed on e.enrolled_id = ed.enrolled_id 
-- where ed.done = 1
-- group by e.enrolled_id 
-- order by cnt desc







