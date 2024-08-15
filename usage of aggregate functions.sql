use jlc;
desc jlcstudents;

create table jlcstudents(
sid int primary key,
sname char(15),
city char(15),
course char(15),
feepaid double,
feebal double,
status char(10)
);

insert into jlcstudents values(101,'sri','Blore','Java',10000,10000,'Active');
insert into jlcstudents values(102,'vas','Hyd','AWS',5000,15000,'Active');
insert into jlcstudents values(103,'sd','Delhi','Java',12000,8000,'Active');
insert into jlcstudents values(104,'ds','Blore','Python',8000,12000,'Active');
insert into jlcstudents values(105,'aa','Pune','Java',15000,5000,'InActive');
insert into jlcstudents values(106,'bb','Blore','Java',10000,10000,'InActive');
insert into jlcstudents values(107,'cc','Delhi','Python',12000,8000,'InActive');
insert into jlcstudents values(108,'dd','Blore','Java',8000,12000,'Active');
insert into jlcstudents values(109,'hello','Pune','Python',5000,15000,'Active');
insert into jlcstudents values(110,'hai','Delhi','Java',15000,15000,'Active');
insert into jlcstudents(sid,sname,course,feepaid,feebal)
values(111,'abc','Python',5000,15000);
insert into jlcstudents(sid,sname,course,feepaid,feebal)
values(112,'xyz','Java',5000,15000); 

select * from jlcstudents;
select * from jlcstudents;
select count(sid) from jlcstudents;
select count(sid) as "java students" from jlcstudents where course='java';
select count(*) from jlcstudents where course='java' AND city='blore'; 
select count(sid) from jlcstudents where city IS not NULL;
select count( distinct course) from jlcstudents;
select count(distinct city) from jlcstudents;
select * from jlcstudents;
select sum(feepaid) as 'total fee collected' from jlcstudents;
select sum(feepaid) as 'total  java fee collected' from jlcstudents where course='java';
select sum(feepaid) as 'total fee collected' from jlcstudents where course='java' AND city='blore';
select min(feepaid) from jlcstudents;
select max(feepaid) from jlcstudents;
select min(feebal) from jlcstudents;
select max(feebal) from jlcstudents;
select avg(feepaid) from jlcstudents;
select max(sid) +1 as 'next student id' from jlcstudents;
select course,sum(feepaid) from jlcstudents group by course;
select course,sum(feepaid) from jlcstudents group by course having course in ('java','python');
select course,count(*) from jlcstudents group by course;
select course,count(sid) from jlcstudents group by course having course in ('java','python');
select city,sum(feebal) from jlcstudents group by city;
select city,sum(feebal) from jlcstudents group by city having city in ('delhi','blore');
select city,count(sid) from jlcstudents group by city order by city asc;
select city,count(*) from jlcstudents group by city having city in('delhi','blore');
select * from jlcstudents;
select status,count(*) from jlcstudents group by status;
select course,sum(feepaid) from jlcstudents group by course order by course asc;
select course , sum(feepaid) from jlcstudents group by course order by course desc;