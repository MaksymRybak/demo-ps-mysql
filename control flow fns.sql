set @var = 1;
select case @var
			when 1 then 'one'
            when 2 then 'two'
			else 'more' 
		end as Result;

select case 
			when  @var = 1 then 'one'
            when  @var = 2 then 'two'
			else 'more' 
		end as Result;

set @va1 = 1;
set @va2 = 2;
select case 
			when  @va1 = 1 or @var2 = 2 then 'one/two'
            else 'more'
		end as Result;

select if(1>2,2,3);
select if(1<2,2,3);
select if(year(now()) = 2019, 'yes', 'no');

select ifnull(1,0);
select ifnull(null,0);
select 1/0;
select ifnull(1/0,'yes');

select nullif(1,1);	-- if two nums are idential we get null in output
select nullif(2,1);
