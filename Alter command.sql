show databases;
use saacom;
show tables;
select * from customers;
desc customer;
use saacom;
desc myaccounts;
use sagar;
show tables;
desc mycustomers;
select * from mycustomers;
insert into mycustomers values (111,'sagar','sa@gamil.com',234,'ranchi');
insert into mycustomers values (112,'agar','a@gamil.com',2334,'blore');
insert into mycustomers values (113,'sgar','saa@gamil.com',2234,'hyd');
insert into mycustomers values (114,'saar','sag@gamil.com',2344,'bokaro');
insert into mycustomers values (115,'saga','saga@gamil.com',2354,'sanchi');

				-- alter statements
alter table mycustomers
ADD COLUMN state char(10) not null
after city;
desc mycustomers;

alter table mycustomers 
add column gender int not null;

alter table mycustomers
drop column gender;
desc mycustomers;

alter table mycustomers
add column gender int not null
after phone;
desc mycustomers;
alter table mycustomers
modify column state char (15);

alter table mycustomers
drop column gender;

alter table mycustomers
modify column state int(23);
alter table mycustomers
modify column phone char(10);
desc mycustomers;

alter table mycustomers
drop primary key;

desc mycustomers;
alter table mycustomers
modify column phone char (10) not null;
desc mycustomers;
alter table mycustomers
add primary key (phone);
desc mycustomers;
alter table mycustomers 
modify column email char (10) null;

alter table mycustomers
drop primary key;
desc mycustomers;
alter table mycustomers
add primary key (cname);
desc mycustomers;
alter table mycustomers
drop primary key;
alter table mycustomers
add primary key (state);
desc mycustomers;
alter table mycustomers
modify column city char (10) ;
alter table mycustomers
modify column city char (10) not null ;

alter table mycustomers
change phone phone_no int not null;
desc mycustomers;
alter table mycustomers 
change email emailId char(20);
desc mycustomers;

alter table mycustomers
rename customer;
select * from customer;

alter table customer
rename to customers;
alter table customers
rename mycustomers;
show databases;
show tables;
select * from mycustomers;
select * from mycustomers limit 0,3;
select * from mycustomers limit 3,2;
select * from mycustomers limit 3,1;
select * from mycustomers limit 2;

select * from mycustomers limit 0,1;
select * from mycustomers limit 1,1;
select * from mycustomers;