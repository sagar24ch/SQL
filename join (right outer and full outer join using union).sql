use jlc;
				-- right join ...matching records + records remaining on right side tBLE
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

select * from customer;
select * from accounts;
select * from address;

select * from customer as cus
right join accounts as acc
on cus.cid=acc.mycid;

select cid,cname,phone,accno,bal from customer cust
right join accounts acc
on cust.cid=acc.mycid;

select * from customer cust 
right join accounts acc on cust.cid=acc.mycid;
select * from address;
select * from customer;
select* from accounts;

select * from customer as cus
left join address as addr
on cus.cid=addr.mycid;

select cid,cname,phone,city,state from customer cust
right join address addr
on cust.cid=addr.mycid;

select * from customer cust 
right join accounts acc on cust.cid=acc.mycid
right join address addr on cust.cid=addr.mycid;

select cid,cname,phone,accno,bal,city,state 
from customer cust 
right join accounts acct on cust.cid=acct.mycid
right join address addr on cust.cid=addr.mycid;

			-- full outer joins...matching + records in left + records in right
						-- generaly achieved using UNION

select * from customer cust
left join accounts acc on cust.cid=acc.mycid
UNION
select * from customer cust
right join accounts acc on cust.cid=acc.mycid;

select * from customer cust
left join address addr on cust.cid=addr.mycid
UNION
select * from customer cust
right join address addr on cust.cid=addr.mycid;

select * from customer cust
left join accounts acct on cust.cid=acct.mycid
left join address addr on cust.cid=addr.mycid
UNION
select * from customer cust
right join accounts acct on cust.cid=acct.mycid
right join address addr on cust.cid=addr.mycid;


                        
