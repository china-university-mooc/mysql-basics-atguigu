use myemployees;

# 1
CREATE OR REPLACE VIEW emp_v1
AS
SELECT last_name, salary, email
FROM employees
WHERE phone_number LIKE '011%';

SELECT * FROM emp_v1;

DESC emp_v1;

# 2
CREATE OR REPLACE VIEW emp_v2
AS
SELECT max(salary) max_sal, department_id
FROM employees
GROUP BY department_id;

SELECT max_sal, d.*
FROM emp_v2 v
         INNER JOIN departments d ON d.department_id = v.department_id
WHERE max_sal > 12000;

CREATE OR REPLACE VIEW emp_v2
AS
SELECT max(salary) max_sal, department_id
FROM employees
GROUP BY department_id
HAVING max_sal > 12000;

SELECT max_sal, d.*
FROM emp_v2 v
INNER JOIN departments d ON d.department_id = v.department_id
