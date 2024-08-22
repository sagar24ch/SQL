use jlc;
show tables;
desc customer;

select * from customer;
			-- join with extra condition ...condition will apply on the line where the related table is decleared

select * from customer cust 
inner join accounts acc 
on cust.cid=acc.mycid and bal>=15000; 

select * from customer customer
inner join address addr 
on customer.cid=addr.mycid and city='blore';

select * from customer cust
inner join address addr
on cust.cid=addr.mycid and city in('blore','pune');

select * from customer cust
inner join accounts acct on cust.cid=acct.mycid 
inner join address addr on cust.cid=addr.mycid and city in ('blore','delhi');

select * from customer cust
inner join accounts acct on cust.cid=acct.mycid and bal>=15000
inner join address addr on cust.cid=addr.mycid ;

select * from customer cust
inner join accounts acct on cust.cid=acct.mycid and bal>=15000
inner join address addr on cust.cid=addr.mycid and city in ('blore','delhi');

			-- self join ... joining the table to itself to fetch the data from the same table
            
create table myemployees(
empid int,
ename char (15),
mgrid int
);
drop table myemployees;
create table myemployees(
empid int,
ename char (15),
mgrid int
);

insert into myemployees values (101,'sagar',103);
insert into myemployees values( 102,'amar',103);
insert into myemployees values (103,'samar',null);
insert into myemployees values (104,'aman',101);
insert into myemployees values (105,'bman',101);
insert into myemployees values (106,'raman',102);

select emp.ename as "emp name", mgr.ename as "manager name" from myemployees emp,myemployees mgr
where emp.mgrid=mgr.empid;
select emp.ename empname ,mgr.ename ManagerName 
from myemployees emp
inner join myemployees mgr on emp.mgrid=mgr.empid;

select emp.ename as "emp name",mgr.ename as "Manager Name" 
from myemployees emp
left join myemployees mgr on emp.mgrid=mgr.empid;

					-- cross join
			-- ... when we are not providing condition in join it will give cartiasian product of joined table
select cid,cname,accno,bal
from customer cust,accounts acct;


