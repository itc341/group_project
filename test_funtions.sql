-- REQUIRES insert_data to be run before tests are run.

-- **** Test **** -- get_dept_name call
DECLARE
	deptname DEPARTMENT.dname%type;
BEGIN
-- function call
	deptname := get_dept_name('123456789');
	dbms_output.put_line('Department name for 123456789 is "' || deptname ||'"');
END;
/



-- **** Test **** -- get_mgr_name call
DECLARE
	mgr_name EMPLOYEE.fname%type;
BEGIN
-- function call
	mgr_name := get_mgr_name('Research');
	dbms_output.put_line('Manager name for Research is "' || mgr_name || '"');
END;
/

-- **** Test **** -- get_prjmgr_name call
DECLARE
	mgr_name EMPLOYEE.fname%type;
BEGIN
-- function call
	mgr_name := get_prjmgr_name('ProductZ');
	dbms_output.put_line('Manager name of the department for ProductZ is "' || mgr_name || '"');
END;
/

-- **** Test **** -- get_prjmgr_name call

-- Before call: note the salary.
SELECT fname, minit, lname, salary FROM EMPLOYEE WHERE ssn = '888665555';

-- Increase salary by 10%
exec increase_salary('888665555', 10);

-- After call: note the salary increased by 10 percent.
SELECT fname, minit, lname, salary FROM EMPLOYEE WHERE ssn = '888665555';