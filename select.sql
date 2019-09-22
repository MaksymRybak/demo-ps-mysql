/* demo 1 */
select 'Hello World' As HelloWorld;

select 1+1 as Two;

select now();
select curdate();
select curtime();

select pi();

select mod(45,7); 

select sqrt(81);

/* demo 2 */
select * from sakila.actor;
select * from sakila.city;

use sakila;
select * from city;

/* demo 3 */
select * from actor order by first_name asc;
select * from actor order by first_name desc;
select * from actor order by first_name desc limit 10;
select first_name, last_name from actor;

/* demo 4 */
select * from actor where actor_id < 10;
select * from actor where first_name = 'NICK';
select * from actor where first_name = 'NICK' order by last_name;

/* demo 5 - alias*/
select first_name as 'Nome', last_name as 'Cognome' from actor;
select title as 'Titolo', 
	   description as 'Descrizione' ,
       rental_rate*30 as 'Costo noleggio mensile'
from film;

/* demo 6 - functions */
select 	amount,
		round(amount) Amnt, round(amount, 1) as Amnt1,
        floor(amount) FloorAmnt, ceiling(amount) CeilingAmnt
from payment;

/* demo 7 - string operations */
select concat(first_name, ' ', last_name) as FullName
from actor;

select 	concat(first_name, ' ', last_name) as FullName,
		concat(left(first_name,1), ' ', left(last_name,1)) as FirstInitials
from actor;

select 	concat(first_name, ' ', last_name) as FullName,
		length(concat(first_name, ' ', last_name)) as Length
from actor;

select 	concat(first_name, ' ', last_name) as FullName,
		reverse(concat(first_name, ' ', last_name)) as ReverseFullName,
        replace(concat(first_name, ' ', last_name), 'S', '$') as ReplaceExample
from actor;

/* demo 8 - date and time functions, see also official docs */
select 	concat(first_name, ' ', last_name) as FullName,
		last_update as LastUpdate,
		date_format(last_update, '%m%d%y') as LastUpdate1,
        date_format(last_update, '%d-%m-%Y') as LastUpdate2,
        date_format(last_update, '%d %b %Y %T:%f') as LastUpdate3
from actor;

select 	concat(first_name, ' ', last_name) as FullName,
		last_update as LastUpdate,
		date_format(last_update, get_format(date, 'EUR')) as LastUpdate1,
        date_format(last_update, get_format(date, 'ISO')) as LastUpdate2,
        date_format(last_update, get_format(date, 'USA')) as LastUpdate3
from actor;

select 	rental_date,
		dayofweek(rental_date) as DayOfWeek,
        quarter(rental_date) as Quarter,
        week(rental_date) as Week,
        monthname(rental_date) as MonthName
from rental;

/* demo 9 - distinct */
select distinct first_name from actor;
select distinct last_name from actor;

/* demo 10 - where comparison operators */
select * from actor;
select * from actor where actor_id > 100;
select * from actor where first_name = 'Nick';
select * from actor where first_name != 'Nick';

/* demo 11 - where logical operators */
select	*
from 	actor
where	actor_id < 100 AND actor_id > 95;

select	*
from 	actor
where	actor_id < 100 AND actor_id > 95 AND first_name = 'MEG';

select	*
from 	actor
where	NOT first_name = 'NICK';

select	*
from 	actor
where	first_name <> 'NICK';

/* demo 12 - where operators and phrases */
select *
from actor
where first_name in ('NICK', 'ED', 'JOE');

select *
from actor
where first_name in ('NICK', 'ED', 'JOE')
		OR actor_id in (select actor_id
						from actor
						where last_name in ('CHASE', 'SWANK'));

select *
from actor
where actor_id between 1 and 5;

select *
from actor
where actor_id not between 1 and 5;

/* demo 13 - like operator (using also patterns) */
select *
from actor
where first_name like 'A%';

select *
from actor
where first_name like 'AL%';

select *
from actor
where first_name like 'A__E';	-- we use _ for one single character

select *
from actor
where first_name like 'A__E%';

select *
from actor
where first_name like 'A%E%';

select *
from address
where address2 is null;

select *
from address
where address2 is not null;

/* demo 14 - order by */
select *
from address
order by district ASC;

select *
from address
order by district DESC;

select *
from address
order by district, postal_code DESC;

select actor_id, concat(first_name, ' ', last_name) as FullName
from actor 
order by 2 desc;	-- it's better to use the column's name

/* demo 15 - limit clouse */
select *
from actor
order by first_name desc
limit 5;

select *
from actor
order by actor_id
limit 15, 10;	-- start with row num 16 and retrieve next 10 rows
