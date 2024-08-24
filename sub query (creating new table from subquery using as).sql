use jlc;
create table customer(
cid int Primary key,
cname char(15) Not Null,
email char(15) Not Null Unique,
phone char(10) Not Null Unique
);

create table accounts(
mycid int,
accno int Primary key,
atype char(2) Not null,
bal double Not null
);

create table address(
mycid int,
addid int Primary key,
street char (15) not null,
city char (15) not null,
state char(15) not null
);

insert into customer values(101,'sri','sri@jlc',111);
insert into customer values(102,'vas','vas@jlc',222); 
insert into customer values (103,'sd','sd@jlc',333);
insert into customer values(104,'ds', 'ds@jlc',444); 
insert into customer values (105, 'hello', 'hello@jlc',555);
insert into customer values (106,'hai', 'hai@jlc',666);
insert into customer values (107, 'aaa','aaa@jlc',777);
insert into customer values (108,'bbb','bbb@jlc',888);
insert into customer values (109,'ccc','ccc@jlc',999);

insert into accounts values (101,12345,'SA',5000);
insert into accounts values (102,12346,'SA',15000);
insert into accounts values (103,12347, 'SA',25000);
insert into accounts values (107,12348,'SA',3000);
insert into accounts values (108,12349, 'SA',13000);
insert into accounts values (109,12350, 'SA', 18000);

insert into address values (101,1,'BTM', 'Blore', 'KA');
insert into address values (102,2, 'MHA', 'Blore', 'KA');
insert into address values (103,3, 'P1', 'Pune','MH');
insert into address values (104,4,'D1', 'Delhi','Delhi');
insert into address values (109,5, 'D2','Delhi', 'Delhi');
insert into address values (110,6, 'P2', 'Pune','MH');
insert into address values (111,7,'H1', 'Hyd', 'TG');
insert into address values (112,8,'pp', 'Patna', 'BR');

desc customer;
desc accounts;
desc address;

select cid from customer where phone =333;
select bal from accounts where mycid=103;
select bal from accounts where mycid= (select cid from customer where phone=333);

select accno as accountno , bal as balance from accounts where mycid IN (select mycid from address where city ='blore');
select mycid from address where city='blore';
select accno , bal from accounts where mycid in (102,101);

select city from address where mycid = (select cid from customer where email='ccc@jlc');

select cname,email,phone from customer 
where cid =(select mycid from accounts where accno=12345);

select * from customer where cid IN (select mycid from accounts where bal<20000);

desc address;
select cname ,email,street ,city from customer cust inner join address addr on cust.cid=addr.mycid
and cid in (select mycid from accounts where bal<20000);

select cname,email,accno,bal,street,city from customer 
inner join accounts on customer.cid=accounts.mycid
inner join address on customer.cid=address.mycid
and address.mycid in (select mycid from address where city='blore');

select * from accounts;

select cname,email,phone,accno,street,city,bal from customer
inner join accounts on customer.cid=accounts.mycid
inner join address on customer.cid=address.mycid
and address.mycid in (select mycid from accounts where bal=25000);

			-- sub queries are also used to create new tables from the existing table ...table structure and data as well will be copied as it is
					-- for this have to use "as" keyword
                    
 create table mycust1 as select * from customer; 
 select * from customer;
 select * from mycust1;
 
 create table mycus2 as select cid,cname,phone from customer;
 select * from mycus2;
 
			-- to copy only the same stucture of the table without data ...false condition 1=2 is used
            
create table mycust2 as select * from customer where 1=2;
select * from mycust2;    
drop table mycust2;        

create table mycust3 as select cid,cname,phone from customer where 1=2;
select * from mycust3;

create table mycust4 as select * from address;
select * from mycust4;

create table mycust5 as select * from address where city='blore';
select * from mycust5; 

 create table hellocust as
select cid,cname,phone,accno,bal,street,city from customer cust 
left join accounts acct on cust.cid=acct.mycid
left join address addr on cust.cid=addr.mycid;

select * from hellocust;
drop table hellocust;