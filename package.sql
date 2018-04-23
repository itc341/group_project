-- package.sq1
-- Creates the triggers for the company database.
-- Ian Kirkpatrick, Rohith Kamisetty
-- ITC 341 Group Project		Apr. 23, 2018

set linesize 120;
set echo on;
set serveroutput on;
set timing on;

-- Package that includes methods to:
-- 1. add a dependent for any given valid employee.
-- 2. remove a dependent for any given valid employee

-- **** Package Declaration **** --
create or replace package emp_package as
    procedure add_dep( ssn in DEPENDANT.essn%type, dep in DEPENDANT.dependant_name%type, s in DEPENDANT.sex%type, bd in DEPENDANT.bdate%type, rel in DEPENDANT.relationship%type );
    procedure rem_dep( ssn in DEPENDANT.essn%type, dep in DEPENDANT.dependant_name%type );
end;
/
show errors

-- **** Package Body **** --
create or replace package body emp_package as

    procedure add_dep( ssn in DEPENDANT.essn%type, dep in DEPENDANT.dependant_name%type, s in DEPENDANT.sex%type, bd in DEPENDANT.bdate%type, rel in DEPENDANT.relationship%type )
	as
		test INT;
	begin

		select count(*) into test from EMPLOYEE e where ssn = e.ssn;
	
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


	procedure rem_dep( ssn in DEPENDANT.essn%type, dep in DEPENDANT.dependant_name%type )
	as 
		test INT;
	begin

		select COUNT(*) into test from DEPENDANT d where ssn = d.essn and dep = dependant_name;
	
		if(test = null) then
			dbms_output.put_line('Dependant or employee not found');
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
