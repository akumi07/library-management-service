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

create table books (
    isbn,
    book_title,
	category,
	rental_price,
	status,
	author,
	publisher

)

