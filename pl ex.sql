show tables;
insert into jlcstudents (sid,sname,email,feepaid,m1,m2,m3) VALUES (101,'SAGAR','sa@gmail',20000,80,90,70); 
insert into jlcstudents (sid,sname,email,feepaid,m1,m2,m3) VALUES (102,'SAMAR','sm@yahoo',15000,70,65,85);
insert into jlcstudents (sid,sname,email,feepaid,m1,m2,m3) VALUES (103,'AMAR','am@yahoo',15000,70,80,85);
insert into jlcstudents (sid,sname,email,feepaid,m1,m2,m3) VALUES (104,'vishal','vs@gmail',10000,60,65,50);
insert into jlcstudents (sid,sname,email,feepaid,m1,m2,m3) VALUES (105,'Sumit','st@gmail',5000,30,65,55);
select * from jlcstudents;

delimiter ##
create procedure findBalance(IN mysid int,OUT mybal int)
begin
declare tfee double;
declare fpaid double;

select totalfee,feepaid into tfee,fpaid from jlcstudents where sid=mysid;
set mybal= tfee-fpaid;
end;
## delimiter ;

delimiter ##
create procedure findGrade(IN mysid int)
begin
declare mm1 int;
declare mm2 int;
declare mm3 int;
declare mytotal int;
declare myaverage double;
declare mygrade char;
declare mystatus char;

select m1,m2,m3 into mm1,mm2,mm3 from jlcstudents where sid=mysid;
set mytotal=mm1+mm2+mm3;
set myaverage=mytotal/3;

if myaverage>=70 then
set mystatus='Passed';
else 
set mystatus='Failed';
end if;

if myaverage>=90 then
set mygrade='A';
elseif myaverage>=80 then
set mygrade='B';
else 
set mygrade='C';
end if;
set mygrade=trim(mygrade);

update jlcstudents set total=mytotal,average=myaverage,status=mystatus,grade=mygrade where sid=mysid;

end;
## delimiter ;

delimiter ##
create procedure findMyGrade (IN mysid int,OUT mytotal int,OUT myaverage double,OUT mystatus char,OUT mygrade char)
begin
declare mm1 int;
declare mm2 int;
declare mm3 int;

select m1,m2,m3 into mm1,mm2,mm3 from jlcstudents;
set mytotal=mm1+mm2+mm3;
set myaverage=mytotal/3;

if myaverage>=70 then
set mystatus='PASSED';
else
set mystatus='FAILED';
end if;

if myaverage>=90 then 
set mygrade='A';
elseif myaverage>=80 then
set mygrade='B';
else
set mygrade='C';
end if;
set mygrade=trim(mygrade);

update jlcstudents set total=mytotal,average=myaverage,status=mystatus,grade=mygrade where sid=mysid;
 
end;
## delimiter ;

select * from jlcstudents;

delimiter ##
create procedure findGrade1(IN mysid int)
begin
declare mm1 int;
declare mm2 int;
declare mm3 int;
declare mytotal int;
declare myaverage double;
declare mygrade char;
declare mystatus char;

select m1,m2,m3 into mm1,mm2,mm3 from jlcstudents where sid=mysid;
set mytotal=mm1+mm2+mm3;
set myaverage=mytotal/3;

if myaverage>=70 then
set mystatus='Pass';
else 
set mystatus='Fail';
end if;

if myaverage>=90 then
set mygrade='A';
elseif myaverage>=80 then
set mygrade='B';
else 
set mygrade='C';
end if;
set mygrade=trim(mygrade);

update jlcstudents set total=mytotal,average=myaverage,status=mystatus,grade=mygrade where sid=mysid;

end;
## delimiter ;
delimiter ##