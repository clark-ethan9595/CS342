-- Exercise 1.2

-- The DUAL table only contains one column (a VARCHAR2(1) column) called DUMMY that has one row/value/data of 'X' in it.
-- Oracle requires a FROM clause in it's SQL syntax, so if you just wanted to do a simple computation that does
-- 		not require any tables, you can use the DUAL table in these cases. Or get the USER or DATE.

-- Commands
DESCRIBE DUAL;

SELECT * FROM DUAL;

-- Computations
SELECT 1+1 FROM DUAL;
SELECT 5+3 FROM DUAL;
SELECT 10/2 FROM DUAL;

-- To see which user it is on
SELECT USER FROM DUAL;

-- To see what date it is
SELECT SYSDATE FROM DUAL;