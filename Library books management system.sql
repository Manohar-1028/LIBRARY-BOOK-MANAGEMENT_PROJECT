create database LBMS;
use lbms;
CREATE TABLE students
(student_id int primary key,
name varchar(30) not null,
email varchar(40) not null unique,
department varchar(50),
gender varchar(10) default'm');
select*from students;
create table books(
book_id int primary key,
title varchar(50) not null,
author varchar(50) not null);
select*from books;
alter table books add (category varchar(50), available_copies varchar(100));
create table librarians(
librarian_id int primary key,
name varchar(20) not null,
experience_years int);
select*from librarians;
create table borrow(
borrow_id int primary key,
student_id int,foreign key (student_id) references students(student_id),
book_id int,foreign key (book_id) references books(book_id),
librarian_id int,foreign key (librarian_id) references librarians (librarian_id),
borrow_date varchar(50),
return_date varchar(100));
select*from borrow;
insert into students values
(01,'balaji','balaji1456@gamil .com','cse','m'),
(02,'sivaji','sivajii1756@gamil .com','bcom','m'),
(03,'nivas','nivas6969@gamil .com','cs','m'),
(04,'anbu','anbu7868@gamil .com','eco','m');
select*from students;
insert into books values(001,'it starts with us','hooven','romance','5'),
(002,'it end with us','justin','fiction','7'),
(003,'sunset','xavier','life','10'),
(004,'door of the night','frank','thriller','14');
select*from books;
insert into librarians values(77,'bala',5),(88,'samy',7),(99,'raja',6),(90,'murugan',2),(23,'ram',8);
select*from librarians;
insert into borrow values
(215,01,001,77,2025-10-10,'2025-08-17'),
(216,02,002,88,2025-10-10,'2025-07-10'),
(217,03,003,99,2025-10-10,'2025-08-10'),
(218,04,004,90,2025-10-10,'2025-07-30'),
(219,04,004,77,2025-10-10,'2025-07-30'),
(220,03,001,88,2025-10-10,'2025-07-30'),
(221,02,001,99,2025-10-10,'2025-07-30'),
(222,01,001,90,2025-10-10,'2025-07-30');
select*from borrow;
select student_id,count(book_id)from borrow group by student_id;
select librarian_id,count(borrow_id)from borrow group by librarian_id;
select student_id,book_id from borrow;
update books set available_copies=8 where book_id=001;
delete from borrow where borrow_id=215;
select*from students;
select borrow.student_id,books.title
from borrow
join books on borrow.book_id=books.book_id;
select borrow.borrow_id,borrow.book_id,librarians.name 
from borrow 
join librarians on borrow.librarian_id=librarians.librarian_id;
select*from borrow
 join students
 on borrow.student_id=students.student_id where students.student_id=01;
select student_id,count(book_id) as total_books_borrowed from borrow group by student_id;
 select books.title,count(borrow.book_id) 
 from borrow 
 join books on books.book_id=borrow.book_id
 group by books.title order by max(borrow.book_id);
select avg(experience_years) from librarians;
select count(student_id) from students;
select min(borrow_date),max(borrow_date),books.title 
from borrow 
join books on books.book_id=borrow.book_id 
where books.book_id=002;

