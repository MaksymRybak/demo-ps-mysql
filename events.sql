-- turn on event schedular
set global event_scheduler = on;

create table Audit_Event(
	ID int not null auto_increment,
    Last_Update timestamp,
    primary key(ID)
);

delimiter //

-- one time event
create event one_time_event
on schedule at now() + interval 1 minute
do begin
	insert into Audit_Event(Last_Update) values (now());
end//

-- recurring event
create event recurring_time_event
on schedule every 2 second
starts now()
do begin
	insert into Audit_Event(Last_Update) values (now());
end//

delimiter ;

select * from Audit_Event;

drop table Audit_Event;
drop event recurring_time_event;

show events;