-- 1.Create a database schema for the online consulatation and therapy website.The database should contain following tables:
-- Doctor table
-- Appointment table
-- Patient table
-- Reviews table

-- creating online consultation and therapy website database
create database onlineconsulataion_therapywebsite;

-- Creating Doctor table
create table Doctor(
id int primary key not null,
name varchar(30) not null,
specialization varchar(20) not null
);
select * from Doctor;

-- Creating Appointments table
create table Appointments(
appointment_id int not null,
appointment_Date date not null,
appointment_fee int not null,
appointment_doctor_name varchar(30) not null,
patient_name varchar(30) not  null
);
 select * from Appointments;
 
 -- Creating Patient table
create table Patient(
patient_id int not null,
patient_name varchar(40) not null,
address varchar(40) not null,
phone_no int not null,
insurance_id int not null
);
select * from Patient;

-- Creating Reviews table
create table Reviews(
review varchar(60) not null,
rating int not null
);
select * from reviews;

-- 2.question
-- creating contact table
create table contact_table(
id int primary key not null,
email varchar(40) not null,
fname varchar(40) not null,
lname varchar(40) not null,
company Varchar(30) not null,
active_flag int not null,
opt_out int not null);
select * from contact_table; 

-- Inserting values in to conatact table
insert into contact_table values(123,'a@a.com','Kian','Seth','ABC',1,1),(133,'b@a.com','Neha','Seth','ABC',1,0),
(234,'c@c.com','Puru','Malik','CDF',0,0),(342,'d@d.com','Sid','Maan','TEG',1,0);

-- select all columns from the contact table where active flag is 1 
select * from contact_table where active_flag=1;

-- Deacvtivate contacts who are opted out
delete from contact_table where opt_out=0;

-- Delete all the contacts who have the company name as 'ABC'
delete  from contact_table where company="ABC"; 

-- Insert a new row with id as 658,name as 'mili',email as 'mili@gmail.com',the company as 'DGH',active flag as 1,opt_out flag as 1
insert into contact_table values(658,'milli@gmail.com','mili',' ','DGH',1,1);

-- Pull out the unique values of the company column
select distinct company from contact_table;
 
-- Update name as 'mili' to 'niti'
update contact_table set fname='niti' where id=658;


-- 3.question
-- Write a SQL query to find those customers with a grade less than 100.It should return cust_name,customer city,grade,salesman and salesman city.The result should be ordered by ascending customer_id  

-- Creating customer1 table
create table customer1(customer_id int primary key not null,
cust_name varchar(30) not null,
city varchar(30) not null,
grade int,
salesman_id int not null);

select * from customer1;

-- Creating salesman table
create table salesman(salesman_id int primary key not null,
name varchar(30) not null,
city varchar(30) not null,
commission float not null);

select * from salesman;
-- Inserting values in to customer1 table
insert into customer1 values(3002,'NICK','New york',100,5001),(3007,'Brad','New york',200,5001),(3005,'Graham','California',200,5002),
(3008,'Julian','London',300,5002),(3004,'Fabian','Paris',300,5006),(3009,'Geoff','Berlin',100,5003),(3003,'Jozy','Moscow',200,5007),
(3001,'Brad Guzan','London', null,5005);

-- Inserting values in to salesman table
insert into salesman values(5001,'James','New york',0.15),(5002,'Nail','Paris',0.13),(5005,'Pit','London',0.11),
(5006,'Mc','Paris',0.14),(5007,'Paul','Rome',0.13),(5003,'Lauson','San Jose',0.12);

-- Query
select customer1.cust_name,customer1.city,customer1.grade,
salesman.name as salesman,salesman.city from customer1
inner join salesman on customer1.salesman_id=salesman.salesman_id where customer1.grade<100 order by customer_id asc;
