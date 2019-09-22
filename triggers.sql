select *
from language;

-- change delimiter
delimiter //

create trigger Language_Before_Insert
before insert on language
for each row
begin
	set new.name = concat(upper(substring(new.name,1,1)),lower(substring(new.name from 2)));
end//

create trigger Language_After_Insert
after update on language
for each row
begin
	-- insert old value
    insert into Audit_Language
    values (old.language_id, old.name, old.last_update, 'Before Update');
    -- insert new value
    insert into Audit_Language
    values (new.language_id, new.name, new.last_update, 'After Update');
end//

-- change delimiter
delimiter ;

insert into language(name) values ('spanish');

create table Audit_Language (
	language_id tinyint(3),
    name char(20),
    last_update timestamp,
    RowValue char(20)
);

update language
set name = 'Spanish v2'
where name = 'Spanish';

select * from language;
select * from Audit_Language;
