-- Homework07_2.sql
-- Ethan Clark
-- CS 342 - Lab07
-- March 27, 2017

-- Exercise 2

-- This query gets all the employee records, including the one with a NULL department_id
CREATE MATERIALIZED VIEW deptView AS
	SELECT E.employee_id, E.first_name, E.last_name, E.email, E.hire_date, D.department_name
	FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.department_id = D.department_id;

-- a.
SELECT * FROM (
	SELECT employee_id, first_name, last_name
	FROM deptView
	WHERE department_name = 'Executive'
	ORDER BY hire_date DESC
) WHERE ROWNUM = 1;

	-- This query is the same as the non materialized view from homework exercise 7.1.a.

-- b.
UPDATE deptView SET department_name = 'Bean Counting' WHERE department_name = 'Administration';

-- c.
UPDATE deptView SET first_name = 'Manuel' WHERE first_name = 'Jose Manuel';

-- d.
INSERT INTO deptView VALUES (2000, 'Ethan', 'Clark', 'eclark9595', '05-SEP-1995', 'Payroll');