use sakila;

SET GLOBAL log_bin_trust_function_creators = 1;
 
-- change delimiter
delimiter //
-- create function
create function GetLanguage(lang_id int)
returns varchar(100)
begin
	declare LangName varchar(100);
    
    select name
    into LangName
    from language
    where language_id = lang_id;
    
    return(LangName);
end//

create function RentalCountsByCust(cust_id int)
returns int
begin
	declare RentalCounts int;
    
    select count(*) 
    into RentalCounts
    from rental
    where customer_id = cust_id;
    
    return(RentalCounts);
end//
-- change delimiter again
delimiter ;

select GetLanguage(1);
select title, GetLanguage(language_id) language
from film;

select first_name, last_name, RentalCountsByCust(customer_id) rentals_count
from customer;

drop function GetLanguage;