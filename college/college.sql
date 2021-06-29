create table student ( usn varchar (10) primary key, sname varchar (25), address varchar (25), phone long, gender char(1)); 
create table semsec ( ssid varchar (5) primary key, sem int, sec char (1)); 
create table class ( usn varchar (10), ssid varchar (5), primary key (usn, ssid), foreign key (usn) references student (usn), foreign key (ssid) references semsec (ssid));
create table subject ( subcode varchar (8), title varchar (20), sem int, credits int, primary key (subcode)); 
create table iamarks ( usn varchar (10), subcode varchar (8), ssid varchar (5), test1 int, test2 int, test3 int, finalia int, primary key (usn, subcode, ssid), 
foreign key (usn) references student (usn), foreign key (subcode) references subject (subcode), foreign key (ssid) references semsec (ssid));

insert into student values ('1rn13cs020','akshay','belagavi', 8877881122,'m'); 
insert into student values ('1rn13cs062','sandhya','bengaluru', 7722829912,'f'); 
insert into student values ('1rn13cs091','teesha','bengaluru', 7712312312,'f'); 
insert into student values ('1rn13cs066','supriya','mangaluru', 8877881122,'f'); 
insert into student values ('1rn14cs010','abhay','bengaluru', 9900211201,'m'); 
insert into student values ('1rn14cs032','bhaskar','bengaluru', 9923211099,'m'); 
insert into student values ('1rn14cs025','asmi','bengaluru', 7894737377,'f'); 
insert into student values ('1rn15cs011','ajay','tumkur', 9845091341,'m');
insert into student values ('1rn15cs029','chitra','davangere', 7696772121,'f'); 
insert into student values ('1rn15cs045','jeeva','bellary', 9944850121,'m'); 
insert into student values ('1rn15cs091','santosh','mangaluru', 8812332201,'m'); 
insert into student values ('1rn16cs045','ismail','kalburgi', 9900232201,'m'); 
insert into student values ('1rn16cs088','sameera','shimoga', 9905542212,'f'); 
insert into student values ('1rn16cs122','vinayaka','chikamagalur', 8800880011,'m'); 

insert into semsec values ('cse8a', 8,'a'); 
insert into semsec values ('cse8b', 8,'b'); 
insert into semsec values ('cse8c', 8,'c'); 
insert into semsec values ('cse7a', 7,'a'); 
insert into semsec values ('cse7b', 7,'b'); 
insert into semsec values ('cse7c', 7,'c'); 
insert into semsec values ('cse6a', 6,'a'); 
insert into semsec values ('cse6b', 6,'b'); 
insert into semsec values ('cse6c', 6,'c'); 
insert into semsec values ('cse5a', 5,'a'); 
insert into semsec values ('cse5b', 5,'b'); 
insert into semsec values ('cse5c', 5,'c'); 
insert into semsec values ('cse4a', 4,'a'); 
insert into semsec values ('cse4b', 4,'b'); 
insert into semsec values ('cse4c', 4,'c'); 
insert into semsec values ('cse3a', 3,'a'); 
insert into semsec values ('cse3b', 3,'b'); 
insert into semsec values ('cse3c', 3,'c'); 
insert into semsec values ('cse2a', 2,'a'); 
insert into semsec values ('cse2b', 2,'b'); 
insert into semsec values ('cse2c', 2,'c'); 
insert into semsec values ('cse1a', 1,'a');
insert into semsec values ('cse1b', 1,'b'); 
insert into semsec values ('cse1c', 1,'c'); 

insert into class values ('1rn13cs020','cse8a'); 
insert into class values ('1rn13cs062','cse8a'); 
insert into class values ('1rn13cs066','cse8b'); 
insert into class values ('1rn13cs091','cse8c'); 
insert into class values ('1rn14cs010','cse7a'); 
insert into class values ('1rn14cs025','cse7a'); 
insert into class values ('1rn14cs032','cse7a'); 
insert into class values ('1rn15cs011','cse4a'); 
insert into class values ('1rn15cs029','cse4a'); 
insert into class values ('1rn15cs045','cse4b'); 
insert into class values ('1rn15cs091','cse4c'); 
insert into class values ('1rn16cs045','cse3a'); 
insert into class values ('1rn16cs088','cse3b'); 
insert into class values ('1rn16cs122','cse3c'); 

insert into subject values ('10cs81','aca', 8, 4); 
insert into subject values ('10cs82','ssm', 8, 4); 
insert into subject values ('10cs83','nm', 8, 4); 
insert into subject values ('10cs84','cc', 8, 4); 
insert into subject values ('10cs85','pw', 8, 4); 
insert into subject values ('10cs71','ooad', 7, 4); 
insert into subject values ('10cs72','ecs', 7, 4); 
insert into subject values ('10cs73','ptw', 7, 4); 
insert into subject values ('10cs74','dwdm', 7, 4); 
insert into subject values ('10cs75','java', 7, 4); 
insert into subject values ('10cs76','san', 7, 4); 
insert into subject values ('15cs51', 'me', 5, 4); 
insert into subject values ('15cs52','cn', 5, 4); 
insert into subject values ('15cs53','dbms', 5, 4); 
insert into subject values ('15cs54','atc', 5, 4); 
insert into subject values ('15cs55','java', 5, 3); 
insert into subject values ('15cs56','ai', 5, 3);
insert into subject values ('15cs41','m4', 4, 4); 
insert into subject values ('15cs42','se', 4, 4); 
insert into subject values ('15cs43','daa', 4, 4); 
insert into subject values ('15cs44','mpmc', 4, 4); 
insert into subject values ('15cs45','ooc', 4, 3); 
insert into subject values ('15cs46','dc', 4, 3); 
insert into subject values ('15cs31','m3', 3, 4); 
insert into subject values ('15cs32','ade', 3, 4); 
insert into subject values ('15cs33','dsa', 3, 4); 
insert into subject values ('15cs34','co', 3, 4); 
insert into subject values ('15cs35','usp', 3, 3); 
insert into subject values ('15cs36','dms', 3, 3); 

insert into iamarks values ('1rn13cs091','10cs81','cse8c', 15, 16, 18, 16); 
insert into iamarks values ('1rn13cs091','10cs82','cse8c', 12, 19, 14, 15); 
insert into iamarks values ('1rn13cs091','10cs83','cse8c', 19, 15, 20, 18); 
insert into iamarks values ('1rn13cs091','10cs84','cse8c', 20, 16, 19, 18); 
insert into iamarks values ('1rn13cs091','10cs85','cse8c', 15, 15, 12, 14);

select * from student;
select * from semsec;
select * from class;
select * from subject;
select * from iamarks;

select s.*, ss.sem, ss.sec from student s, semsec ss, class c where s.usn = c.usn and ss.ssid = c.ssid and ss.sem = 4 and ss.sec='c';

select ss.sem, ss.sec, s.gender, count(s.gender) as count from student s, semsec ss, class c where s.usn = c.usn and ss.ssid = c.ssid group by ss.sem, ss.sec, s.gender order by sem;

create view stu_test1_marks_view as select test1, subcode from iamarks where usn = '1rn13cs091';
select * from stu_test1_marks_view;

select s.usn,s.sname,s.address,s.phone,s.gender, 
(case
when ia.finalia between 17 and 20 then 'outstanding' 
when ia.finalia between 12 and 16 then 'average' 
else 'weak' 
end) 
