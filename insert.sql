use sakila;

create table ActorSample (
	actor_id smallint(5) unsigned not null auto_increment,
    first_name varchar(45) not null,
    last_name varchar(45) null,
    last_update timestamp not null default current_timestamp 
		on update current_timestamp,
	primary key (actor_id)
);

insert into sakila.ActorSample (first_name, last_name, last_update)
values ('Mario', 'Rossi', '2019-09-01');

select * from sakila.ActorSample;

insert into sakila.ActorSample (actor_id, first_name, last_name, last_update)
values (default, 'Maksym', 'Rybak', '2019-09-02');

insert into sakila.ActorSample (first_name, last_name)
values ('Inga', 'Rybak');

insert into sakila.ActorSample (first_name)
values ('Marco');

insert into sakila.ActorSample (last_name)
values ('Rybak');

insert into sakila.ActorSample (first_name, last_name, last_update)
values ('Mario', null, default);

/* multiple values */
insert into sakila.ActorSample (first_name, last_name, last_update)
values 	('Paolo', 'Govi', '2019-09-03'),
		('Andrew', 'Mamah', '2019-09-05'),
        ('Giuseppe', 'Padula', '2019-08-01');
        
insert into sakila.ActorSample (first_name, last_name, last_update)
select first_name, last_name, last_update
from sakila.actor
where first_name like '%Nick%';

drop table ActorSample;