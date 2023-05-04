-- USE DATABASE
use students;

/*--  create a table name friends with three columns,
id that stores INTEGER
name that stores TEXT
birthday that stores DATE
*/

create table friends(
ID INT,
NAME TEXT,
BIRTHDAY date);

-- DESCRIBE 
desc friends;

-- add a record name john doe whose birthday 1996-08-30
insert INTO friends(ID,NAME,BIRTHDAY)
values
(1,'Siddhu',"1999-12-10");

--  view the table using select
select * from friends;

--  Now add two of your any friends you like.
INSERT into friends(ID,NAME,BIRTHDAY)
values
(2,"Sravya","2000-01-26"),
(3,"Yochitha","1999-12-09");
select * from friends;

-- change the name of the first friend called 'Siddhu' to 'Bharath'
UPDATE friends
set NAME = "Bharath"
where ID = 1;
select * from friends;

-- add a new column called email
alter table friends
add column EMAIL text;
select * from friends;

-- Update the email address for everyone in your table.
-- Luis email is luis@gmail.com
UPDATE friends set EMAIL = "bharath@gmail.com" where ID = 1;
UPDATE friends set EMAIL = "srav@gmail.com" where  ID = 2;
UPDATE friends set EMAIL = "yochi@gmail.com" where ID = 3;
select * from friends;
 
-- remove Yochitha from friends
DELETE from friends where ID = 3;

-- view complete table using select
select * from friends;
