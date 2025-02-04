			-- 3. date functions
select sysdate();
select now();
select date(sysdate());
select time(sysdate());
select date();
select time();
select time(now());
select date(sysdate());
select date_format(sysdate(),'%d %m %y');
select date_format(sysdate(),'%D-%M-%Y');
select date_format(sysdate(),'%e %m %y');
select date_format(sysdate(),'%W- %D %M %Y');
select date_format(sysdate(),'%a- %D %M %Y');
select date_format(sysdate(),'%W- %D %b %Y');
select time_format(sysdate(),'%T');
select time_format(sysdate(),'%r');
select time_format(sysdate(),'%t');

			-- conversion functions
-- str_to_date ...to change date written in string format so that changes in formats can occurs

select str_to_date('august 15 2024','%D-%M-%Y');

create table hello(
id int,
hello date
);

select * from hello;
insert into hello values( 101,str_to_date('Auguat 15 2024','%D %M %Y'));

