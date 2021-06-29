create database Stud_Enrollment;

use Stud_Enrollment;
create table student(regno varchar(30) primary key, name varchar(30), major varchar(30), bdate date);
create table course(courseno int primary key, cname varchar(30), dept varchar(30));
create table enroll(regno varchar(30), courseno int, sem int, marks int,primary key(regno,courseno), foreign key(regno) references student(regno), foreign key(courseno) references course(courseno));
create table text(book_isbn int,book_title varchar(20),publisher varchar(20),author varchar(20),primary key (book_isbn));
create table book_adoption(courseno int,sem int,book_isbn int,primary key (courseno,book_isbn),foreign key (courseno) references course (courseno),foreign key (book_isbn) references text(book_isbn));

insert into student values ('1pe11cs001', 'a', 'jr' , '19930912'),
('1pe11cs002','b','sr','19930924'),
('1pe11cs003','c','sr','19931127'),
('1pe11cs004','d','sr','19930413'),
('1pe11cs005','e','jr','19940824');

insert into course values (111,'os','cse'),
(112,'ec','ece'),
(113,'ss','ise'),
(114,'dbms','cse'),
(115,'signals','ece');

insert into text values (10,'database systems','pearson','schield'),
(900,'operating sys','pearson','leland'),
(901,'circuits','hall india','bob'),
(902,'system software','peterson','jacob'),
(903,'scheduling','pearson','patil'),
(904,'database systems','pearson','jacob'),
(905,'database manager','pearson','bob'),
(906,'signals','hall india','sumit');

insert into enroll values ('1pe11cs001',115,3,100),
('1pe11cs002',114,5,100),
('1pe11cs003',113,5,100),
('1pe11cs004',111,5,100),
('1pe11cs005',112,3,100);

insert into book_adoption values (111,5,900),
(111,5,903),
(111,5,904),
(112,3,901),
(113,3,10),
(114,5,905),
(113,5,902),
(115,3,906);

select * from student;
select * from course;
select * from text;
select * from enroll;
select * from book_adoption;

select c.courseno,t.book_isbn,t.book_title from course c, book_adoption ba, text t where c.courseno=ba.courseno and ba.book_isbn=t.book_isbn and c.dept='cse' and 
2 < (select count(book_isbn)from book_adoption b where c.courseno = b.courseno) order by t.book_title;

select distinct c.dept from course c where c.dept in ( select c.dept from course c,book_adoption b,text t where c.courseno=b.courseno and t.book_isbn=b.book_isbn and t.publisher='pearson') 
and c.dept not in (select c.dept from course c,book_adoption b,text t where c.courseno=b.courseno and t.book_isbn=b.book_isbn and t.publisher != 'pearson');
