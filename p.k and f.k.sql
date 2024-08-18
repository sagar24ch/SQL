use jlc;
-- primary key
    /* use to uniquly identify each row
		  p.k should be unique and not null
			 only one p.k is there for a table  
             
            .... TWo types of pk are there
             1. simple primary key ---- defined with the column at the begining of table creation 
             2. composite primary key ---- defined at the end of table creation pk(column1,column2)  */
             
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
  
  
			-- composite primary key ...combination of two or more column makes a p.k
create table students (
bid char (3),
sid int,
sname char(15) not null,
email char(10) not null unique,
phone int not null unique,
course char (15),
PRIMARY KEY (BID,SID)
);

insert into students values ('b1',111,'sagar','sa@gmail',123,'java');
insert into students values ('b1',112, 'samar','s@gamil',234,'sql');
insert into students values ('b2',111,'aman','a@gmail',908,'c++');
insert into students values ('b2' ,113,'kmk','k@gmail',980,'dbms');
insert into students values ('b2',111,'asha','as@gmail',990,'dsa');       -- error

select * from students where bid='b1' and sid=111;
select * from students where bid='b2' and sid=113;

						-- Foreign key constraint
/*   foreign key constraint is used to establish relationship among two or more tables.
		It allows cascade updation and deletion of data
			Primary key of one table will be the foreign key of the another table.
				table which contains the main information is called the Master table ...where as
					table which contains the related information is called the Child table      */
                    
						-- Types of relationship
/* 1> one to one....primary relation --- one to one
					secondary relation ---one to one    F.K on Master table
                    
   2> one to many ...primary relation ---one to many
					 secondary relation---one to one    F.K on child table
                     
    3> many to many....primary relation ---one to many
					secondary relation ---one to many    F.K on ths 3rd table     */

use jlc;
create table mycustomers(
cin int Primary key,
cname char(10) not null,
email char(15) not null unique,
phone int unique,
city char(10)
);

create table myaccounts(
mycid int,
accno int Primary key,
atype char(15) not null unique,
branch char(15) not null,
bal double,
foreign key (mycid) references mycustomers (cin)
);

create table mytransaction(
myaccno int,
txNo int Primary key,
txDate date not null,
amount double,
txType char (2),
foreign key (myaccno) references myaccounts (accno)
);

desc mycustomers;
desc myaccounts;
desc mytransaction;

insert into mycustomers values (111,'sagar','sa@gmail.com',980,'ranchi');

insert into myaccounts values (111,101,'sa','rr',26000);
insert into myaccounts values (111,103,'ca','btm',5000);

insert into mytransaction values (101,1,sysdate(),5000,'dr');
insert into mytransaction values (103,2,sysdate(),2500,'cr');
            
		
             
             
			
				
             