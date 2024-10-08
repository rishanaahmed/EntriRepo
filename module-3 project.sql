CREATE DATABASE Library;
USE Library;

CREATE TABLE Branch (
Branch_no INT PRIMARY KEY,
Manager_id INT,
Branch_address VARCHAR(200),
Contact_no VARCHAR(10)
);
INSERT INTO Branch VALUES
(1, 101, 'aroor, kozhikode', '1234567890'),
(2, 102, 'kallara, kottayam', '2345678901'),
(3, 103, 'mepayyur, kollam', '3456789012'),
(4, 104, 'panoor, kannur', '4567890123'),
(5, 105, 'vadakara, kozhikode', '5678901234'),
(6, 106, 'pulloor, kottayam', '6789012345'),
(7, 107, 'kovalam, kollam', '7890123456'),
(8, 108, 'Cherry St, kottayam', '8901234567'),
(9, 109, 'kummanam, kannur', '9012345678'),
(10, 110, 'aluva, idukki', '0123456789');

CREATE TABLE Employee (
Emp_id INT PRIMARY KEY,
Emp_name VARCHAR(20),
Position VARCHAR(20),
Salary BIGINT,
Branch_no INT,
FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee VALUES
(201, 'ashraf', 'manager', 50000, 4),
(202, 'baskar', 'librarian', 55000, 5),
(203, 'mohanan', 'clerk', 30000, 4),
(204, 'kamala', 'assistant', 25000, 4),
(205, 'maya', 'librarian', 40000, 8),
(206, 'malathi', 'assistant',30000, 4),
(207, 'jayan', 'manager', 60000, 10),
(208, 'ram', 'librarian', 40000, 4),
(209, 'arun', 'manager', 50000, 6),
(210, 'rahul', 'assistant', 45000, 4)
;

CREATE TABLE Books (
ISBN VARCHAR(20) PRIMARY KEY,
Book_Title VARCHAR(25),
Category VARCHAR(25),
Rental_Price INT,
Status VARCHAR(3) CHECK (Status IN ('yes', 'no')),
Author VARCHAR(25),
Publisher VARCHAR(20)
);


desc books;
INSERT INTO Books VALUES
 (9781234567, 'The Great Gatsby', 'Fiction', 50, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
 (9781234597, 'To Kill a Mockingbird', 'Fiction', 60, 'no', 'Harper Lee', 'J.B. Lippincott'),
 (9781234892, '1984', 'history', 30, 'yes', 'George Orwell', 'Secker & Warburg'),
 (9784567893, 'Pride and Prejudice', 'Romance', 45, 'no', 'Jane Austen', 'T. Egerton'),
 (9784567894, 'Moby Dick', 'Adventure', 40, 'yes', 'Herman Melville', 'Harper & Brothers'),
 (9784567895, 'War and Peace', 'History', 35, 'no', 'Leo Tolstoy', 'The Messenger'),
 (9781237896, 'The Catcher in the Rye', 'Fiction', 25, 'yes', 'J.D. Salinger', 'Brown and Company'),
 (9784567897, 'The Hobbit', 'Fantasy', 60, 'no', 'J.R.R. Tolkien', 'George Allen & Unwin'),
 (9781234067, 'Fahrenheit 451', 'Dystopian', 70, 'yes', 'Ray Bradbury', 'Ballantine Books'),
 (9781267899, 'The Alchemist', 'Adventure', 50, 'yes', 'Paulo Coelho', 'HarperOne');
 
 
CREATE TABLE Customer (
Customer_id INT PRIMARY KEY,
Customer_name VARCHAR(20),
Customer_address VARCHAR(100),
Reg_date DATE 
);
INSERT INTO Customer VALUES 
    (1, 'Alice ', 'kollam', '2024-01-15'),
    (2, 'Johnson', 'kottayam', '2023-02-20'),
    (3, 'Chacko', 'kannur', '2024-03-25'),
    (4, 'Dana', 'kozhikode', '2023-04-10'),
    (5, 'Ann', 'idukki', '2024-05-05'),
    (6, 'Rahul', 'pathanamthitta', '2023-06-30'),
    (7, 'Ganesh', 'ernakulam', '2021-07-18'),
    (8, 'Thomas', 'palakkad', '2024-08-22'),
    (9, 'Riya', 'trivandrum', '2023-09-15'),
    (10, 'John', 'wayanad', '2024-10-01');

CREATE TABLE IssueStatus(
Issue_id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(30),
Issued_date DATE,
ISBN_book VARCHAR(20),
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_id),
FOREIGN KEY (ISBN_book) REFERENCES Books(ISBN)
);
INSERT INTO IssueStatus VALUES 
    (1, 1, 'The Great Gatsby', '2023-01-15', '9781234567'),
    (2, 2, 'To Kill a Mockingbird', '2024-02-20', '9781234597'),
    (3, 3, '1984', '2024-03-25', '9781234892'),
    (4, 4, 'Pride and Prejudice', '2023-06-10', '9784567893'),
    (5, 5, 'Moby Dick', '2024-05-05', '9784567894');
    
CREATE TABLE ReturnStatus (
Return_id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(25),
Return_date DATE,
ISBN_book2 VARCHAR(20),
FOREIGN KEY (ISBN_book2) REFERENCES Books(ISBN)
);

INSERT INTO ReturnStatus VALUES 
    (1, 1, 'The Great Gatsby', '2024-01-20', '9781234567'),
    (2, 2, 'To Kill a Mockingbird', '2024-02-25', '9781234597'),
    (3, 3, '1984', '2024-03-30', '9781234892'),
    (4, 4, 'Pride and Prejudice', '2024-04-15', '9784567893'),
    (5, 5, 'Moby Dick', '2024-05-10', '9784567894'),
    (6, 6, 'War and Peace', '2024-06-20', '9784567895'),
    (7, 7, 'The Catcher in the Rye', '2024-07-25', '9781237896'),
    (8, 8, 'The Hobbit', '2024-08-30', '9784567897'),
    (9, 9, 'Fahrenheit 451', '2024-09-20', '9781234067'),
    (10, 10, 'The Alchemist', '2024-10-05', '9781267899');
    
    
    
#1. Retrieve the book title, category, and rental price of all available books. 
SELECT Book_title, Category, Rental_price, Status FROM Books WHERE Status = 'yes'; 

#2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

#3. Retrieve the book titles and the corresponding customers who have issued those books. 
SELECT Issued_book_name, Issued_cust FROM IssueStatus;

#4. Display the total count of books in each category. 
SELECT COUNT(*), Category FROM Books GROUP BY Category;

#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position, Salary FROM Employee WHERE Salary > 50000;

# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT Customer_name FROM customer WHERE reg_date < '2022-01-01' AND customer_id NOT IN (SELECT Issued_cust FROM IssueStatus);

#7. Display the branch numbers and the total count of employees in each branch
SELECT b.branch_no, (SELECT COUNT(*) FROM employee e WHERE e.branch_no = b.branch_no) AS total_employees FROM branch b;

#8. Display the names of customers who have issued books in the month of June 2023. 
SELECT c.customer_name FROM customer c WHERE c.customer_id IN (SELECT i.issued_cust FROM issuestatus i WHERE i.issued_date >= '2023-06-01' AND i.issued_date < '2023-07-01');
SELECT c.customer_name FROM customer c JOIN issuestatus i ON c.customer_id = i.issued_cust WHERE i.issued_date >= '2023-06-01' AND i.issued_date < '2023-07-01';

#9. Retrieve book_title from book table containing history.
SELECT book_title, category FROM Books WHERE category = 'history';

# 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
SELECT e.branch_no, COUNT(*) AS employee_count FROM employee e JOIN branch b ON e.branch_no = b.branch_no GROUP BY e.branch_no HAVING COUNT(*) > 5;

#11. Retrieve the names of employees who manage branches and their respective branch addresses. 
SELECT e.emp_name AS name, b.branch_address AS address
FROM employee e
JOIN branch b ON e.branch_no = b.branch_no
WHERE position = 'manager';

#12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
SELECT c.customer_name
FROM customer c
JOIN issuestatus i ON c.customer_id = i.issued_cust
JOIN books b ON i.isbn_book = b.isbn
WHERE b.rental_price > 25;
