select ascii('a'), ascii('A');

select char(12,121);
select char(65);

select length('Hello World');

select concat('Hi', ' My', ' Dier', ' Friend') as Hello;

select lcase('LOW CASE');
select ucase('upper case');

select left('Hello World', 5);
select right('Hello World', 5);

select rtrim('   Right spaces   '), length(rtrim('   Right spaces   '));
select ltrim('   Right spaces   '), length(ltrim('   Right spaces   '));
select trim('   spaces   '), length(trim('   spaces   '));

select strcmp('Hello', 'Hello');
select strcmp('Hello', 'Hello1');
select strcmp('Hello World', 'Hello');

select reverse('Hello');