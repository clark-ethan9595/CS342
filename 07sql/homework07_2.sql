-- Homework07_2.sql
-- Ethan Clark
-- CS 342 - Lab07
-- March 27, 2017

-- Exercise 2

-- This query gets all the employee records, including the one with a NULL department_id
CREATE MATERIALIZED VIEW deptView AS
	SELECT E.employee_id, E.first_name, E.last_name, E.email, E.hire_date, D.department_name
	FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.department_id = D.department_id;

	-- I cannot get the FOR UPDATE materialized view to work because it gives an error saying 'updatable
	--		materialized views must be simple enough to do fast refresh'. My guess is that the LEFT OUTER
	--		JOIN is causing the materialized view to be 'slow', whatever that may mean. I cannot figure out any
	--		other way to create this view so that I don't get that error other than leave the FOR UPDATE
	--		clause out of the creation of the view.


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

	-- This update query produces an error saying 'data manipulation operation not legal on this view'. I am
	--		pretty sure that is because the deptView is not a FOR UPDATE materialized view, but again, I cannot
	--		find a way for the view to work using FOR UPDATE. I am almost quite certain that if I could get
	--		the FOR UPDATE materialized view to work this update query would work, so it would change all the
	--		tuples that have administration in the department_name attribute to bean counting in both the deptView
	--		view and the EMPLOYEES table.


-- c.
	UPDATE deptView SET first_name = 'Manuel' WHERE first_name = 'Jose Manuel';

	-- This update query produces the same error as part b above 'data manipulation operation not legal on this view'.
	-- 		Again, if I could get the FOR UPDATE materialized view to work, I think that this update query would work,
	--		changing both the Jose Manuel tuple in deptView and the Jose Manuel tuple in the EMPLOYEES table.


-- d.
	INSERT INTO deptView VALUES (2000, 'Ethan', 'Clark', 'eclark9595', '05-SEP-1995', 'Payroll');

	-- Again (ugh) this insert query produces the same error as parts b and c. I think however in this case if
	--		I were to have the FOR UPDATE materialized view working, I would get the same error as exercise 1 part d
	--		where I cannot modify more than one base table at a time through the join view.