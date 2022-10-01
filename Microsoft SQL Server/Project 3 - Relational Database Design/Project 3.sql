create database Project_3

use Project_3

create table role (id int primary key, role_name varchar(100))

create table status(id int primary key, status_name varchar(100), is_user_working bit)

create table user_account(
id int primary key
, user_name varchar(100)
, email varchar(254)
, password varchar(200)
, password_salt varchar(50) not null
, password_hash_algorithm varchar(50)
)

create table user_has_role(
id int primary key
, role_start_time timestamp
, role_end_time datetime not null
, user_account_id int foreign key references user_account(id)
, role_id int foreign key references role(id)
)
/* Assigning datetime datatype to role_end_time due to the error message:
A table can only have one timestamp column. Because table 'user_has_role' already has one, the column 'role_end_time' cannot be added.*/

create table user_has_status(
id int primary key
, status_start_time timestamp
, status_end_time datetime not null
, user_account_id int foreign key references user_account(id)
, status_id int foreign key references status(id)
)
/*Assigning datetime datatype to status_end_time due to the error message:
A table can only have one timestamp column. Because table 'user_has_status' already has one, the column 'status_end_time' cannot be added.*/


--1) Insert data into each of the above tables. With at least two rows in each of the table, make sure, that you have created respective foreign keys.
insert into role(id, role_name)
select 1, 'user1' union all
select 2, 'user2'

select * from role

insert into status(id, status_name, is_user_working)
select 1, 'new status', 1 union all
select 2, 'new status', 1

select * from status

insert into user_account(id, user_name, email, password, password_salt, password_hash_algorithm)
select 1, 'abc', 'abc@xyz.com', 'abc', 'abcs', 'abcpha' union all
select 2, 'def', 'def@xyz.com', 'def', 'defs', 'defpha'

select * from user_account

insert into user_has_role(id, role_end_time, user_account_id, role_id)
select 1, GETDATE()+0.1, 1, 1 union all
select 2, GETDATE()+0.2, 2, 2

select * from user_has_role

insert into user_has_status(id, status_end_time, user_account_id, status_id)
select 1, GETDATE()+0.1, 1, 1 union all
select 2, GETDATE()+0.2, 2, 2

select * from user_has_status


--2) Delete all the data from each of the tables.

truncate table user_has_status

alter table user_has_status drop constraint FK__user_has___statu__300424B4
truncate table status

alter table user_has_role drop constraint FK__user_has___role___2C3393D0
truncate table role

truncate table user_has_role

alter table user_has_status drop constraint FK__user_has___user___2F10007B
truncate table user_account

select * from role
select * from status
select * from user_account
select * from user_has_role
select * from user_has_role