use jlc;
show tables;

create table mystudents(
sid int primary key,
sname char(15),
email char(15),
phone long,
city char(15),
course char(15),
bal double
); 

insert into mystudents values(101,'Sri','sri@jlc',123456,'Blore','Java',9000);
insert into mystudents values(102,'Vas','Vas@jlc',654321,'Blore','Java',15000);
insert into mystudents values(103,'ds','ds@gmail.com',1234,'Blore','DevOps',3000);
insert into mystudents values(104,'sd','sd@gmail.com',4321,'Hyd','AWS',5000);
insert into mystudents values(105,'hello','hello@jlc',5555,'Delhi','Java',8000);
insert into mystudents values(106,'hai','hai@gmail.com',9999,'Blore','AWS',6000);
insert into mystudents values(107,'aaa','aaa@jlc',1111,'Pune','DevOps',22000);
insert into mystudents values(108,'bbb','bbb@jlc',2222,'Delhi','Java',7000);
insert into mystudents values(109,'ccc','ccc@jlc',3333,'Blore','Java',20000);
insert into mystudents values(110,'ddd','ddd@jlc',4444,'Hyd','Python',5000);
insert into mystudents(sid,sname,email,course)
 values(111,'eee','eee@gmail.com','Java');
insert into mystudents(sid,sname,phone,course) values(112,'fff',5555,'Python');

select * from mystudents;
select sname, phone,bal from mystudents;
select sname, course from mystudents;
select * from mystudents where sid=105;
select * from mystudents where city='blore';
select * from mystudents where city IN ('delhi','blore');
select * from mystudents where city IN ('delhi','blore','pune');
select * from mystudents where city NOT IN ('hyd','blore');
select * from mystudents where bal>5000;
select * from mystudents where bal<=5000;
select * from mystudents where bal BETWEEN 8000 AND 20000;
select * from mystudents where bal >8000 AND bal<20000;
select * from mystudents where bal <=8000 OR bal >=20000;
select * from mystudents where bal not between 8000 and 20000; 

select * from mystudents where bal>=15000 AND city='blore';
select * from mystudents where bal>=5000 AND city='blore' ANd course= 'aws';
select * from mystudents where course in ('java','aws','python');
select * from mystudents where city='blore' AND course in ('java','aws','python');
select * from mystudents where bal between 8000 AND 20000 AND course in ('java','aws') AND city in ('blore','delhi');
select * from mystudents where sname like 's%';
select * from mystudents where sname like '%s';
select * from mystudents where sname like '_a%';
select * from mystudents where sname like '%d%';
select * from mystudents where sname like '%a_';
select * from mystudents where email like '%@gmail.com';
select * from mystudents where city is null;
select * from mystudents where phone is not null;
select * from mystudents where sname like '_a%' AND city='blore' AND bal >10000;
select * from mystudents where email not like '%gmail.com' AND city != 'blore'AND bal<=10000 AND course='java';
select * from mystudents order by bal;
select * from mystudents where bal is not null order by bal ;
select * from mystudents order by bal desc;
select * from mystudents where city='blore' order by sname;
