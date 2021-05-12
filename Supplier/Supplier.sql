create database supplierdb;
use supplierdb;

create table SUPPLIERS(sid number(5) primary key, sname varchar(20), city varchar(20));

desc SUPPLIERS;

create table PARTS(pid number(5) primary key, pname varchar(20), color varchar(10));

desc PARTS;

create table CATALOG(sid number(5), pid number(5),  foreign key(sid) references SUPPLIERS(sid), foreign key(pid) references PARTS(pid), cost float(6), primary key(sid, pid));

desc CATALOG;

insert into suppliers values(&sid, '&sname','&city');

select * from SUPPLIERS;

commit;

insert into PARTS values(&pid, '&pname','&color');

select * from PARTS;

commit;

insert into CATALOG values(&sid, '&pid','&cost');

select * from CATALOG;

SELECT DISTINCT P.pname
  2  FROM Parts P, Catalog C
  3  WHERE P.pid = C.pid;

SELECT S.sname
  2  FROM Suppliers S
  3  WHERE NOT EXISTS ((SELECT P.pid  FROM Parts P)
  4          MINUS (SELECT C.pid FROM Catalog C
  5          WHERE C.sid = S.sid));

SELECT S.sname
FROM Suppliers S
WHERE NOT EXISTS (( SELECT P.pid
FROM Parts P
WHERE P.color = ‘Red’ )
			MINUS
			( SELECT C.pid
			FROM Catalog C, Parts P
			WHERE C.sid = S.sid AND
			C.pid = P.pid AND P.color = ‘Red’ ));



select pname from parts where pid in (select pid from catalog where sid =)


SELECT DISTINCT C.sid FROM Catalog C
  2  WHERE C.cost > ( SELECT AVG (C1.cost)
  3  FROM Catalog C1
  4  WHERE C1.pid = C.pid );

SELECT P.pid, S.sname
FROM Parts P, Suppliers S, Catalog C
WHERE C.pid = P.pid
AND C.sid = S.sid
AND C.cost = (SELECT MAX (C1.cost)
		FROM Catalog C1
		WHERE C1.pid = P.pid);

