-- creating database

create database itvedant;
use itvedant;
show databases;
drop database itvedant;
select database();

-- creating and deleting table

create database itvedant;
use itvedant;

create table sales(
order_id int,
seller_name varchar(255),
product varchar(255),
address char(50),
d_o_b date
);
drop table if exists sales;

show tables;

describe sales;

create table customer(
id int,
name varchar(200),
address varchar(40),
pan_card char(5),
mobile_no int
);
show tables;

drop tables sales;

-- ddl
-- creating and deleting databases
	create database google;
    show databases;
    select database();
    use google;
    select database();
    create database facebook;
    select database();
    drop database google;
    select database();
    
-- creating and deleting tables

create database vr;

use vr;
create table sales(
order_id int,
seller_name varchar(255),
product varchar(255),
price int,
quantity int,
address varchar(255),
pan_no char,
order_date date
);
drop table if exists customer;
select * from sales;
describe sales;
    

    -- constraints
    
create table customer(
cus_id int
);
    
    
 create table sales(
order_id int unique,
seller_name varchar(255) not null,
product varchar(255) default "na",
price int,
quantity int,
address varchar(255),
pan_no char,
order_date date
);   
    
    
  -- alter command
  
  create table if not exists student(
  id int not null unique primary key,
  name varchar(255)not null default "na",
  age int not null,
  class int not null
  );
  
  describe student;
  alter table student add column marks int;
  alter table student add column grade int;
  alter table student modify grade varchar(50);
  alter table student drop marks;
  alter table student drop grade;
  alter table student rename column name to full_name;  
  alter table student rename to teacher; 
  
  describe teacher;
    
insert into teacher
(id,full_name,age,class)
    values
(1,"mohit",18,12),
(2,"rohit",17,13);
  select * from teacher;   

-- distinct

select * from student; 


-- where clause

select * from student where class >10;
select * from student where age<=15;  
select * from student where name = "sam";
select * from student where id = 7;

-- Logical operaters
-- age,or,not,between,in,like

select * from student where class>=11 and age<18 and name = "jatin";
select * from student where class >=11 or age<18 or name = "rohit";
select * from studfent where not name = "shweta";
select * from student where age between 13 and 17;
select * from student where name = "rohit" or name = "jatin" or name = "aparna";
select * from student where name in ("rohit","jatin","aparna");

-- like
-- pattern
-- % wild card
-- _ underscore

select * from student where name like "a%";
select * from student where name like "%a";
select * from student where name like "%t_";
select * from student where name like "__a";
select * from student where name like "%ti%";

-- update and delete

select * from student;
update student set age = 20 where id = 2;
update student set age = 25, class = 10 where id = 4;
delete from student where id = 2;
set sql_safe_updates = 0;
update student set name = 'pooja';
select * from student;
delete from student;

-- TCL
-- rollback, savepoint, commit

start transaction;
select * from student;
update student set class = 12 where id = 3;
select * from student;
rollback;
select * from student;
begin;
select * from student;
delete from student;
select * from student;
rollback;

-- ageregate functions
-- min()
-- max()
-- count()
-- avg()

-- sql alises

select min(age) as minimum_age from student;
select max(age) as maximum_age from student;
select count(class) total from student;
select sum(age) from student;
select avg(age) as average_age from student;

-- update -- setsql_safe_updates =0;

-- tcl rollback,begin,commit

-- start transaction/begin

begin ;
select * from student;
savepoint ponit1;

update student set class = 15 where id = 3;
savepoint point2;

delete from student where id=2;
savepoint point3;

update student set age =45;
rollback to point2;

commit;  -- or rollback


-- group by

select * from student;
select class, count(*) from student group by class;
select class, count(*) as total from student group by class having total >=2;

-- joins

create database ll;
use ll;

create table marks (
id int not null,
subject varchar(255) not null,
marks int not null,
primary key (id,subject)
);

describe marks;

insert into marks
(id,subject,marks)
values
(1, "maths", 89),
(2, "english", 75),
(3, "maths", 91),
(4, "science", 97),
(5, "computer", 83),
(6, "english", 55);

