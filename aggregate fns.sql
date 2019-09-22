select count(*) as NumRentals, customer_id
from rental
group by customer_id;

select max(rental_date), customer_id
from rental
group by customer_id;

select min(rental_date), customer_id
from rental
group by customer_id;

select avg(amount), sum(amount), count(*), customer_id
from payment
group by customer_id;
