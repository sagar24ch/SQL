					-- trigger
/* trigger is PL/SQL block with name
	trigger will be called automatically whenever an insert or update or delete operation is happened on a given table
		no need to call trigger explicitly like stored procedure*/
        
use saacom;
show tables;
create table mystudents (
sid int Primary key,
sname char (25) not null,
email char (25) not null,
phone long
);

insert into mystudents values (101,'sagar','sa@gmail.com',111);
insert into mystudents values (102,'amar','am@gmail.com',222);
insert into mystudents values (103,'samar','sm@gmail.com',333);
insert into mystudents values(104,'sajan','sj@gmail.com',444);

select * from mystudents;

create table mystudents_backup(
sid int,
sname char (25),
email char (25),
phone long,
action char (10),
actiondate date
);

select * from mystudents_backup;

delimiter ##
create trigger t1
Before update
On mystudents

FOR EACH ROW
begin
declare  mysid int;
declare mysname char(25);
declare myemail char (25);
declare myphone long;
declare myaction char(15);
declare myactiondate date;

set mysid=OLD.sid;
set mysname=OLD.sname;
set myemail=OLD.email;
set myphone=OLD.phone;

set myaction='Update';
set myactiondate=sysdate();

insert into mystudents_backup values (mysid,mysname,myemail,myphone,myaction,myactiondate); 
end;
##
delimiter ;

select * from mystudents;
select * from mystudents_backup;

update mystudents set sname='sagarG' where sid=101;

select * from mystudents;
select * from mystudents_backup;

update mystudents set phone =12345 where sid=101;
select * from mystudents;
select * from mystudents_backup; 

delimiter ##
create trigger t2
Before delete
ON mystudents

for each row
begin
declare mysid int;
declare mysname char(25);
declare myemail char (25);
declare myphone long;
declare myaction char (15);
declare myactiondate date;

set mysid=OLD.sid;
set mysname =OLD.sname;
set myemail=OLD.email;
set myphone=OLD.phone;

set myaction='Delete';
set myactiondate=sysdate();

insert into mystudents_backup values (mysid,mysname,myemail,myphone,myaction,myactiondate);

end;
##
delimiter ;

select * from mystudents;
select * from mystudents_backup;

delete from mystudents where sid=104;

select * from mystudents; 
select * from mystudents_backup;