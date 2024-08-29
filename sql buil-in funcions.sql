			-- sql built in functions
/* 1. Arithmetic functions
	2.String function
    3.Date functions
    4. Conversion function
    5. Aggregate functions
*/
-- 1. Arithmetic functions
select sqrt(25);
select sqrt(5);
select power(5,2);
select power (98,2);
select pow(3,4);
select mod(9,2);
select mod (17,3);
select abs (-98);
select abs(98);
select abs(-45.5);
select abs(-903);
select ceil(9.2);
select ceil (9.0);
select ceil(3.9);
select floor(9.9);
select floor(2.2);
select floor(0.9);
select ceil(0.1);
select round(.1);
select round(.4);
select round(0.4);
select round(.5);
select round (.6);
select round(0.9);

			-- string function
select length('sagar');
select length('  sagar ');
select trim('   sag ar  ');
select trim('  s  a  m  a  r               ');
select length(trim('  s  a  m  a  r               '));
select ltrim(   '   samar   ');
select length(ltrim(   '   samar   '));
select rtrim('   samar   ');
select rpad('sagar',6,'#');
select rpad('samar',9,'#');
select rpad ('sagar',6,'3');
select lpad('sagar',8,'*');
select length(lpad('sagar',4,'*'));
select rpad('sagar',4,'*');
select concat('sagar','gorai');
select concat('agar' ,' magar');
select substr('sgarGorai',2,6);
select substring('dillidilwaloki',6,7);
select substr(concat('pandu','ranga','pg'),6,5);
select lower('SaGar');
select lcase('MAGArrr');
select lcase('masaKAali');
select upper('sagar Gorai');
select ucase('om namah shivay');
select ucase ('masakali');
select ascii('a');
select ascii('A');
select ascii('S');
select char(97);
select char(65);
select length(substr(concat ('sagar','chandra','gorai'),6,7));
select replace('sagarchandragorai','chandra','kumar');
select replace(concat('sagar',' chandra' ,' gorai'),' chand','kumar');

			-- 3. date functions
select sysdate();
select now();
select date(sysdate());
select time(sysdate());
select date();
select time();
select time(now());
select date(sysdate());
select date_format(sysdate(),'%d %m %y');
select date_format(sysdate(),'%D-%M-%Y');
select date_format(sysdate(),'%e %m %y');
select date_format(sysdate(),'%W- %D %M %Y');
select date_format(sysdate(),'%a- %D %M %Y');
select date_format(sysdate(),'%W- %D %b %Y');
select time_format(sysdate(),'%T');
select time_format(sysdate(),'%r');
select time_format(sysdate(),'%t');

			-- conversion functions
-- str_to_date ...to change date written in string format so that changes in formats can occurs

select str_to_date('august 15 2024','%D-%M-%Y');

create table hello(
id int,
hello date
);

select * from hello;
insert into hello values( 101,str_to_date('Auguat 15 2024','%D %M %Y'));

