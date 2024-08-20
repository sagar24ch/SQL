								-- joins
/*	joins are used to fetch /get  combined data from two or more tables.
		to join tables there should be some common column available to specify join condition
        
        generaly used when user is trying to extract data from multiple tables at one time. 
							types of joins
                            1. ineer joins
                            2.outer joins
									a> left outer joins
                                    b> right outer joins
                                    c> full joins
							3. Self joins
                            4.full joins			*/

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

-- inner join also called equi join gives the matching records of the join tables

select * from customer as cus, accounts as acc where cus.cid= acc.mycid;
select * from customer cus 
inner join accounts acc
On cus.cid= acc.mycid;

select cid,cname,phone,accno,bal
from customer cus,accounts acc
where cus.cid=acc.mycid;
select cid,cname,phone,accno,bal
from customer cust inner join accounts acc
on cust.cid=acc.mycid;

select * from customer cus ,address addr
where cus.cid=addr.mycid;
select * from customer cus
inner join address addr
on cus.cid=addr.mycid;

select cid,cname,phone,city,state
from customer cust,address addr where cust.cid=addr.mycid;
select cid,cname,phone,city,state
from customer cust inner join address addr
on cust.cid=addr.mycid;

select * from customer cust,accounts acct,address addr
where cust.cid=acct.mycid and cust.cid=addr.mycid;

select * from customer cust 
inner join accounts acc on cust.cid=acc.mycid
inner join address addr on cust.cid=addr.mycid;

select cid,cname,phone,accno,bal,city,state
from customer cust,accounts acc,address addr
where cust.cid=acc.mycid and cust.cid=addr.mycid;

select cid,cname,phone,accno,bal,city,state
from customer cust
inner join accounts acc on cust.cid=acc.mycid
inner join address addr on cust.cid=addr.mycid;

-- left outer joins ...-- gives matching records of joining table + records remaining in the left side table

select * from customer cust
left join accounts acc
on cust.cid=acc.mycid;

select cid,cname,phone,accno,bal from customer cust
left join accounts acc on cust.cid=acc.mycid;

select * from customer cust 
left join address addr on cust.cid=addr.mycid;

select cid,cname,phone,city,state
from customer cust 
left join address addr on cust.cid=addr.mycid;

select * from customer cust 
left join accounts acc on cust.cid=acc.mycid
left join address addr on cust.cid=addr.mycid;

select cid,cname,phone,accno,bal,city,state 
from customer cust 
left join accounts acc on cust.cid=acc.mycid
left join address addr on cust.cid=addr.mycid;





