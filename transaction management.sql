use saacom;
show databases;
show tables;
						-- transaction management
                          /*  1. rollback
                            2. commit
                            3. autocommit
                            4. savepoint     */
create table myaccounts(
mycid int,
accno int primary key,
atype char(2),
branch char(10),
bal double
);

insert into myaccounts values (101,555,'sa','btm',25000);
insert into myaccounts values (102,999,'ca','btm',55000);

select * from myaccounts;
update myaccounts set bal=45000 where accno=555;
select * from myaccounts;
rollback;
select * from myaccounts;

/*update myaccounts set mycid=101 where mycid=102;
set sql_safe_updates =0;
select * from myaccounts; */

insert into myaccounts values (102,666,'sa','btm',5000);
update myaccounts set bal=5500 where accno=666;
select * from myaccounts;
rollback;
select * from myaccounts;

/* the rollback operation is not rolling back 
		reason behind this is sql allows auto_commit for all queries by default
			so to perform rollback or commit we have to disable the auto commit.....*/

select @@autocommit;
set autocommit=0;
select @@autocommit;

-- now rolling back operation took place

select * from myaccounts;
update myaccounts set bal=50000 where accno=555;
select * from myaccounts;
rollback;
select * from myaccounts;
    -- now its rolling back

insert into myaccounts values (105,777,'ca','btm',5000);
update myaccounts set bal=50000 where accno=666;
select * from myaccounts;
rollback;
select * from myaccounts;




