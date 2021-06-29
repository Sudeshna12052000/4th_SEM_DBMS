create database book_dealerr;
use book_dealerr;
create table publisher (name varchar (20) primary key, phone long, address varchar (20)); 
create table book (book_id int primary key, title varchar (20), pub_year varchar (20), publisher_name varchar(20) , foreign key(publisher_name) references publisher(name) on delete cascade);
create table book_authors (author_name varchar (20), book_id int, foreign key(book_id) references book(book_id) on delete cascade, primary key (book_id, author_name)); 
create table library_branch (branch_id int primary key, branch_name varchar (50), address varchar (50)); 
create table book_copies (no_of_copies integer, book_id int, branch_id int, primary key (book_id, branch_id), foreign key(book_id) references book(book_id) on delete cascade, 
foreign key(branch_id) references library_branch(branch_id) on delete cascade); 
create table card(card_no int primary key); 
create table book_lending (date_out date, due_date date, book_id int, branch_id int, card_no int, primary key (book_id, branch_id, card_no), foreign key(book_id) references book(book_id) on delete cascade, 
foreign key(branch_id) references library_branch(branch_id) on delete cascade, foreign key(card_no) references card(card_no) on delete cascade );

insert into publisher values ('mcgraw-hill', 9989076587, 'bangalore'); 
insert into publisher values ('pearson', 9889076565, 'newdelhi'); 
insert into publisher values ('random house', 7455679345, 'hydrabad'); 
insert into publisher values ('hachette livre', 8970862340, 'chenai'); 
insert into publisher values ('grupo planeta', 7756120238, 'bangalore'); 


insert into book values (1,'dbms','jan-2017', 'mcgraw-hill'); 
insert into book values (2,'adbms','jun-2016', 'mcgraw-hill'); 
insert into book values (3,'cn','sep-2016', 'pearson'); 
insert into book values (4,'cg','sep-2015', 'grupo planeta'); 
insert into book values (5,'os','may-2016', 'pearson'); 

insert into book_authors values ('navathe', 1); 
insert into book_authors values ('navathe', 2); 
insert into book_authors values ('tanenbaum', 3); 
insert into book_authors values ('edward angel', 4); 
insert into book_authors values ('galvin', 5); 

insert into library_branch values (10,'rr nagar','bangalore'); 
insert into library_branch values (11,'rnsit','bangalore'); 
insert into library_branch values (12,'rajaji nagar', 'bangalore'); 
insert into library_branch values (13,'nitte','mangalore'); 
insert into library_branch values (14,'manipal','udupi'); 

insert into book_copies values (10, 1, 10); 
insert into book_copies values (5, 1, 11); 
insert into book_copies values (2, 2, 12); 
insert into book_copies values (5, 2, 13); 
insert into book_copies values (7, 3, 14); 
insert into book_copies values (1, 5, 10); 
insert into book_copies values (3, 4, 11); 

insert into card values (100); 
insert into card values (101); 
insert into card values (102); 
insert into card values (103); 
insert into card values (104);

insert into book_lending values ('17-01-01','17-06-01', 1, 10, 101); 
insert into book_lending values ('17-01-11','17-03-11', 3, 14, 101); 
insert into book_lending values ('17-02-21','17-04-21', 2, 13, 101); 
insert into book_lending values ('17-03-15','17-07-15', 4, 11, 101); 
insert into book_lending values ('17-04-12','17-05-12', 1, 11, 104); 

select * from publisher;
select * from book;
select * from book_authors;
select * from library_branch;
select * from book_copies;
select * from card;
select * from book_lending;

select card_no from book_lending where date_out between '17-01-01' and '17-07-01' group by card_no having count(*) > 3;

delete from book where book_id=3;
select * from book;

create view view_publication as select pub_year from book;
select * from view_publication;

create view view_books as select b.book_id, b.title, c.no_of_copies from book b, book_copies c, library_branch l where b.book_id=c.book_id and c.branch_id=l.branch_id;
select * from view_books;
