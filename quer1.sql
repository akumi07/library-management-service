select *
FROM books;
select *
FROM branch;
select *
FROM employees;
select *
FROM issued_status;
select *
FROM members;
-- ### 2. CRUD Operations
-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
-- Task 2: Update an Existing Member's Address
-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.
-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.
-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.
-- ### 3. CTAS (Create Table As Select)
-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt
-- ### 4. Data Analysis & Findings
-- Task 7. **Retrieve All Books in a Specific Category:
-- Task 8: Find Total Rental Income by Category:
-- Task 9. **List Members Who Registered in the Last 180 Days**:
-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:
-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold
-- Task 12: Retrieve the List of Books Not Yet Returned
/*
 
 
 INSERT INTO books(isbn,
 book_title ,
 category ,
 rental_price ,
 status ,
 author ,
 publisher)
 VALUES( '978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')
 
 select * from books
 
 select * from members
 
 update members
 set member_address="Kanpur"
 where member_id='C101'
 
 select * from members
 
 
 Delete from issued_status
 where issued_id = 'IS104' 
 
 select * from issued_status
 
 select* from books
 
 
 select * from issued_status
 where issued_emp_id='E107'
 
 
 select issued_book_name
 from issued_status
 where issued_emp_id='E101'
 
 select issued_emp_id,
 Count(issued_book_name) As issue_count
 
 from issued_status
 
 Group by issued_emp_id
 HAVING Count(issued_book_name)>1
 
 
 
 Select * from books
 
 CREATE TABLE Summary AS
 SELECT book_title
 FROM books b
 Join 
 issued_status ist
 On ist.issued_book_isbn=b.isbn
 WHERE conditions;
 
 Create table Summary AS
 SELECT b.isbn,
 b.book_title,
 Count(ist.issued_book_isbn) AS total_no_issue
 FROM books as b
 Join 
 issued_status as ist
 On ist.issued_book_isbn=b.isbn
 Group By b.isbn,b.book_title
 
 select *  from Summary  
 
 
 select* from books


 select b.category , SUM(b.rental_price)
 from books as b
 join issued_status as ist
 on ist.issued_book_isbn=b.isbn
 GROUP By (b.category)


 