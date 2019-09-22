select adddate('2019-01-01', interval 10 day), date_add('2019-01-01', interval 10 day);
select subdate('2019-02-01', interval 10 day), date_sub('2019-02-01', interval 10 day);

select curdate(), current_date(), current_date;
select curtime(), current_time(), current_time;

select  now(), date(now()), time(now()), year(now()), quarter(now()), month(now()), 
		hour(now()), minute(now()), second(now());

select date_format('2019-01-01 14:30:55', '%d-%m-%y');
-- look for official doc to see all possible formats

