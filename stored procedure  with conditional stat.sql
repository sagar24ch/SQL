use saacom;
delimiter $$
create procedure printnum (IN num int)
begin
declare i int;
set i=1;
while (i<=num) do
select i;
set i=i+1;
end while;
end;
$$
delimiter ;
call printnum (10);

delimiter ##
create procedure totalOfN (IN num int)
begin
declare i int;
declare total int;
set i=1;
set total=0;
while (i<=num) do
set total=total+i;
set i=i+1;
end while;
select total;
end;
##
delimiter ;

call totalOfN (5);

delimiter ##
create procedure sumOfEvennum (num int)
begin
declare i int;
declare total int;
set i=1;
set total=0;
while (i<=num) do
if (i%2=0) then
set total=total+i;

end if;
set i=i+1;
end while;
select total as "sum of even";
end;
##
delimiter ;

call sumOfEvennum(5);

-- REPEAT - UNTIL STATEMENTS

delimiter ##
create procedure p101 (IN num int)
begin
declare i int;
set i=1;
repeat
select i;
set i=i+1;
until (i>num)
end repeat;
end;

##
delimiter ;

call p101(5);

delimiter ##
create procedure p102(num int)
begin
declare i int;
declare total int;
set i=1;
set total=0;
repeat
set total=total+i;
set i=i+1;
until (i>num)
end repeat;
select total as "sum";
end;
##
delimiter ;

call p102(10);

delimiter ##
create procedure p104(num int)
begin
declare i int;
declare total int;
set i=1;
set total=0;
repeat
if(i%2=0) then
set total= total +i;
end if;
set i=i+1;
until (i>num)
end repeat; 
select total;
end;
##
delimiter ;

call p104(10);