create table student;

-- by default inner join

select name ,age,subject,class from student
join marks
on student.id = marks.id;

select name,age,subject,class from student
left join marks
on student.id = marks.id;

select name,age,subject,class from student
right join marks
on student.id = marks.id;

select name,age,subject,class from student
left join marks
on student.id = marks.id
union all
select name,age,subject,class from student
right join marks
on student.id = marks.id;

create database if not exists pp;
use pp;
CREATE TABLE if not exists Employees (
  Employee_ID INT,
  First_Name VARCHAR(50),
  Last_Name VARCHAR(50),
  Manager_ID int);
  
-- Insert sample data

INSERT INTO Employees (Employee_ID, First_Name, Last_Name, Manager_ID)
VALUES
  (1, 'John', 'Doe', NULL),   -- John Doe is the top-level manager (ManagerID is NULL)
  (2, 'Alice', 'Smith', 1),   -- Alice Smith reports to John Doe
  (3, 'Bob', 'Johnson', 1),    -- Bob Johnson also reports to John Doe
  (4, 'Charlie', 'Brown', 2), -- Charlie Brown reports to Alice Smith
  (5, 'David', 'Wilson', 3);   -- David Wilson reports to Bob Johnson

select * from employees;

-- inner join

select name
from Employee as a
join employee as b
on a.id = b.Manager_ID;

-- maths function

select pi() as result;
select pow(4,2);
select truncate(1.23456789);
select sqrt(49);
select exp(3);
select mod(10,3);

-- some date functions

select now();
select curdate();
select current_time();
select curtime();
select year(sysdate());
select month(now());
select date_format('2017-06-05' ,' %y');
select date_format('2017-06-05','%m %d %y');
select date_format('2017-06-05','%M %D %Y');
select datediff ('2010-12-30 ',2010-11-30) difference; 
select date_add(current_date(), interval 10 year);
select date_add(current_date(), interval 5 month);
select date_add(current_date(), interval 10 day);
select date_sub(current_date(), interval 10 year);

-- string
select concat("Hello", " "  ,"World");
select * from student;
select * ,concat(name, " " ,"Sharma") as final_name from student;
select * from student;
select name, length(name) from student;
select * from student;
select *, upper(name) from student;
select lower('DATA SCIENCE');
select substr('We are learning Mysql', 8, 8);
select left('fullstack', 6);
select right('fullstack', 3);
select trim('      rohit      ');
select replace("I am learning Mysql", "Mysql", "python");

-- case

select *,
case 
	when class = 8 then 'its eight'
    when class = 10 then 'its ten'
    when class = 11 then 'its eleven'
else 'its other class'
end as class_name
from student;

select *,
case 
	when age>=18 then "You are eligible for voting"
    when age<18 then "You are kid"
end as age_criteria
from student;

select *,
case 
	when age>=18 then "You are eligible for voting"
else "you are kid"
end as age_criteria
from student;

-- DCL
-- grant or revoke

create user "ravi@123" identified by "r@123";
show grants for "ravi@123";
grant select , update, delete on zoom5.* to "ravi@123";
show grants for "ravi@123";
revoke select, update on zoom5.* from "ravi@123";
show grants for "ravi@123";
drop user "ravi@123";
show grants for"ravi@123";

create database if not exists collage;
use collage;
create table student(
rollno int primary key,
name varchar (50),
marks int not null,
grade varchar(1),
city varchar(20)
);
select * from student;

insert into student
(rollno,name,marks,grade,city)
values
(101,"anil",78,"c","pune"),
(102,"bhumika",93,"a","mumbai"),
(103,"chetan",85,"b","mumbai"),
(104,"dhruv",96,"a","delhi"),
(105,"emanuel",12,"f","delhi"),
(106,"farah",82,"b","delhi");


select name,marks
from student where marks >(select avg(marks) from student);

select max(x.marks) from  (select * from student where city = "delhi") as x;

select min(marks) from (select * from student where city = "mumbai") as y;


# -- find out all those who are having age greater than aversge age

-- IMPORT EXPORT

