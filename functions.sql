-- functions.sq1
-- Creates the triggers for the company database.
-- Ian Kirkpatrick, Rohith Kamisetty
-- ITC 341 Group Project		Apr. 23, 2018

set linesize 120;
set echo on;
set serveroutput on;
set timing on;

CREATE OR REPLACE FUNCTION get_dept_name(EMPSSN IN EMPLOYEE.ssn%type)
  RETURN DEPARTMENT.dname%type
IS
  mm DEPARTMENT.dname%type;
BEGIN
  mm := '';  -- initially empty value

  SELECT dname INTO mm FROM EMPLOYEE E, DEPARTMENT D
  WHERE E.dno = D.dnumber AND E.ssn = EMPSSN ;

  RETURN(mm);

  -- exception handling

  EXCEPTION
    when NO_DATA_FOUND then
      dbms_output.put_line('No data found');
      RETURN(mm);

END;
/
show errors

CREATE OR REPLACE FUNCTION get_mgr_name(DEPT_NM IN DEPARTMENT.dname%type)
  RETURN EMPLOYEE.fname%type
IS
  mgr_name EMPLOYEE.fname%type;
BEGIN
  mgr_name := '';  -- initially empty value

  SELECT (fname || ' ' || minit || ' ' || lname) INTO mgr_name FROM EMPLOYEE
  INNER JOIN DEPARTMENT
  ON DEPARTMENT.mgr_ssn = EMPLOYEE.ssn
  WHERE DEPARTMENT.dname = DEPT_NM;

  RETURN(mgr_name);

  -- exception handling

  EXCEPTION
    when NO_DATA_FOUND then
      dbms_output.put_line('No data found');
      RETURN(mgr_name);

END;
/
show errors

CREATE OR REPLACE FUNCTION get_prjmgr_name(PROJ IN PROJECT.pname%type)
  RETURN EMPLOYEE.fname%type
IS
  mgr_name EMPLOYEE.fname%type;
BEGIN
  mgr_name := '';  -- initially empty value

  SELECT (fname || ' ' || minit || ' ' || lname) INTO mgr_name FROM EMPLOYEE
  INNER JOIN DEPARTMENT
  ON DEPARTMENT.mgr_ssn = EMPLOYEE.ssn
  INNER JOIN PROJECT
  ON DEPARTMENT.dnumber = PROJECT.dnum
  WHERE PROJECT.pname = PROJ;

  RETURN(mgr_name);

  -- exception handling

  EXCEPTION
    when NO_DATA_FOUND then
      dbms_output.put_line('No data found');
      RETURN(mgr_name);

END;
/
show errors

---Procedure 

CREATE OR REPLACE PROCEDURE increase_salary(EMP_SSN IN EMPLOYEE.fname%type, PCNT IN INT)
AS
  new_salary INT;
BEGIN
  new_salary := '';  -- initially empty value

  UPDATE EMPLOYEE SET salary = CAST((CAST(salary AS DECIMAL(12,2)) * PCNT / 100) AS INT) + salary
  WHERE ssn = EMP_SSN;
  
  SELECT salary INTO new_salary FROM EMPLOYEE WHERE ssn = EMP_SSN;
  dbms_output.put_line('The new salary for this employee is ' || CAST(new_salary AS VARCHAR) || '.');

  -- exception handling

  EXCEPTION
    when NO_DATA_FOUND then
      dbms_output.put_line('No data found');

END;
/
show errors

