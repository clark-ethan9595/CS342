-- Homework06_1.sql
-- Ethan Clark
-- CS 342
-- March 15, 2017

-- Exercise 1
-- Please write SQL queries that retrieve the following information from the HR database.

-- a. The IDs and full names of managers and the number of employees each of them manages. Order the results by decreasing number
--		of employees and return only the top ten results.
	SELECT *
	FROM
		(SELECT M.employee_id, M.first_name, M.last_name, COUNT(E.employee_id)
		FROM EMPLOYEES M, EMPLOYEES E
		WHERE E.manager_id = M.employee_id
		GROUP BY M.employee_id, M.first_name, M.last_name
		ORDER BY COUNT(E.employee_id) DESC)
	WHERE ROWNUM < 11;

-- b. The name, number of employees and total salary for each department outside of the US with less than 100 employees. The total
--		salary is the sum of salaries of each of the department's employees.
	SELECT D.department_name, C.country_name, COUNT(E.employee_id) AS Number_of_Employees, SUM(E.salary) AS Total_Salary_of_Department
	FROM DEPARTMENTS D, EMPLOYEES E, LOCATIONS L, COUNTRIES C
	WHERE E.department_id = D.department_id AND D.location_id = L.location_id
	AND L.country_id = C.country_id AND C.country_name <> 'United States of America'
	GROUP BY D.department_name, C.country_name
	HAVING COUNT(E.employee_id) < 100;

-- c. The department name, department manager name and manager job title for all departments. If the department has no manager,
--		include it in the output with NULL values for the manager and title.
	SELECT D.department_name, E.first_name || ' ' || E.last_name AS fullname, E.job_id
	FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E ON D.manager_id = E.employee_id;

-- d. The name of each department along with the average salary of the employees of that department. If a department has no employees,
--		include in the list with no salary value. Order your results by decreasing salary. You may order the NULL valued salaries
--		however you'd like.
	SELECT D.department_name, ROUND(AVG(E.salary), 2) AS AVERAGE_SALARY
	FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E ON D.department_id = E.department_id
	GROUP BY D.department_name
	ORDER BY AVG(E.salary) DESC NULLS LAST;