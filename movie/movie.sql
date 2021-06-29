
create database m_movie;
use m_movie;
create table actor ( act_id int, act_name varchar (20), act_gender char(1), primary key (act_id)); 
create table director ( dir_id int, dir_name varchar (20), dir_phone long, primary key (dir_id)); 
create table movies ( mov_id int, mov_title varchar (25), mov_year int, mov_lang varchar (12), dir_id int, primary key (mov_id), foreign key (dir_id) references director (dir_id));
create table movie_cast ( act_id int, mov_id int, role varchar (10), primary key (act_id, mov_id), foreign key (act_id) references actor (act_id), foreign key (mov_id) references movies (mov_id)); 
create table rating ( mov_id int, rev_stars varchar (25), primary key (mov_id), foreign key (mov_id) references movies (mov_id));

insert into actor values (301,'anushka','f'); 
insert into actor values (302,'prabhas','m'); 
insert into actor values (303,'punith','m'); 
insert into actor values (304,'jermy','m'); 

insert into director values (60,'rajamouli', 8751611001); 
insert into director values (61,'hitchcock', 7766138911); 
insert into director values (62,'faran', 9986776531); 
insert into director values (63,'steven spielberg', 8989776530); 

insert into movies values (1001,'bahubali-2', 2017, 'telagu', 60); 
insert into movies values (1002,'bahubali-1', 2015, 'telagu', 60); 
insert into movies values (1003,'akash', 2008, 'kannada', 61); 
insert into movies values (1004,'war horse', 2011, 'english', 63); 

insert into movie_cast values (301, 1002, 'heroine'); 
insert into movie_cast values (301, 1001, 'heroine'); 
insert into movie_cast values (303, 1003, 'hero'); 
insert into movie_cast values (303, 1002, 'guest'); 
insert into movie_cast values (304, 1004, 'hero'); 

insert into rating values (1001, 4); 
insert into rating values (1002, 2);
insert into rating values (1003, 5); 
insert into rating values (1004, 4);

select * from actor;
select * from director;
select * from movies;
select * from movie_cast;
select * from rating;

select mov_title from movies where dir_id in (select dir_id from director where dir_name = 'hitchcock');

select mov_title from movies m, movie_cast mv where m.mov_id=mv.mov_id and act_id in (select act_id from movie_cast group by act_id having count(act_id) > 1) group by mov_title having count(*)>1;

select a.act_name, c.mov_title, c.mov_year from actor a, movie_cast b, movies c where a.act_id=b.act_id and b.mov_id=c.mov_id and c.mov_year not between 2000 and 2015;

select mov_title, max(rev_stars) from movies inner join rating using(mov_id) group by mov_title having max(rev_stars) > 0 order by mov_title;

update rating set rev_stars=5 where mov_id in (select mov_id from movies where dir_id in (select dir_id from director where dir_name = 'steven spielberg'));
