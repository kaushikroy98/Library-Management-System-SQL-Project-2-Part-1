-- Library management system Project 2

-- DROP DATABASE IF EXISTS project_2_library;

CREATE DATABASE project_2_library;

-- Creating tables
drop table if exists branch;
CREATE TABLE branch (
    branch_id VARCHAR(20) PRIMARY KEY,
    manager_id VARCHAR(20),
    branch_address VARCHAR(100),
    contact_no VARCHAR(100)
);

drop table if exists employees;
CREATE TABLE employees (
    emp_id VARCHAR(20) PRIMARY KEY,
    emp_name VARCHAR(50),
    position VARCHAR(50),
    salary INT,
    branch_id VARCHAR(20) --FK
);

drop table if exists books;
CREATE TABLE books (
    isbn VARCHAR(50) PRIMARY KEY,
    book_title VARCHAR(100),
    category VARCHAR(20),
    rental_price FLOAT,
    status VARCHAR(15),
    author VARCHAR(50),
    publisher VARCHAR(60)
);

drop table if exists members;
create table members(
member_id varchar(10) primary key,
member_name varchar(30),
member_address varchar(50),
reg_date date
);

drop table if exists issued_status;
create table issued_status(
issued_id varchar(10) primary key,
issued_member_id varchar(10), -- FK
issued_book_name varchar(100),
issued_date date,
issued_book_isbn varchar(50), --FK
issued_emp_id varchar(10) --FK
);

drop table if exists return_status;
create table return_status(
return_id varchar(10) primary key,
issued_id varchar(10),
return_book_name varchar(10),
return_date date,
return_book_isbn varchar(50)
)


-- FOREIGN KEY

alter TABLE issued_status
add constraint fk_members
FOREIGN key (issued_member_id) 
REFERENCES members(member_id);


alter TABLE issued_status
add constraint fk_books
FOREIGN key (issued_book_isbn) 
REFERENCES books(isbn);


alter TABLE issued_status
add constraint fk_employees
FOREIGN key (issued_emp_id) 
REFERENCES employees(emp_id);

alter TABLE employees
add constraint fk_branch
FOREIGN key (branch_id) 
REFERENCES branch(branch_id);


alter TABLE return_status
add constraint fk_issued_status
FOREIGN key (issued_id) 
REFERENCES issued_status(issued_id);






