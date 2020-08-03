USE myemployees;

#
CREATE VIEW myv1
AS
SELECT last_name, department_name, job_title
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN jobs j ON j.job_id = e.job_id;

SELECT * FROM myv1 WHERE last_name LIKE '%a%';

#
CREATE VIEW myv2
AS
SELECT AVG(salary) ag, department_id
FROM employees
GROUP BY department_id;

DROP VIEW myv2;

SELECT * FROM myv2;

SELECT department_id, ag, grade_level
FROM myv2 v
INNER JOIN job_grades g ON v.ag BETWEEN g.lowest_sal AND g.highest_sal;

#
SELECT *
FROM myv2
ORDER BY ag
LIMIT 1;

#
CREATE VIEW myv3
AS
SELECT *
FROM myv2
ORDER BY ag
LIMIT 1;

SELECT * FROM myV3;

SELECT d.department_id, ag, department_name
FROM myv3 v
INNER JOIN departments d ON d.department_id = v.department_id;

#
CREATE OR REPLACE VIEW myv3
AS
SELECT AVG(salary) ag, job_id
FROM employees
GROUP BY job_id;

SELECT * FROM myV3;

#
ALTER VIEW myv3
AS
SELECT * FROM employees;

DROP VIEW myv1, myv2, myv3;

DESC myv1;
SHOW CREATE VIEW myv3;

SHOW CREATE TABLE employees;
