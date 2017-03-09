-- homework05_1.sql
-- Ethan Clark
-- CS 342
-- Homework05

-- 1. Write SQL queries that:
--		a. Get a list of the employees who have finished all of their jobs (i.e., all their jobs in the job_history table have non-null end_dates).
		SELECT DISTINCT E.employee_id, E.first_name, E.last_name
		FROM EMPLOYEES E, JOB_HISTORY JH
		WHERE E.employee_id = JH.employee_id
		AND NOT EXISTS (SELECT JH1.end_date FROM JOB_HISTORY JH1 WHERE JH1.end_date IS NULL);

--		b. Get a list of all employees along with their manager such that the managers have less seniority at the company and that all the employees'
--			jobs have been within the manager's department.
		SELECT DISTINCT E.first_name || ' ' || E.last_name AS Employee_Name, M.first_name || ' ' || M.last_name AS Manager_Name
		FROM EMPLOYEES E, EMPLOYEES M, JOB_HISTORY JH
		WHERE E.manager_id = M.employee_id AND E.hire_date < M.hire_date AND E.employee_id = JH.employee_id AND JH.department_id = M.department_id;

--		c. The countries in which at least one department is located. Try to write this as both a join and a nested query. If you can, explain which is
--			better. If you can't, explain which is not possible and why.

		-- With a join
		SELECT DISTINCT C.country_name FROM COUNTRIES C, LOCATIONS L, DEPARTMENTS D
		WHERE C.country_id = L.country_id AND L.location_id = D.location_id;

		-- With a subquery
		SELECT DISTINCT C.country_name FROM COUNTRIES C, LOCATIONS L
		WHERE C.country_id = L.country_id AND L.location_id IN
			(SELECT L.location_id FROM LOCATIONS L, DEPARTMENTS D
				WHERE L.location_id = D.location_id);

		-- I think that the first one is a better query for this particular situation. After a little research online, it seems that people do prefer
		--		a join statement query than to a subquery. A subquery may be easier to read in some cases, but can be slower. I think the readability
		--		in this case doesn't make too much a difference so I would go with the join query for this one.