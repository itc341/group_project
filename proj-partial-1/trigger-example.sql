-- CPS 541/ITC 341, 441 - PLSQL Trigger example
-- Dr. Ugur
--

set linesize 120;
set echo on;
set serveroutput on;
set timing on;

-- (for department table only)
create or replace trigger dept_trigger
after insert on department
begin
	update department SET dname = upper(dname);
end;
/
show errors

-- **** Test **** --
-- before update
select * from department; 

-- update - lowercase dname
insert into Department values ('Lab', 9, '333445555', null);

-- notice that dnames are all uppercase now
select * from department; 

-- undo the update (insert)
rollback; 

-- notice that dnames are all lowercase now
select * from department;

