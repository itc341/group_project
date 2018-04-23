-- test_package.sq1
-- Creates the triggers for the company database.
-- Ian Kirkpatrick, Rohith Kamisetty
-- ITC 341 Group Project		Apr. 23, 2018

set linesize 120;
set echo on;
set serveroutput on;
set timing on;

-- REQUIRES insert_data to be run before tests are run.

-- See how many dependents are in the database for employee with essn='987654321'
SELECT * FROM DEPENDANT WHERE essn = '987654321';

-- Call the procedure to add dependent
exec emp_package.add_dep('987654321', 'Jack N Box', 'M', '16-MAR-1989', 'Brother');

-- See that the dependent was added.
SELECT * FROM DEPENDANT WHERE essn = '987654321';


-- See the dependents in the database for employee with essn='987654321'
SELECT * FROM DEPENDANT WHERE essn = '987654321';

-- Call the procedure to add dependent
exec emp_package.rem_dep('987654321', 'Jack N Box');

-- See that the dependent was removed.
SELECT * FROM DEPENDANT WHERE essn = '987654321';