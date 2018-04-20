-- create_schema.sql
-- Creates the database schema for the company database.
-- Ian Kirkpatrick
-- ITC 341 Homework 7		Mar. 19, 2018

DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
COMMIT;
CREATE TABLE EMPLOYEE
(
	fname		VARCHAR(20),
	minit		CHAR(1),
	lname		VARCHAR(20),
	ssn			CHAR(9),
	bdate		DATE,
	address		VARCHAR(100),
	sex			CHAR(1),
	salary		INT,
	super_ssn	CHAR(9),
	dno			INT,
	CONSTRAINT EMPPKEY
		PRIMARY KEY (ssn),
	CONSTRAINT SALRNGE
		CHECK (salary>=20000 OR salary<=100000),
	CONSTRAINT SEXOPTS
		CHECK (sex = 'M' OR sex = 'F')
);
COMMIT;


DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
COMMIT;
CREATE TABLE DEPARTMENT
(
	dname			VARCHAR(20),
	dnumber			INT,
	mgr_ssn			CHAR(9),
	mgr_start_date	DATE,
	CONSTRAINT DEPPKEY
		PRIMARY KEY (dnumber),
	CONSTRAINT DEP_MGR
		FOREIGN KEY (mgr_ssn) REFERENCES EMPLOYEE (ssn)
		ON DELETE SET NULL
);
COMMIT;


ALTER TABLE EMPLOYEE ADD
	CONSTRAINT EMP_DEPT
		FOREIGN KEY (dno) REFERENCES DEPARTMENT (dnumber)
		ON DELETE SET NULL;
ALTER TABLE EMPLOYEE ADD
	CONSTRAINT EMP_SUPER
		FOREIGN KEY (super_ssn) REFERENCES EMPLOYEE (ssn)
		ON DELETE SET NULL;
COMMIT;


DROP TABLE DEPT_LOCATIONS CASCADE CONSTRAINTS;
COMMIT;
CREATE TABLE DEPT_LOCATIONS
(
	dnumber		INT,
	dlocation	VARCHAR(20),
	CONSTRAINT DLOCPKEY
		PRIMARY KEY (dnumber, dlocation),
	CONSTRAINT DEP_LOC
		FOREIGN KEY (dnumber) REFERENCES DEPARTMENT (dnumber)
		ON DELETE SET NULL
);
COMMIT;


DROP TABLE PROJECT CASCADE CONSTRAINTS;
COMMIt;
CREATE TABLE PROJECT
(
	pname		VARCHAR(20),
	pnumber		INT,
	plocation	VARCHAR(20),
	dnum		INT,
	CONSTRAINT PROJPKEY
		PRIMARY KEY (pnumber),
	CONSTRAINT PROJ_DEP
		FOREIGN KEY (dnum) REFERENCES DEPARTMENT (dnumber)
		ON DELETE SET NULL
);
COMMIT;


DROP TABLE WORKS_ON CASCADE CONSTRAINTS;
COMMIT;
CREATE TABLE WORKS_ON
(
	essn	CHAR(9),
	pno		INT,
	hours	FLOAT,
	CONSTRAINT WORKSONPKEY
		PRIMARY KEY (essn, pno),
	CONSTRAINT WORKS_ON_EMP
		FOREIGN KEY (essn) REFERENCES EMPLOYEE (ssn)
		ON DELETE SET NULL,
	CONSTRAINT WORKS_ON_PROJ
		FOREIGN KEY (pno) REFERENCES PROJECT (pnumber)
		ON DELETE SET NULL
);
COMMIT;


DROP TABLE DEPENDANT CASCADE CONSTRAINTS;
COMMIT;
CREATE TABLE DEPENDANT
(
	essn			CHAR(9),
	dependant_name	VARCHAR(20),
	sex				CHAR(1),
	bdate			DATE,
	relationship	VARCHAR(15),
	CONSTRAINT DEPENDPKEY
		PRIMARY KEY (essn, dependant_name),
	CONSTRAINT DEPEND_EMP
		FOREIGN KEY (essn) REFERENCES EMPLOYEE (ssn)
);
COMMIT;