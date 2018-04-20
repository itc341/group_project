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
