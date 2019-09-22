select 1-2;
select cast(1-2 as unsigned);	-- note: negative num without sign is a big positiv num!
select cast(1-2 as signed);

select convert('2019-01-01', date);
select convert('2019-01-01 12:00', date);
select convert('2019-01-01 13:45', time);

