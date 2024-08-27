use saacom;
show tables;
desc emp;
select * from emp;
select * from stuinfo;
select * from academic;
select * from company;

alter table company rename students1;
select * from students1;
drop table academic;
drop table stuinfo;
drop table emp;
drop table students1;
show tables;

		-- generaring values for primary keys
        -- by using auto-inrement ...it will automatically initialise values for primary key from 1 and takes max +1


create table student1(
sid int Primary key,
sname char (15) Not Null,
phone int  unique not null
);  

create table student2(
sid int Primary key AUTO_INCREMENT,
sname char (15) Not null,
phone int unique not null
);

insert into student1 values (101,'sagar',123);
insert into student1 values ('sag',234);
insert into student1 (sname,phone) values ('saga',345);

insert into student2 (sname,phone)values ('sagar',123);
select* from student2;

insert into student2 (sname,phone) values ('saga',1234);

insert into student2 values (101,'sag',234);
select * from student2;
insert into student2 (sname,phone) values ('samar',345);
select * from student2;

				-- auto_incrementation with specific values (other than 1)
create table students (
sid int Primary key AUTO_INCREMENT,
sname char (15) not null,
phone int unique not null)
 AUTO_INCREMENT =101;
 
 INSERT INTO students (sname,phone) values ('sagar',123);
 select * from students;
 insert into students (sname,phone) values ('samar',2324);
 insert into students (sname,phone) values ('saga',345);
 select * from students;
 
				-- index ...indexs are used to read the records with specific column values quickly
                /* sql engine begins with 1st record and go through sequencally/linearly 
						hence the process takes more time to find relevant record*/
                /* for P.K key index will be created automatically...we need to create indexes for other col if required*/

show tables;
create table students (
sid int primary key auto_increment,
sname char (15) not null,
phone int unique not null
)auto_increment= 101 ;

select * from students;
insert into students (sname,phone) values ('sri',234);
insert into students (sname,phone) values ('vas',34);
insert into students (sname,phone) values ('ds',999);
insert into students (sname,phone) values ('aa', 111);
insert into students (sname,phone) values ('bb',555);
insert into students (sname,phone) values ('cc',777);
insert into students (sname,phone) values ('dd',444);
insert into students (sname,phone) values ('ee',333);
insert into students (sname,phone) values ('ff',222);
insert into students (sname,phone) values ('gg',888);

select * from students;
select sname from students where phone=777;
select * from students where sname='dd';

-- to boost the searching we can create indexes for phone column

create index phone_index on students (phone);
select * from students where phone=888;

create index name_index on students (sname);
select * from students where sname='sri';
select name_index from students;

				-- views are database objects like tables..also called logical tables
                /* views only contains the schema part it does not contain the data physically
						views are allowed to provide restrictions on columns of a table to particular
                        ex- a branch manager is allowed to see the data of a region only where he can be allowed to
                        read only data or manipulation of data..there is no need to give him access of the full database or 
                        we can say that full records of the table;
                        views will be created based on one or mare existing tables */
                        
	create table customers(
    cid int Primary key,
    cname char(15) not null,
    email char (15) unique not null,
    phone int unique not null,
    city char (15) not null,
    status char (15) not null,
    accno int unique not null,
    atype char (2) not null,
    branch char (10) not null,
    bal double
    );

insert into customers values (101,'sri','sri@myjlc',123,'blore','Active',5001,'sa','b01',25000);
insert into customers values (102,'sagar','sa@gamil',234,'ranchi','active',5002,'sa','b01',25000);
insert into customers values(103, 'sd','sd@myjlc',2345, 'Hyd','Active',5003, 'SA','B01',25000);
insert into customers values(104,'ds','ds@myjlc',345, 'Hyd', 'Active' ,5004, 'SA', 'B01',25000);
insert into customers values(105, 'aa', 'aa@myjlc',111,'Delhi', 'Active',5005,'SA','B01',25000);
insert into customers values(106,'bb','bb@myjlc',222,'Delhi', 'Active', 5006, 'SA', 'B01',25000);
insert into customers values (107,'cc','cc@myjlc', 333, 'Blore','Active', 5007, 'SA','B01',25000);
insert into customers values(108,'dd','dd@myjlc', 444, 'Blore','Active', 5008,'SA', 'B01',25000);
insert into customers values(109,'ee','ee@myjlc',555, 'Hyd', 'Active', 5009, 'SA','B01',25000);
insert into customers values(110,'ff','ff@myjlc',666, 'Hyd', 'Active',5010, 'SA', 'B01',25000);
insert into customers values(111,'gg','gg@myjlc',777,'Delhi', 'Active', 5011, 'SA', 'B01',25000);
insert into customers values(112,'hh', 'hh@myjlc',888, 'Delhi', 'Active', 5012,'SA', 'B01',25000);

select * from customers;

create view teller_view as 
select cid,cname,city,accno,atype,bal from customers;

select * from teller_view where city='blore';

select * from customers;

create view norths_tellerview as
select cid,cname,phone,city,accno,atype,bal from customers where city IN ('delhi','ranchi');

select * from north_tellerview;
select * from norths_tellerview;

create view city_teller_view as
select cid,cname,phone,city,accno,bal from customers where city='blore';

select * from city_teller_view;

create view support_view as
select cid,cname,email,city,status from customers;
select * from support_view;
select cname from support_view;
select phone from support_view;
select cid,cname,city,status from support_view;
