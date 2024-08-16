-- constriants

-- 1> NOT NULL and  2> UNIQUE
use jlc;

create table mycustomer1(
cin int not null unique,
cname char(10) not null,
ctype char(10) default 'regular',
phone int not null,
city char(15) not null,
cdiscount int unique
);

desc mycustomer1;

insert into mycustomer1 (cin,cname,ctype,phone,city,cdiscount)values (111,'sa',111,'ran',10);
select * from mycustomer1;

insert into mycustomer1 (cin,cname,phone,city,cdiscount) values (112,'saa',123,'ranchi',11);
select * from mycustomer1;

insert into mycustomer1 values (113,'sag',980,'blore');  -- error

select * from mycustomer1;
desc mycustomer1;
        
insert into mycustomer1 (cin,cname,phone,city,cdiscount) values (114,'saga', 1234,'london',12);
insert into mycustomer1 (cin,phone,city,cdiscount) values (114, 1234,'london',12); -- error

insert into mycustomer1 (cin,cname,city,cdiscount) values (114,'saga','london',14); -- error

insert into mycustomer1 (cin,cname,phone,cdiscount) values (114,'saga', 1234,15);  -- error 1st check no of values ...than values 
                                                                                     -- 1st error is city doesnot have default value should be not null
																	              -- than evaluating that cin should be unique
insert into mycustomer1 values(115,'sagar','irregular',620,'bokaro',16);


-- primary key    used to uniquely identify records or rows of a table
				-- always not null and unique in nature
                -- one table contains only one p.k

use jlc;

create table mycustomer2(
cid int Primary key,
cname char(15),
city char(10) not null,
phone int (10) not null unique,
cage int(3) not null
);
use jlc;
drop table mycustomer2;
create table mycustomer2(
cid int Primary key,
cname char(15),
city char(10) not null,
phone int not null unique,
cage int not null
);
 insert into mycustomer2 values(111,'sagar','ranchi',123,24);
 insert into mycustomer2 (cid,city,phone,cage) values (112,'ranchi',980,24);
  select * from mycustomer2;
  
  desc mycustomer2;
  
  create table mycustomer3(
  cid int ,
  branch char(3),
  cname char (10) not null default 'b01',
  phone int Not null unique,
  city char unique default 'ranchi'
  );
  
  -- validity check 
  
  insert into mycustomer2 (cid,cname,phone,cage) values (113,'samar',98,24); -- error city doesnot have default value
  insert into mycustomer2 (cid,cname,city,phone,cage) values (113,'samar','bokaro',98,24);
  
								-- composite primary key
create table mycustomer3(
  cid int ,
  branch char(3),
  cname char (10) not null default 'b01',
  phone int Not null unique,
  city char unique,
  Primary key (branch,cid)
  );
  
  alter table mycustomer3 drop column city;
  alter table mycustomer3 add column city char (10);
  desc mycustomer3;
  
  select * from mycustomer3;
  
  insert into mycustomer3 values (111,'b1','sagar',980,'ranchi');
  select * from mycustomer3;
  insert into mycustomer3 values (111,'b2','sagar',789,'ranchi');
  
  insert into mycustomer3 (cid,branch,phone) values (112,'b2',778);
  select * from mycustomer3;
  select * from mycustomer3 where cid=111 and branch='b2';