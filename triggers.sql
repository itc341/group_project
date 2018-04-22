set linesize 120;
set echo on;
set serveroutput on;
set timing on;

-- (for department table only)
CREATE OR REPLACE TRIGGER emp_trigger
AFTER INSERT ON EMPLOYEE
BEGIN
	UPDATE EMPLOYEE SET fname = UPPER(fname);
  UPDATE EMPLOYEE SET minit = UPPER(minit);
  UPDATE EMPLOYEE SET lname = UPPER(lname);
  UPDATE EMPLOYEE SET ssn = UPPER(ssn);
  UPDATE EMPLOYEE SET address = UPPER(address);
  UPDATE EMPLOYEE SET sex = UPPER(sex);
  UPDATE EMPLOYEE SET super_ssn = UPPER(super_ssn);
END;
/
show errors

-- (for department table only)
CREATE OR REPLACE TRIGGER dept_trigger
AFTER INSERT ON DEPARTMENT
BEGIN
	UPDATE DEPARTMENT SET dname = UPPER(dname);
	UPDATE DEPARTMENT SET mgr_ssn = UPPER(mgr_ssn);
END;
/
show errors

-- (for department table only)
CREATE OR REPLACE TRIGGER dept_loc_trigger
AFTER INSERT ON DEPT_LOCATIONS
BEGIN
	UPDATE DEPT_LOCATIONS SET dlocation = UPPER(dlocation);
END;
/
show errors

-- (for department table only)
CREATE OR REPLACE TRIGGER proj_trigger
AFTER INSERT ON PROJECT
BEGIN
	UPDATE PROJECT SET pname = UPPER(pname);
	UPDATE PROJECT SET plocation = UPPER(plocation);
END;
/
show errors

-- (for department table only)
CREATE OR REPLACE TRIGGER works_on_trigger
AFTER INSERT ON WORKS_ON
BEGIN
	UPDATE WORKS_ON SET essn = UPPER(essn);
END;
/
show errors

-- (for department table only)
CREATE OR REPLACE TRIGGER depend_trigger
AFTER INSERT ON DEPENDANT
BEGIN
	UPDATE DEPENDANT SET dependant_name = UPPER(dependant_name);
	UPDATE DEPENDANT SET essn = UPPER(essn);
	UPDATE DEPENDANT SET sex = UPPER(sex);
	UPDATE DEPENDANT SET relationship = UPPER(relationship);
END;
/
show errors
