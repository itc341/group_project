


set linesize 120;
set echo on;
set serveroutput on;
set timing on;

-- Package that includes methods to:
-- 1. add a dependent for any given valid employee.
-- 2. remove a dependent for any given valid employee

-- **** Package Declaration **** --

create or replace package emp_package as
    procedure add_emp( ssn in dependent.essn%type, dep in DEPENDANT.dependant_name%type, s in dependant.sex%type, bd in dependant.bdate%type, rel in dependant.relationship%type );
    procedure rem_emp( ssn in dependent.essn%type, dep in DEPENDANT.dependant_name%type );
end;
/
show errors

-- **** Package Body **** --
create or replace package body emp_package as

    procedure add_emp( ssn in dependent.essn%type, dep in DEPENDANT.dependant_name%type, s in dependant.sex%type, bd in dependant.bdate%type, rel in dependant.relationship%type );
	as
		test INT;
	begin

		select e.ssn into test from EMPLOYEE e and DEPENDANT d where e.ssn = d.essn;
	
		if(test = null) then
			dbms_output.put_line('Employee not found');
		else
			INSERT INTO DEPENDANT VALUES (ssn,dep,s,bd,rel);
		end if;
	
		-- exception handling
		exception
		when NO_DATA_FOUND then
			dbms_output.put_line('No data found');
    end;


	procedure rem_emp( ssn in dependent.essn%type, dep in DEPENDANT.dependant_name%type );
	as 
		test INT;
	begin

		select e.ssn into test from EMPLOYEE e and DEPENDANT d where e.ssn = d.essn;
		
		if(test = null) then
			dbms_output.put_line('Employee not found');
		else
			delete from DEPENDANT d where d.dependant_name = dep;
		end if;
		
		-- exception handling
		exception
		when NO_DATA_FOUND then
			dbms_output.put_line('No data found');
	end;
end;
/
show errors
