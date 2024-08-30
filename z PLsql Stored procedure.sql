use saacom;
show tables;
desc customers;

delimiter ##
create procedure mydisplay()
begin
declare a int;
declare b int;
declare total int;
set a=10;
set b=20;
set total = a+b;
select total as "sum";
end;
## 
delimiter ;
call mydisplay();

delimiter ##
create procedure mydisplay1()
begin
 declare a int;
 declare b int;
 declare avgg float;
 set a=50;
 set b=80;
 set avgg=(a+b)/2;
 select avgg as "average";
end;
##
delimiter ;
call mydisplay1();
use saacom;

				-- stored procedure takes 3 types of parameters;
                /*1. IN paramenter
                   2. OUT paramenter
                     3.INOUT paramenter
                */
-- 1. IN parameter.....caller to procedure...by default IN only
delimiter ##
create procedure p10 (IN a int , IN b int)
begin
declare c int;
set c=a+b;
select c as "sum";
end;
##
delimiter ;
call p10(20,40);
call p10(30,50);

			-- 2. OUT parameters....procedure to caller
delimiter ##
create procedure p12(IN a int , IN b int, OUT total int , OUT diff int)
begin 
set total =a+b;
set diff=a-b;
end;
##
delimiter ;
select @a;
select @ b;
select @ mytotal;
select @mydiff;
call p12(50,30,@mytotal,@mydiff);
select @mytotal;
select @mydiff;

-- 3. INOUT parameters...paramenter acts like both
delimiter ##
create procedure p13 (IN a int, INOUT b int)
begin
set b=a+b;
end;
##
delimiter ;

select @a;
select @b;
set @b=20;
select @b;
call p13(20,@b);
select @b;
 
			-- conditional/ if statemant
delimiter ##
create procedure pMax(IN a int , IN b int)
begin
declare c int;
if (a>b) then
set c=a;
else
set c=b;
end if;
select c as "max";
end;
##
delimiter ;

call pMax(50,45);
call pMax (60,65);

delimiter ##
create procedure pmax3(IN a int , IN b int, IN c int)
begin
declare d int;
if (a>b AND b>c) then
set d=a;
elseif (b>c) then
set d=b;
else
set d=c;
end if;
select d as "max";
end;
##
delimiter ;

call pmax3(121,34,133);