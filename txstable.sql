use myjdbcdb;
show tables;
create table myaccounts (
accno int PRIMARY KEY,
atype char(2) default "sa",
bal double
);
insert into myaccounts VALUES (101,"SA",2500);
select * from myaccounts;
insert into myaccounts VALUES(102,"CA",5000);
Select * from myaccounts;
update myaccounts set bal=25000 where accno=101;
select * from myaccounts;


