create database supplier;
use supplier;
create table suppliers(
	sid int primary key,
    sname varchar(30),
    address varchar(30)
);
create table parts(
	pid int primary key,
    pname varchar(30),
    color varchar(30)
);
create table catalog (
	sid int ,
    pid int ,
    cost real,
    constraint c_sid foreign key(sid) references suppliers(sid) ,
    constraint c_pid foreign key(pid) references parts(pid)
);
insert into suppliers values(1,'Acme Widget','kolkata') ;
insert into suppliers values(2,'Tata','bengaluru') ;
insert into suppliers values(3,'Reebok','delhi') ;
insert into suppliers values(4,'Nike','delhi') ;
insert into suppliers values(5,'Reliance','delhi') ;


insert into parts values(1,'paint','red') ;
insert into parts values(2,'steel','black') ;
insert into parts values(3,'spray','red') ;
insert into parts values(4,'sheet','green');
insert into parts values(5,'tiles','blue');
delete from parts where pid=5;

insert into catalog values(1,1,100);
insert into catalog values(1,2,200);
insert into catalog values(1,3,200);
insert into catalog values(1,4,100);
insert into catalog values(2,1,300);
insert into catalog values(2,2,100);
insert into catalog values(3,2,90);
insert into catalog values(3,3,110);
insert into catalog values(3,4,110);
insert into catalog values(4,1,100);
insert into catalog values(4,3,120);
insert into catalog values(4,4,130);

select * from catalog;
select * from parts;

--      i. Find the pnames of parts for which there is some supplier.
insert into parts values(5,'tiles','blue');
select p.pname from parts p where p.pid in (select pid from catalog c group by c.pid having count(c.sid)>0);
insert into catalog values(1,5,140);
select p.pname from parts p where p.pid in (select pid from catalog c group by c.pid having count(c.sid)>0);
delete from catalog where pid=5;
delete from parts where pid=5;

-- ii. Find the snames of suppliers who supply every part. 
select s.sname from suppliers s where s.sid in (select c.sid from catalog c group by c.sid having count(distinct (c.pid))=(select count(p.pid) from parts p));

-- iii. Find the snames of suppliers who supply every red part.
select s.sname from suppliers s where s.sid in (select ca.sid  from catalog ca,parts p where ca.pid=p.pid and p.color='red' group by ca.sid having count(ca.pid)=(select count(*) from parts p where p.color='red'));

-- iv. Find the pnames of parts supplied by Acme Widget Suppliers and by no one else.
select ca.pid from catalog ca  where ca.sid=(select s.sid from suppliers s where s.sname ='Acme Widget') having (select count(c.pid) from catalog c where c.pid=ca.pid)=1;

-- v. Find the sids of suppliers who charge more for some part than the average cost of that part (averaged over
-- all the suppliers who supply that part).
select distinct c.sid,c.pid from catalog c where c.cost > (select avg(ca.cost) from catalog ca where ca.pid=c.pid);

-- vi. For each part, find the sname of the supplier who charges the most for that part.
select s.sname from suppliers s where s.sid in (select c.sid from catalog c where c.cost=(select max(cost) from catalog ca where ca.pid=c.pid));

-- vii. select supplier who sell only red parts 
select s.sname from suppliers s where s.sid in(select c.sid from catalog c where c.sid not in (select distinct(ca.sid) from catalog ca,parts p where ca.pid=p.pid and p.color!='red'));
insert into catalog values(5,1,140); 
select s.sname from suppliers s where s.sid in(select c.sid from catalog c where c.sid not in (select distinct(ca.sid) from catalog ca,parts p where ca.pid=p.pid and p.color!='red'));
delete from catalog where sid=5;
