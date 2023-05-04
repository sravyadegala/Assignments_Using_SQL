use ig_clone;
select * from comments;
select * from follows;
select * from likes;
select * from photo_tags;
select * from photos;
select * from tags;
select * from users;


-- Find the 5 oldest users.
select * from users order by created_at asc limit 5;


-- What day of the week do most users register on? We need to figure out when to schedule an ad campaign
/*select dayname(created_at) as day_of_week
from users;*/
select max(dayname(created_at)) as day_of_week
from users; 


-- We want to target our inactive users with an email campaign? Find the users who have never posted a photo
select * from users where id not in (select user_id from photos);

select *
from users as u
left join photos as p
on u.id = p.user_id 
where p.user_id is null;


-- We're running a new contest to see who can get the most likes on a single photo.WHO WON??!!
select u.username,l.user_id,l.photo_id,count(*) as no_of_likes
from  users as u
inner join likes as l
on u.id = l.user_id 
group by l.user_id , l.photo_id
order by no_of_likes desc limit 1;


-- Our Investors want to know...How many times does the average user post?   HINT - total number of photos/total number of users
select u.username,count(*) /count(distinct p.user_id) as avg_posts
from users as u
inner join photos as p
on u.id = p.user_id
group by u.id;

-- user ranking by postings higher to lower
select u.username,p.user_id,count(*) as no_of_posts
from users as u
inner join photos as p
on u.id = p.user_id
group by p.user_id
order by no_of_posts desc ;

-- total numbers of users who have posted at least one time.
select count(distinct user_id) as  no_of_posts
from photos;

-- A brand wants to know which hashtags to use in a post.What are the top 5 most commonly used hashtags?
select t.tag_name,count(*) as tags_no 
from tags as t
inner join photo_tags as pt
on t.id = pt.tag_id
group by t.tag_name
order by tags_no desc limit 5;

-- We have a small problem with bots on our site...Find users who have liked every single photo on the site (SUBQUERY)
select username
 from users
 where id in (select user_id from likes);

-- We also have a problem with celebrities.Find users who have never commented on a photo.
select username 
from users
where id not in (select user_id from comments);