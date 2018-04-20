-- REQUIRES insert_data to be run before tests are run.

-- **** Test **** -- get_dept_name call
DECLARE
	deptname DEPARTMENT.dname%type;
BEGIN
-- function call
	deptname := get_dept_name('123456789');
	IF deptname != '' THEN
		dbms_output.put_line('Department name for 123456789 is ' || deptname);
  ELSE
    dbms_output.put_line('Function call to get_dept_name with EMPSSN of 123456789 failed.');
	END IF;
END;
/



-- **** Test **** -- get_mgr_name call
DECLARE
	mgr_name EMPLOYEE.fname%type;
BEGIN
-- function call
	mgr_name := get_mgr_name('Research');
	IF deptname != '' THEN
		dbms_output.put_line('Manager name for Research is ' || mgr_name);
  ELSE
    dbms_output.put_line('Function call to get_mgr_namek with DEPT_NM of Research failed.');
	END IF;
END;
/
