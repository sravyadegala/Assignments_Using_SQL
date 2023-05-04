drop database if exists museum;

CREATE DATABASE museum;

USE museum;

create table met(
ID INT PRIMARY KEY,
Department varchar(100),
Category varchar(100),
Title varchar(100),
Artist varchar(100),
Date varchar(100),
Medium varchar(100),
Country varchar(100));

select * from met;


-- Complete the following Questions-
-- 1. Select the top 10 rows in the met table.
select * from met
limit 10;
 
-- 2. How many pieces are in the American Metropolitan Art collection?
select Department,count(ID) as pieces 
from met
where Department = "American Metropolitan Arts";

-- 3. Count the number of pieces where the category includes ‘celery’
select count(ID) as no_of_pieces
from met   
where Category like "%celery%";  -- > 21 pieces
-- 4. Find the title and medium of the oldest piece(s) in the collection.
select title,medium,date
from met
order by Date asc limit 1;

-- 5. Find the top 10 countries with the most pieces in the collection.
select country,count(*) as most_pieces
from met 
group by country
order by most_pieces desc limit 10;

-- 6. Find the categories which are having more than 100 pieces.
select category,count(ID) as pieces
from met
group by category
having pieces > 100;

-- 7. Count the number of pieces where the medium contains ‘gold’ or ‘silver’ and sort in descending order
select Medium,count(*) as no_of_pieces
from met 
where Medium  like "%Gold%" or Medium like "%Silver%"
group by Medium
order by no_of_pieces;

