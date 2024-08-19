use jlc;
use saacom;

create table stuinfo (
sid int primary key,
sregno int,
sname char(10) not null,
email char (15) not null unique,
city char(10),
foreign key (sregno) references academic (regno)
);
desc stuinfo;
drop  table stuinfo;

create table stuinfo (
sid int primary key,
sregno int,
sname char(10) not null,
email char (15) not null unique,
city char(10),
foreign key (sregno) references academic (regno)
);

create table academic(
mysid int,
regno int primary key,
semester int not null,
sess int not null
);
drop table des;
 create table company(
  regno int primary key,
  ryear int not null,
  city char(10)
  );
  
  create table emp(
  cregno int ,
  eid int primary key,
  ename char(10),
  phone int not null,
  foreign key (cregno) references company (regno)
  );
  desc company;
  
  use saacom;
  
  
  
  