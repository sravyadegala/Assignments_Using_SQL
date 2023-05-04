use lecab;

-- 1. First examine all the tables, trips, riders, cars.
/*
we have four tables with the names cars, riders, riders2 and trips.
we have created riders2 with the same structure of riders.
'riders' have one to many relationship with the table 'trips'.
'cars' have one to many relationship with the table 'trips'.

*/
select * from trips;
select * from riders;
select * from rideers2;
select * from cars;

-- 2. check the pk and fk of the tables
/*
The primary key in'riders' table is 'id' which is foriegn key at 'trips' table as 'riderr_id'.
The primary key in 'cars' table is 'id' which is foriegn jey at 'trips' table as 'car_id'.
*/
select * from riders;
select * from cars;

-- 3. Do cross join in riders and cars table.
-- as we have 4 rows in riders and 4 in cars we will get 4x4=16 rows when we cross join.
select * from riders as r
cross join cars as c;

-- To check the below quesry has give the count as 16.
select count(*) as total_rows from riders as r
cross join cars as c;

-- 4. using left join combine trips and riders.
select * 
from riders as r
left join trips as t
on r.id = t.rider_id;

-- As 102 have all the trips just combining 102 from rider to all the data from trips.
-- remaining 101,103,104 have null values at trips columns.

-- 5. use INNER join to combine trips and cars
select * from cars as c
inner join trips as t
on c.id = t.car_id;

-- It joins by retrieving common elements from two tables.

-- 6.  Do union on riders and riders2 table.
select * from riders
union
select * from riders2;

-- 7. What is the average cost of trip? round it in 2 decimals.
select round(avg(cost),2) as avg_cost from trips;

-- 8.  find all the riders who have used lecab less than 500 times.
select * from riders;
select * from riders where total_trips > 500;

-- 9.  Write a query that finds two cars that have the highest trips_completed.
select * from cars;
select * from cars order by trips_completed desc limit 2;
