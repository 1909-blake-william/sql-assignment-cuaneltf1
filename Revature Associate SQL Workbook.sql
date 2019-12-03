-- 1.0 Setting up Oracle Chinook
-- In this section you will begin the process of working with the Oracle Chinook database
-- Task � Open the Chinook_Oracle.sql file and execute the scripts within.

-- 2.0 SQL Queries
-- In this section you will be performing various queries against the Oracle Chinook database.
-- 2.1 SELECT
-- Task � Select all records from the Employee table.
SELECT * FROM employee;
-- Task � Select all records from the Employee table where last name is King.
SELECT * FROM employee
WHERE lastname = 'King';
-- Task � Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
SELECT * FROM employee
WHERE firstname = 'Andrew'
AND reportsto is null;
-- 2.2 ORDER BY
-- Task � Select all albums in Album table and sort result set in descending order by title.
SELECT * FROM album ORDER BY title desc;
-- Task � Select first name from Customer and sort result set in ascending order by city
SELECT firstname from customer ORDER BY city;
-- 2.3 INSERT INTO
-- Task � Insert two new records into Genre table
INSERT INTO Genre (GenreId, Name) VALUES (26, 'Chanook Won');
INSERT INTO Genre (GenreId, Name) VALUES (27, 'This Time');
-- Task � Insert two new records into Employee table
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES (9, 'Jon', 'Doe', 'General Manager', TO_DATE('1942-2-18 00:00:00','yyyy-mm-dd hh24:mi:ss'), TO_DATE('2000-8-14 00:00:00','yyyy-mm-dd hh24:mi:ss'), '12345 Long Walk Way', 'This', 'XY', 'Wakanda', 'T7K 3N7', '+1 (780) 428-9824', '+1 (780) 428-3824', 'jon@chinookcorp.com');
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES (10, 'That', 'Guy', 'Sales Manager', 1, TO_DATE('1948-12-8 00:00:00','yyyy-mm-dd hh24:mi:ss'), TO_DATE('2001-5-1 00:00:00','yyyy-mm-dd hh24:mi:ss'), '54321 Short Walk Way', 'Calgary', 'ZZ', 'Asgard', 'T0P 0T3', '+1 (403) 262-3262', '+1 (403) 262-3262', 'that@chinookcorp.com');
-- Task � Insert two new records into Customer table
INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES (60, 'Ho', 'Asgor', 'Hell Watch', 'Unknown', 'Unknown', 'XX', 'Unknown', '00000-000', '+00 (00) 0000-0000', '+00 (00) 0000-0000', 'hoa@hw.com', 3);
INSERT INTO Customer (CustomerId, FirstName, LastName, Address, City, Country, PostalCode, Phone, Email, SupportRepId) VALUES (61, 'Leon', 'S. Kennedy', 'Secret Service', 'Washington DC', 'USA', '12321', '+1 933 987-4589', 'kennedy@sc.gov', 5);
-- 2.4 UPDATE
-- Task � Update Aaron Mitchell in Customer table to Robert Walter
UPDATE customer
SET firstname = 'Robert', lastname= 'Walter'
WHERE customerid = 32;
-- Task � Update name of artist in the Artist table �Creedence Clearwater Revival� to �CCR�
UPDATE artist
SET name = 'CCR'
WHERE artistid = 76;
-- 2.5 LIKE
-- Task � Select all invoices with a billing address like �T%�
SELECT * from invoice WHERE billingaddress LIKE 'T%';
-- 2.6 BETWEEN
-- Task � Select all invoices that have a total between 15 and 50
SELECT * from invoice WHERE total BETWEEN 15 AND 50;
-- Task � Select all employees hired between 1st of June 2003 and 1st of March 2004
SELECT * from employee WHERE hiredate BETWEEN '01-JUN-03' AND '01-MAR-04';
-- 2.7 DELETE
-- Task � Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).

-- 3.0 SQL Functions
-- In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
-- 3.1 System Defined Functions
-- Task � Create a function that returns the current time.
CREATE or REPLACE FUNCTION getCurrentDate 
RETURN date 
IS 
c_sysdate date;
BEGIN
    SELECT sysdate INTO c_sysdate from dual;
    RETURN c_sysdate;
END;
-- Task � create a function that returns the length of a mediatype from the mediatype table
SELECT 
  mediatype.name string,
  LENGTH(mediatype.name) Len
FROM 
  mediatype;
-- 3.2 System Defined Aggregate Functions
-- Task � Create a function that returns the average total of all invoices
select AVG(all total) from invoice;
-- Task � Create a function that returns the most expensive track
select max(unitprice) from track;
-- 3.3 User Defined Scalar Functions
-- Task � Create a function that returns the average price of invoiceline items in the invoiceline table
select AVG(all unitprice) from invoiceline;
-- 3.4 User Defined Table Valued Functions
-- Task � Create a function that returns all employees who are born after 1968.
SELECT * from employee WHERE birthdate BETWEEN '01-JAN-68' AND '30-OCT-19';

-- 4.0 Stored Procedures
--  In this section you will be creating and executing stored procedures. You will be creating various types of stored procedures that take input and output parameters.
-- 4.1 Basic Stored Procedure
-- Task � Create a stored procedure that selects the first and last names of all the employees.
-- 4.2 Stored Procedure Input Parameters
-- Task � Create a stored procedure that updates the personal information of an employee.
-- Task � Create a stored procedure that returns the managers of an employee.
-- 4.3 Stored Procedure Output Parameters
-- Task � Create a stored procedure that returns the name and company of a customer.

-- 6.0 Triggers
-- In this section you will create various kinds of triggers that work when certain DML statements are executed on a table.
-- 6.1 AFTER/FOR
-- Task - Create an after insert trigger on the employee table fired after a new record is inserted into the table.
-- Task � Create an after update trigger on the album table that fires after a row is inserted in the table
-- Task � Create an after delete trigger on the customer table that fires after a row is deleted from the table.
-- Task � Create a trigger that restricts the deletion of any invoice that is priced over 50 dollars.

-- 7.0 JOINS
-- In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.
-- 7.1 INNER
-- Task � Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
SELECT customer.firstname, invoice.invoiceid
FROM customer
INNER JOIN invoice ON customer.customerid = invoice.customerid;
-- 7.2 OUTER
-- Task � Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
SELECT Customer.customerid, customer.firstname, customer.lastname, invoice.invoiceid, invoice.total
FROM customer
FULL OUTER JOIN invoice ON customer.customerid = invoice.customerid;
-- 7.3 RIGHT
-- Task � Create a right join that joins album and artist specifying artist name and title.
Select Artist.name, album.title
from artist
right join album on artist.artistid = album.artistid;
-- 7.4 CROSS
-- Task � Create a cross join that joins album and artist and sorts by artist name in ascending order.
Select name, title, artist.artistid
from album
cross join artist
Order by artist.name;
-- 7.5 SELF
-- Task � Perform a self-join on the employee table, joining on the reportsto column.
Select e.firstname as employee, m.firstname as manager
from employee e
left join employee m
on e.reportsto = m.employeeid;
-- 14
