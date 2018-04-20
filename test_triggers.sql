-- REQUIRES insert_data to be run before tests are run.

-- Test emp_trigger
SELECT * FROM EMPLOYEE;

-- Insert into table.
INSERT INTO EMPLOYEE VALUES ('Ian', 'A', 'Kirkpatrick', '123456789', '09-JAN-1965', '232 Lawson, Saline, MI', 'M', 95000, '123456789', 5);

-- Characters should be uppercase now.
SELECT * FROM EMPLOYEE;

ROLLBACK;

-- Characters should be lowercase now.
SELECT * FROM EMPLOYEE;



-- Test dept_trigger
SELECT * FROM DEPARTMENT;

-- Insert into table.
UPDATE DEPARTMENT SET mgr_ssn = '333445555' WHERE dnumber = 6;

-- Characters should be uppercase now.
SELECT * FROM DEPARTMENT;

ROLLBACK;

-- Characters should be lowercase now.
SELECT * FROM DEPARTMENT;



-- Test dept_loc_trigger
SELECT * FROM DEPT_LOCATIONS;

-- Insert into table.
INSERT INTO DEPT_LOCATIONS VALUES (1, 'Sugarland');

-- Characters should be uppercase now.
SELECT * FROM DEPT_LOCATIONS;

ROLLBACK;

-- Characters should be lowercase now.
SELECT * FROM DEPT_LOCATIONS;



-- Test proj_trigger
SELECT * FROM PROJECT;

-- Insert into table.
INSERT INTO PROJECT VALUES ('SquirrelX', 1, 'Sugarland', 5);
COMMIT;

-- Characters should be uppercase now.
SELECT * FROM PROJECT;

ROLLBACK;

-- Characters should be lowercase now.
SELECT * FROM PROJECT;



-- Test works_on_trigger
SELECT * FROM WORKS_ON;

-- Insert into table.
INSERT INTO WORKS_ON VALUES ('123456789', 10, 32.5);
COMMIT;

-- Characters should be uppercase now.
SELECT * FROM WORKS_ON;

ROLLBACK;

-- Characters should be lowercase now.
SELECT * FROM WORKS_ON;



-- Test depend_trigger
SELECT * FROM DEPENDANT;

-- Insert into table.
INSERT INTO DEPENDANT VALUES ('123456789', 'Ian', 'M', '05-MAY-1967', 'Brother');
COMMIT;

-- Characters should be uppercase now.
SELECT * FROM DEPENDANT;

ROLLBACK;

-- Characters should be lowercase now.
SELECT * FROM DEPENDANT;
