
SELECT * FROM employees WHERE email LIKE '%a%'
UNION
SELECT * FROM employees WHERE department_id > 90;

SELECT * FROM employees WHERE email LIKE '%a%'
UNION ALL
SELECT * FROM employees WHERE department_id > 90;

SELECT id, name FROM beauty
UNION
SELECT id, boyName FROM boys;
