select * from books;
select * from branch;
select * from issued_status;
select * from return_status;
select * from employees;
select * from members;


-- Tasks

-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"


insert into books(isbn,book_title,category,rental_price,status,author,publisher)
values('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')



-- Task 2: Update an Existing Member's Address

update members
set member_address='125 Main St'
where member_id='C101'



-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.


delete from issued_status
where issued_id='IS121';


-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.


select * from issued_status
where issued_emp_id='E101';


-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.


select issued_emp_id from issued_status
group by 1
having count(*)>1 ;

-- ### 3. CTAS (Create Table As Select)

-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt


CREATE TABLE book_counts
as 
select b.isbn,b.book_title as book_name, count(*) book_issued_count from books b
join issued_status i
on b.isbn=i.issued_book_isbn
group by 1,2;

select * from  book_counts;

-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:


select distinct category from books;

select book_title from books
where category = 'Fantasy';



-- Task 8: Find Total Rental Income by Category:


select category, sum(b.rental_price) as total_rental_income,
count(*) issued_count from issued_status s
inner join books b
on s.issued_book_isbn = b.isbn
group by 1
order by total_rental_income desc;


-- Task 9. **List Members Who Registered in the Last 180 Days**:

-- Updating the date to fall in last 180 days as this data is old
update members
set reg_date='2025-05-29'
where member_id='C118'

update members
set reg_date='2025-06-21'
where member_id='C119'

select * from members;

-- This code works on postgre SQL
select member_name from members
where reg_date>=current_date - interval '180 days';

-- This code works on MySQL Workbench

select member_name from members
where reg_date>=date_sub(current_date(),  interval 180 day);


-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:

select e2.*,b.manager_id,e1.emp_name as Manager_name  from branch b
inner join employees e1 on b.manager_id=e1.emp_id
inner join employees e2 on b.branch_id=e2.branch_id;



-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold

create table book_price_greaterthan_7
AS
select book_title, rental_price from books
where rental_price>7;



-- Task 12: Retrieve the List of Books Not Yet Returned

select distinct i.issued_book_name from issued_status i
left join return_status r
on r.issued_id = i.issued_id
where return_date is null;
