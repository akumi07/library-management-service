Drop table if EXISTS branch
create table branch
(
    branch_id VARCHAR(10) Primary Key,
    manager_id VARCHAR(10),
    branch_address VARCHAR(70),
    contact_no VARCHAR(15)
) 
-- drop table branch

INSERT INTO branch(branch_id, manager_id, branch_address, contact_no) 
VALUES
('B001', 'E109', '123 Main St', '+919099988676'),
('B002', 'E109', '456 Elm St', '+919099988677'),
('B003', 'E109', '789 Oak St', '+919099988678'),
('B004', 'E110', '567 Pine St', '+919099988679'),
('B005', 'E110', '890 Maple St', '+919099988680');

select * from branch

Drop table if EXISTS employees
create table employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(30),	
    position VARCHAR(20),
    salary INT,
    branch_id VARCHAR(10)

)

select * from employees

drop table if EXISTS books

create table books (
    isbn VARCHAR(17) PRIMARY KEY,
    book_title VARCHAR(75),
	category VARCHAR(10),
	rental_price FLOAT,
	status VARCHAR(10),
	author VARCHAR(35),
	publisher VARCHAR(55)

)

select * from books

create table issued_status(
    issued_id	VARCHAR(5) PRIMARY KEY,
    issued_member_id VARCHAR(4),	
    issued_book_name VARCHAR(35),
    issued_date	DATE,
    issued_book_isbn VARCHAR(25),	
    issued_emp_id VARCHAR(10)

)

select * from issued_status


create table members(
    member_id VARCHAR(10),	
    member_name VARCHAR(25)	,
    member_address VARCHAR(75),	
    reg_date DATE

)

ALTER TABLE members
ADD PRIMARY KEY (member_id);


create table return_status(
    return_id VARCHAR(10) PRIMARY KEY,	
    issued_id VARCHAR(10),	
    return_book_name VARCHAR(75),	
    return_date	DATE,
    return_book_isbn VARCHAR(20)

)

ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);


SELECT issued_book_isbn
FROM issued_status
WHERE issued_book_isbn NOT IN (
    SELECT isbn FROM books
);

DELETE FROM issued_status
WHERE issued_book_isbn NOT IN (
    SELECT isbn FROM books
);


ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES  branch(branch_id);


select issued_id from return_status
where issued_id NOT IN (SELECT issued_id from issued_status)

DELETE FROM return_status
WHERE issued_id NOT IN (
    SELECT issued_id FROM issued_status
);


ALTER TABLE return_status
ADD CONSTRAINT fk_issued_id
FOREIGN KEY (issued_id)
REFERENCES issued_status (issued_id);


