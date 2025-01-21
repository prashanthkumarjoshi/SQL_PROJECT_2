----Library Management System Project_2-----
---creating the branch table---

DROP TABLE IF EXISTS branch;

CREATE TABLE branch (
    branch_id VARCHAR(10) PRIMARY KEY,
    manager_id VARCHAR(10),
    branch_address VARCHAR(55),
    contact_no VARCHAR(11)
);

----Modiffying branch table  for contact number varchar (15)-----
ALTER TABLE branch
ALTER COLUMN contact_no type VARCHAR(20);

--- creting  employees table---
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
	emp_id VARCHAR(10) PRIMARY KEY,
	emp_name VARCHAR(55),
	POSITION VARCHAR(15),
	salary FLOAT,
	branch_id VARCHAR(10)
);


---creating Books table---
DROP TABLE IF EXISTS books;

CREATE TABLE books (
	isbn VARCHAR(20) PRIMARY KEY,
	book_title VARCHAR(75),
	category VARCHAR(15),
	rental_price FLOAT,
	status_author VARCHAR(55),
	publisher VARCHAR(55)
);
---Modiifying books table setting category value to (20) ----
ALTER TABLE books
ALTER COLUMN category type VARCHAR(20);

---modifying and Renaming column naeme author_status to 'status'
ALTER TABLE books
RENAME COLUMN status_author TO status;
---Adding New column author name to books table--
ALTER TABLE books
ADD COLUMN author VARCHAR(55);
---creating memebers table---
DROP TABLE IF EXISTS members;

CREATE TABLE members (
	member_id VARCHAR(10) PRIMARY KEY,
	member_name VARCHAR(55),
	member_address VARCHAR(75),
	reg_date date
);

--creating  issuesd status table---
DROP TABLE IF EXISTS issued_status;

CREATE TABLE issued_status (
	issued_id VARCHAR(15) PRIMARY KEY,
	issued_member_id VARCHAR(10),
	issued_book_name VARCHAR(75),
	issued_date Date,
	issued_book_isbn VARCHAR(25),
	issued_emp_id VARCHAR(10)
);

--craating returned status table---
DROP TABLE IF EXISTS return_status;

CREATE TABLE return_status (
	return_id VARCHAR(15) PRIMARY KEY,
	issued_id VARCHAR(15),
	return_book_name VARCHAR(75),
	return_date date,
	return_book_isbn VARCHAR(35)
);

---Foregin Key constraint----

ALTER TABLE issued_status
ADD CONSTRAINT fk_members FOREIGN key (issued_member_id) REFERENCES members (member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books FOREIGN key (issued_book_isbn) REFERENCES books (isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees FOREIGN key (issued_emp_id) REFERENCES employees (emp_id);

ALTER TABLE employees
ADD CONSTRAINT fk_branch FOREIGN key (branch_id) REFERENCES branch (branch_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_staus FOREIGN key (issued_id) REFERENCES issued_status (issued_id);

