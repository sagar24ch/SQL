use saacom;
create table jlcstudents(
sid int primary key,
sname char(10) not null,
email char(10) not null,
totalfee double default 20000,
feepaid double not null,
m1 int,
m2 int,
m3 int,
total int,
average double,
grade char(5)
);

insert into jlcstudents (sid,sname,email,feepaid,m1,m2,m3) values (101,'sagar','sa@gmail',5000,95,90,90);
insert into jlcstudents (sid,sname,email,feepaid,m1,m2,m3) values (102,'samar','sm@gmail',15000,85,80,80);
insert into jlcstudents (sid,sname,email,feepaid,m1,m2,m3) values (103,'agar','a@gmail',10000,55,60,40);
insert into jlcstudents (sid,sname,email,feepaid,m1,m2,m3) values (104,'saar','sr@gmail',2000,95,96,60);

select * from jlcstudents;

delimiter ##
create procedure getBalance (IN mysid int,OUT mybal double)
begin
declare mytotalfee double;
declare myfeepaid double;

select totalfee,feepaid into mytotalfee,myfeepaid from jlcstudents where sid=mysid;

set mybal=mytotalfee-myfeepaid;
end;
##
delimiter ;

select @mybal;
call getBalance(101,@mybal);
select @mybal;

call getBalance(103,@mybal);
select @mybal;
select * from jlcstudents;

delimiter ##
create procedure findGrade(IN mysid int)
begin

declare mm1 int;
declare mm2 int;
declare mm3 int;
declare mytotal int;
declare myaverage double;
declare mygrade char;

select m1,m2,m3 into mm1,mm2,mm3 from jlcstudents where sid=mysid;
set mytotal=mm1+mm2+mm3;
set myaverage=mytotal/3;
if (myaverage>=90) then
set mygrade='A';
elseif (myaverage >=80) then
set mygrade='B';
else 
set mygrade='C';
end if;

-- set mygrade= trim(mygrade);

update jlcstudents set total=mytotal, average=myaverage, grade=mygrade where sid=mysid;
end;
##
delimiter ;

call findGrade(101);

delimiter ##
create procedure findGrade1(IN mysid int,out mygrade char)
begin

declare mm1 int;
declare mm2 int;
declare mm3 int;
declare mytotal int;
declare myaverage double;
declare mygrade char;

select m1,m2,m3 into mm1,mm2,mm3 from jlcstudents where sid=mysid;
set mytotal=mm1+mm2+mm3;
set myaverage=mytotal/3;
if (myaverage>=90) then
set mygrade='A';
elseif (myaverage >=80) then
set mygrade='B';
else 
set mygrade='C';
end if;

set mygrade= trim(mygrade);

update jlcstudents set total=mytotal, average=myaverage, grade=mygrade where sid=mysid;
end;
##
delimiter ;

select @mygrade;
call findGrade1 (101,@mygrade);
select @mygrade;

delimiter ##
create procedure findGrade2(IN mysid int, OUT mygrade char)
begin

declare mm1 int;
declare mm2 int;
declare mm3 int;
declare mytotal int;
declare myaverage double;

select m1,m2,m3 into mm1,mm2,mm3 from jlcstudents where sid=mysid;
set mytotal=mm1+mm2+mm3;
set myaverage=mytotal/3;
if (myaverage>=90) then
set mygrade='A';
elseif (myaverage >=80) then
set mygrade='B';
else 
set mygrade='C';
end if;

set mygrade= trim(mygrade);

update jlcstudents set total=mytotal, average=myaverage, grade=mygrade where sid=mysid;
end;
##
delimiter ;

select @mygrade;
call findGrade2(104,@mygrade);
select @mygrade;

select * from jlcstudents;