-- queries.sql
-- Runs test queries for the company database.
-- Ian Kirkpatrick
-- ITC 341 Homework 7		Mar. 19, 2018

-- a)
SELECT fname, lname FROM EMPLOYEE WHERE dno=5;

-- b)
SELECT fname, lname, dname FROM EMPLOYEE
		INNER JOIN DEPARTMENT
			ON EMPLOYEE.dno = DEPARTMENT.dnumber;
			
-- c)
SELECT fname, lname FROM EMPLOYEE
		INNER JOIN DEPARTMENT
			ON EMPLOYEE.dno = DEPARTMENT.dnumber
		WHERE dname = 'Research';
		
-- d)
SELECT fname, lname FROM EMPLOYEE
		INNER JOIN WORKS_ON
			ON EMPLOYEE.ssn = WORKS_ON.essn
		INNER JOIN PROJECT
			ON WORKS_ON.pno = PROJECT.pnumber
		WHERE PROJECT.pname = 'Computerization';

