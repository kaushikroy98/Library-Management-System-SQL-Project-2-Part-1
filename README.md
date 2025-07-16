# Begginer-Library-Management-System-Projet2-Part1-using-PostgreSQL_&_MySQL_Workbench

# 📚 Library Management System (Beginner Level – Q1 to Q12)

Welcome to **Part 1** of my SQL-based **Library Management System Project**, focused on beginner-friendly database tasks using both **MySQL Workbench** and **PostgreSQL**. This section (Q1–Q12) covers fundamental SQL operations including database setup, data manipulation, CTAS, and simple analytical queries.

---

## 🗂️ Project Overview

- 🔰 **Level**: Beginner
- 🛠 **Tech Stack**: SQL, MySQL Workbench, PostgreSQL
- 🗃 **Database Name**: `project_2_library`
- 📌 **Scope**: Tasks 1–12 covering foundational SQL use cases
- 🎯 **Objective**: Learn and demonstrate key SQL operations in a real-world scenario

---

## 📁 File Structure

```sql
Library-Management-System-Beginner/
│
├── 📄 Schema.sql → Contains CREATE TABLE statements for all entities
├── 📄 insert_data.sql → Inserts sample data into tables (members, books, employees, etc.)
├── 📄 solution.sql → SQL solutions to Tasks 1–12
├── 📄 README.md → Project overview and task explanations (this file)
```


---

## Project Structure

##1. Database Setup

![ER Diagram]([https://github.com/your-username/Library-System-Management/blob/main/library_erd.png](https://github.com/kaushikroy98/Library-Management-System-SQL-Project-2-Part-1/blob/main/Library_ERD.png)) 

## 🧱 Database Schema

The schema consists of the following tables and relationships:

- **branch**: Branch details (ID, manager, address)
- **employees**: Library employees (FK to branch)
- **members**: Registered library members
- **books**: Book inventory and metadata
- **issued_status**: Issued book transactions (FK to books, members, employees)
- **return_status**: Returned book transactions (FK to issued_status)

![ER Diagram]([https://github.com/your-username/Library-System-Management/blob/main/library_erd.png](https://github.com/kaushikroy98/Library-Management-System-SQL-Project-2-Part-1/blob/main/Library_ERD.png)) 

---
## Database Creation




## ✅ Tasks Covered (Q1–Q12)

### 🔧 CRUD & Data Operations

1. **Create a New Book Record**  
   `INSERT INTO books (...) VALUES (...);`

2. **Update a Member's Address**  
   `UPDATE members SET member_address = '...' WHERE member_id = '...';`

3. **Delete an Issued Book Record**  
   `DELETE FROM issued_status WHERE issued_id = '...';`

4. **Retrieve Books Issued by a Specific Employee**  
   `SELECT * FROM issued_status WHERE issued_emp_id = '...';`

5. **List Employees Who Issued More Than One Book**  
   `GROUP BY` and `HAVING COUNT(*) > 1`

---

### 🏗️ CTAS (Create Table As Select)

6. **Create Book Issue Count Summary Table**  
   `CREATE TABLE book_counts AS SELECT ... GROUP BY ...;`

---

### 📊 Data Exploration & Insights

7. **List All Books in a Specific Category**  
   `SELECT book_title FROM books WHERE category = 'Fantasy';`

8. **Find Total Rental Income by Category**  
   Aggregate total income and count of issued books.

9. **List Members Registered in the Last 180 Days**  
   Used `INTERVAL` functions compatible with both PostgreSQL and MySQL.

10. **List Employees Along With Their Branch Manager and Branch Details**  
   Utilizes `JOIN` on `employees` and `branch`.

11. **Create a Table of Expensive Books (Price > 7.00)**  
   `CREATE TABLE ... AS SELECT ... WHERE rental_price > 7;`

12. **Retrieve List of Books Not Yet Returned**  
   `LEFT JOIN return_status` and check for `NULL` in return records.

---

## 💻 Technologies Used

- **MySQL Workbench** (for SQL scripting and testing)
- **PostgreSQL** (for syntax validation and compatibility)
- **SQL**: Joins, Group By, CRUD, CTAS, Date Filtering, Aggregates

---

## 📌 How to Use

1. Clone the repo  
   ```bash
   git clone https://github.com/your-username/Library-Management-System-Beginner.git
