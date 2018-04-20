-- CPS 541/ITC 341, 441 - PLSQL stored procedure example-2
-- Dr. Ugur
--

set linesize 120;
set echo on;
set serveroutput on;
set timing on;

-- stored procedure example - 
-- EMPDNAME is passed by reference and used to store the result
CREATE OR REPLACE PROCEDURE get_dept_name_sp2(EMPSSN IN employee.ssn%type, 
		EMPDNAME OUT department.dname%type)
AS 
 
BEGIN 
   EMPDNAME := '';  -- initially empty value 
 
   SELECT dname into EMPDNAME FROM EMPLOYEE E ,DEPARTMENT D 
   WHERE E.DNO = D.DNUMBER AND E.SSN = EMPSSN ;
   
-- exception handling

   exception
     when NO_DATA_FOUND then
       dbms_output.put_line('No data found');

END;
/
show errors

-- **** Test **** -- sp call
-- calling the stored procedure get_dept_name_sp2
-- need to write an anonymous block to get the result into the second argument
declare 
	empdeptname department.dname%type;
begin
	-- procedure call
	get_dept_name_sp2('999887777', empdeptname);
	dbms_output.put_line('dept name for ' || '123456789' || ' is ' || empdeptname);

	-- procedure call
	get_dept_name_sp2('111111111', empdeptname);

	if empdeptname != '' then
		dbms_output.put_line('dept name for ' || '111111111' || ' is ' || empdeptname);
	end if;
end;
/

-- using the store procedure in a query
-- ERROR, does not work
-- since a SP does not return a value
-- select ssn, fname, lname, exec get_dept_name_sp(ssn)
-- from employee;

-- undo changes that are done for testing, if you make a change to a table, 
-- you can undo that change by 'rollback'
-- rollback; 

