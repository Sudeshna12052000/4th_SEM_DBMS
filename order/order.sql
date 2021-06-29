create database order_processsing;
use order_processsing;
create table salesman (salesman_id int, name varchar (20), city varchar (20), commission varchar (20), primary key (salesman_id));
create table customer (customer_id int, cust_name varchar (20), city varchar (20), grade int, salesman_id int, primary key (customer_id), foreign key(salesman_id) references salesman(salesman_id) 
on delete set null);
create table orders (ord_no int, purchase_amt real, ord_date date, customer_id int, salesman_id int, primary key (ord_no), foreign key (customer_id) references customer(customer_id)
 on delete cascade, foreign key(salesman_id) references salesman(salesman_id) on delete cascade);

insert into salesman values (1000, 'john','bangalore','25 %'); 
insert into salesman values (2000, 'ravi','bangalore','20 %'); 
insert into salesman values (3000, 'kumar','mysore','15 %'); 
insert into salesman values (4000, 'smith','delhi','30 %'); 
insert into salesman values (5000, 'harsha','hydrabad','15 %'); 

insert into customer values (10, 'preethi','bangalore', 100, 1000); 
insert into customer values (11, 'vivek','mangalore', 300, 1000); 
insert into customer values (12, 'bhaskar','chennai', 400, 2000); 
insert into customer values (13, 'chethan','bangalore', 200, 2000); 
insert into customer values (14, 'mamatha','bangalore', 400, 3000); 

insert into orders values (50, 5000, '04-05-17', 10, 1000); 
insert into orders values (51, 450, '20-01-17', 10, 2000);
insert into orders values (52, 1000, '24-02-17', 13, 2000); 
insert into orders values (53, 3500, '13-04-17', 14, 3000); 
insert into orders values (54, 550, '09-03-17', 12, 2000);

select * from salesman;
select * from customer;
select * from orders;

select grade, count(distinct customer_id) from customer group by grade having grade > (select avg(grade) from customer where city='bangalore');

select salesman_id, name from salesman a where 1 < (select count(*) from customer where salesman_id=a.salesman_id);

select salesman.salesman_id, name, cust_name, commission from salesman, customer where salesman.city = customer.city union 
select salesman_id, name, 'no match', commission from salesman where not city = any (select city from customer);

create view salesman_view as select b.ord_date, a.salesman_id, a.name from salesman a, orders b where a.salesman_id = b.salesman_id and b.purchase_amt=(select max(purchase_amt) from orders c where c.ord_date = b.ord_date);
select * from salesman_view;

delete from salesman where salesman_id=1000;
select * from salesman;
