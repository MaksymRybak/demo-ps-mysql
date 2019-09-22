select *
from actor;

create view vw_all_actors
as
select *
from actor;

select *
from vw_all_actors;

create view vw_actor_n
as
select *
from vw_all_actors
where first_name like 'N%';

select *
from vw_actor_n
order by last_name;

drop view vw_all_actors;
drop view vw_actor_n;
