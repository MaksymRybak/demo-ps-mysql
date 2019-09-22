select *
from language;

-- change delimiter
delimiter //
-- create SP
create procedure GetLanguage()
begin
	select *
	from language;
end//

create procedure WhileLoop()
begin
	declare i int default 1;
    while i < 6 do
		select pow(i,i);
        set i = i + 1;
	end while;
end//

create procedure ConcatName(FirstName varchar(100), LastName varchar(100))
begin
	declare FullName varchar(200);
    set FullName = concat(FirstName, ' ', LastName);
    select FullName;
end//

create procedure InsertValue(NameOfLang varchar(100))
begin
    insert into language(name, last_update)
    values (NameOfLang, now());
    
    select last_insert_id();
end//

drop procedure if exists InsertValue;
create procedure InsertValue(
	IN NameOfLang varchar(100),
    OUT LangID INT
)
begin
	insert into language(name, last_update)
    values (NameOfLang, now());
    
    set LangID = last_insert_id();
end//

-- change delimiter again
delimiter ;

call GetLanguage();
call WhileLoop();
call ConcatName('Maksym','Rybak');
call InsertValue('Ukranian');
call InsertValue('Russian');
call InsertValue('Poland');
call InsertValue('Ukranian 3', @LangId);
select concat('Last language ID: ', @LangID);

select * from language;

drop procedure GetLanguage;
drop procedure WhileLoop;
drop procedure InsertValue;