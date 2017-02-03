-- Exercise 1.1

-- a.
SELECT * FROM DEPARTMENTS;

-- b.
SELECT COUNT(employee_id) FROM EMPLOYEES;

-- c.
-- i.
SELECT * FROM EMPLOYEES WHERE salary > 15000;

-- ii.
SELECT * FROM EMPLOYEES
WHERE hire_date >= TO_DATE('2002/01/01', 'yyyy/mm/dd')
AND hire_date <= TO_DATE('2004/12/31', 'yyyy/mm/dd');

-- iii.
SELECT * FROM EMPLOYEES WHERE phone_number NOT LIKE '515%';

-- d.
SELECT first_name || ' ' || last_name as fullname
FROM EMPLOYEES
WHERE department_id = 100
ORDER BY first_name;

-- e.
SELECT city, state_province, country_name
FROM LOCATIONS, COUNTRIES, REGIONS
WHERE REGIONS.region_id = COUNTRIES.region_id
AND COUNTRIES.country_id = LOCATIONS.country_id
AND REGIONS.region_name = 'Asia';

-- f.
SELECT * FROM LOCATIONS WHERE state_province IS NULL;