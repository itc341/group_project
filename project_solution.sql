set linesize 120;
set echo on;
set serveroutput on;
set timing on;

-- (for department table only)
create or replace trigger emp_trigger
after insert on EMPLOYEE
begin
	update department SET fdname = upper(fname);
  update department SET minit = upper(minit);
  update department SET lname = upper(lname);
  update department SET ssn = upper(ssn);
  update department SET address = upper(address);
  update department SET sex = upper(sex);
  update department SET super_ssn = upper(super_ssn);
end;
/

-- (for department table only)
create or replace trigger dept_trigger
after insert on department
begin
	update department SET dname = upper(dname);
end;
/

-- (for department table only)
create or replace trigger dept_trigger
after insert on department
begin
	update department SET dname = upper(dname);
end;
/

-- (for department table only)
create or replace trigger dept_trigger
after insert on department
begin
	update department SET dname = upper(dname);
end;
/
