-- CPS 541/ITC 341, 441 - PLSQL stored procedure example-1
-- Dr. Ugur
--

set linesize 120;
set echo on;
set serveroutput on;
set timing on;

-- stored procedure example
-- given empssn, find the dept. name of the employee and display
CREATE OR REPLACE PROCEDURE get_dept_name_sp(EMPSSN IN employee.ssn%type)
AS 
   mm department.dname%type;
BEGIN 
   mm := '';  -- initially empty value 
 
   SELECT dname into mm FROM EMPLOYEE E ,DEPARTMENT D 
   WHERE E.DNO = D.DNUMBER AND E.SSN = EMPSSN ;
   
   dbms_output.put_line('Dept. name is '|| mm);

-- exception handling

   exception
     when NO_DATA_FOUND then
       dbms_output.put_line('No data found');

END;
/
show errors

-- **** Test **** -- sp call
-- calling the stored procedure get_dept_name_sp
exec get_dept_name_sp('123456789');
exec get_dept_name_sp('111111111');

-- using the store procedure in a query
-- ERROR, does not work
-- since a SP does not return a value
-- select ssn, fname, lname, exec get_dept_name_sp(ssn)
-- from employee;

-- undo changes that are done for testing, if you make a change to a table, 
-- you can undo that change by 'rollback'
-- rollback; 
