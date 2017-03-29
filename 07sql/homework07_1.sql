-- Homeowork07_1.sql
-- Ethan Clark
-- CS 342 - Lab07
-- March 27, 2017

-- Exercise 1

-- This view gets all 107 employees, including the one that has a NULL department_id
CREATE VIEW deptView AS
	SELECT E.employee_id, E.first_name, E.last_name, E.email, E.hire_date, D.department_name
	FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.department_id = D.department_id;

-- a.
SELECT * FROM (
	SELECT employee_id, first_name, last_name
	FROM deptView
	WHERE department_name = 'Executive'
	ORDER BY hire_date DESC
) WHERE ROWNUM = 1;

-- b.
UPDATE deptView SET department_name = 'Bean Counting' WHERE department_name = 'Administration';

	-- This query produces an error which says 'cannot modify a column which maps to a non key-preserved table'.
	-- This is because we did not store the primary key of the departments table in our view deptView, so
	-- Oracle does not let us update or change any information regarding the department attributes because it
	-- cannot find a way back to the base table to update that information.

-- c.
UPDATE deptView SET first_name = 'Manuel' WHERE first_name = 'Jose Manuel';

	-- Unlike the query from part b, this query upate works because we did key preserve the information
	-- from the employees table (employee_id). So Oracle allows us to update this information. This even
	-- updates the record in the employees table so that Jose Manuel's first name got changed to just Manuel
	-- there as well.

-- d.
INSERT INTO deptView VALUES (2000, 'Ethan', 'Clark', 'eclark9595', '05-SEP-1995', 'Payroll');

	-- This query gives the error 'cannot modify more than one base table through a join view'. This means
	-- that because our view combines both employees and departments tables so it cannot insert into this
	-- view.