create database dell; 
use dell;

select * from profit;


create database if not exists hp;
use hp;
CREATE TABLE Teams (
team_id INT PRIMARY KEY,
team_name VARCHAR(50) NOT NULL,
country VARCHAR(50),
captain_id INT
);
--------------------
INSERT INTO Teams (team_id, team_name, country, captain_id)
VALUES (1, 'Cloud9', 'USA', 1),
(2, 'Fnatic', 'Sweden', 2),
(3, 'SK Telecom T1', 'South Korea', 3),
(4, 'Team Liquid', 'USA', 4),
(5, 'G2 Esports', 'Spain', 5);
--------------------
CREATE TABLE Players (
player_id INT PRIMARY KEY,
player_name VARCHAR(50) NOT NULL,
team_id INT,
role VARCHAR(50),
salary INT,
FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);
--------------------
INSERT INTO Players (player_id, player_name, team_id, role, salary)
VALUES (1, 'Shroud', 1, 'Rifler', 100000),
(2, 'JW', 2, 'AWP', 90000),
(3, 'Faker', 3, 'Mid laner', 120000),
(4, 'Stewie2k', 4, 'Rifler', 95000),
(5, 'Perkz', 5, 'Mid laner', 110000),
(6, 'Castle09', 1, 'AWP', 120000),
(7, 'Pike', 2, 'Mid Laner', 70000),
(8, 'Daron', 3, 'Rifler', 125000),
(9, 'Felix', 4, 'Mid Laner', 95000),
(10, 'Stadz', 5, 'Rifler', 98000),
(11, 'KL34', 1, 'Mid Laner', 83000),
(12, 'ForceZ', 2, 'Rifler', 130000),
(13, 'Joker', 3, 'AWP', 128000),
(14, 'Hari', 4, 'AWP', 90000),
(15, 'Wringer', 5, 'Mid laner', 105000);
--------------------
CREATE TABLE Matches (
match_id INT PRIMARY KEY,
team1_id INT,
team2_id INT,
match_date DATE,
winner_id INT,
score_team1 INT,
score_team2 INT,
FOREIGN KEY (team1_id) REFERENCES Teams(team_id),
FOREIGN KEY (team2_id) REFERENCES Teams(team_id),
FOREIGN KEY (winner_id) REFERENCES Teams(team_id)
);
--------------------
CREATE TABLE Teams (
team_id INT PRIMARY KEY,
team_name VARCHAR(50) NOT NULL,
country VARCHAR(50),
captain_id INT
);
--------------------
INSERT INTO Teams (team_id, team_name, country, captain_id)
VALUES (1, 'Cloud9', 'USA', 1),
(2, 'Fnatic', 'Sweden', 2),
(3, 'SK Telecom T1', 'South Korea', 3),
(4, 'Team Liquid', 'USA', 4),
(5, 'G2 Esports', 'Spain', 5);
--------------------
CREATE TABLE Players (
player_id INT PRIMARY KEY,
player_name VARCHAR(50) NOT NULL,
team_id INT,
role VARCHAR(50),
salary INT,
FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);
--------------------
INSERT INTO Players (player_id, player_name, team_id, role, salary)
VALUES (1, 'Shroud', 1, 'Rifler', 100000),
(2, 'JW', 2, 'AWP', 90000),
(3, 'Faker', 3, 'Mid laner', 120000),
(4, 'Stewie2k', 4, 'Rifler', 95000),
(5, 'Perkz', 5, 'Mid laner', 110000),
(6, 'Castle09', 1, 'AWP', 120000),
(7, 'Pike', 2, 'Mid Laner', 70000),
(8, 'Daron', 3, 'Rifler', 125000),
(9, 'Felix', 4, 'Mid Laner', 95000),
(10, 'Stadz', 5, 'Rifler', 98000),
(11, 'KL34', 1, 'Mid Laner', 83000),
(12, 'ForceZ', 2, 'Rifler', 130000),
(13, 'Joker', 3, 'AWP', 128000),
(14, 'Hari', 4, 'AWP', 90000),
(15, 'Wringer', 5, 'Mid laner', 105000);
--------------------
CREATE TABLE Matches (
match_id INT PRIMARY KEY,
team1_id INT,
team2_id INT,
match_date DATE,
winner_id INT,
score_team1 INT,
score_team2 INT,
FOREIGN KEY (team1_id) REFERENCES Teams(team_id),
FOREIGN KEY (team2_id) REFERENCES Teams(team_id),
FOREIGN KEY (winner_id) REFERENCES Teams(team_id)
);
--------------------
INSERT INTO Matches (match_id, team1_id, team2_id, match_date, winner_id, score_team1, score_team2)
VALUES (1, 1, 2, '2022-01-01', 1, 16, 14),
(2, 3, 5, '2022-02-01', 3, 14, 9),
(3, 4, 1, '2022-03-01', 1, 17, 13),
(4, 2, 5, '2022-04-01', 5, 13, 12),
(5, 3, 4, '2022-05-01', 3, 16, 10),
(6, 1, 3, '2022-02-01', 3, 13, 17),
(7, 2, 4, '2022-03-01', 2, 12, 9),
(8, 5, 1, '2022-04-01', 1, 11, 15),
(9, 2, 3, '2022-05-01', 3, 9, 10);


--  1)	What are the names of the players whose salary is greater than 100,000? 
select player_name from players where salary >100000;

-- 2)	What is the team name of the player with player_id = 3
select team_name from teams where team_id in (select team_id from players where player_id=3);


-- 3)	What is the total number of players in each team?
select team_name,count(p.player_id) players_in_team from
players p join teams t
on p.team_id= t.team_id group by team_name;

-- 4)	What is the team name and captain name of the team with team_id = 2? 
select t.team_name,p.player_name as captain_name
from teams t join players p
on t.captain_id = p.player_id where t.team_id = 2;

-- 5)	What are the player names and their roles in the team with team_id = 1?
select player_name,role as role_in_team
from players p join
teams t
on t.team_id=p.team_id where t.team_id=1;

-- 6)	What are the team names and the number of matches they have won?
select team_name,count(winner_id) as No_of_wins
from teams t join matches m
on t.team_id=m.winner_id group by team_name;

-- 7) 	What is the average salary of players in the teams with country 'USA'
select avg(salary) Avg_Salary_USA_Player from players where team_id in (select team_id from teams where country = "USA");

-- 8)	Which team won the most matches?
select team_name
from teams t join matches m
on t.team_id=winner_id group by team_name having max(winner_id) limit 1;

-- 9)	What are the team names and the number of players in each team whose salary is greater than 100,000?
select t.team_name, count(p.player_id) as num_players from
teams t join players p
on t.team_id = p.team_id where p.salary > 100000 group by t.team_name;

-- 10)	What is the date and the score of the match with match_id = 3?
select match_date,concat(score_team1,"-",score_team2) as score from matches where match_id=3;


 
create database super;
use super;
create table if not exists employees(
employee_id int auto_increment primary key,
first_name varchar(50),
last_name varchar(50),
department varchar(50),
salary int 
);

insert into employees
(first_name,last_name,department,salary)
values
('john','doe','it',60000),
('jane','smith','hr',55000),
('bob','johanson','finance',70000),
('alice','williams','marketing',65000),
('charlie','brown','it',62000);
select * from employees;
 select department from employees;
select avg(salary) from employees;
update employees set last_name ="smith"; 

select max(salary) from employees;

select salary  from employees ;
 insert into employees 
 (first_name,last_name,department,salary)
 values 
 ('sushi','mathur','marketing_department',70000);
SELECT *
FROM employees
WHERE department = 'IT';

UPDATE employees
SET salary = 60000
WHERE last_name = 'Smith';

-- calculate the average salary of employess--
select avg(salary)
from employees;

select max(salary)
from employees
where department = 'Finance';

select first_name,last_name, salary
from employees
order by salary desc;

select count(department) from employees;

select department,salary from employees;

delete from employees where salary < 60000;

select first_name,last_name from employees where salary >(select avg(salary) from employees);