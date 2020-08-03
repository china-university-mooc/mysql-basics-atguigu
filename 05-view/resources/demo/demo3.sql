USE myemployees;
DROP VIEW myv1, myv2, myv3;

CREATE OR REPLACE VIEW myv1
AS
SELECT last_name, email, salary * 12 * (1 + IFNULL(commission_pct, 0)) annual_sal
FROM employees;

SELECT * FROM myv1;

INSERT INTO myv1 VALUES ('张飞', 'zf@qq.com', 10000);

#
CREATE OR REPLACE VIEW myv1
AS
SELECT last_name, email
FROM employees;

INSERT INTO myv1 VALUES ('张飞', 'zf@qq.com');
UPDATE myv1 SET last_name = '张无忌' WHERE last_name = '张飞';
DELETE FROM myv1 WHERE last_name = '张无忌';

SELECT * FROM employees;
DESC employees;

#
CREATE OR REPLACE VIEW myv1
AS
SELECT MAX(salary) max_sal, department_id
FROM employees
GROUP BY department_id;

SELECT * FROM myemployees.myv1;

UPDATE myemployees.myv1 SET max_sal = 9000 WHERE department_id = 10;

#
CREATE OR REPLACE VIEW myv2
AS
SELECT 'john' nam;

SELECT * FROM myv2;

UPDATE myv2 set nam = 'lucy';

#
CREATE OR REPLACE VIEW myv3
AS
SELECT (SELECT last_name FROM employees LIMIT 1) l;

CREATE OR REPLACE VIEW myv3
AS
SELECT last_name l FROM employees LIMIT 1;

SELECT * FROM myv3;

UPDATE myv3 set l = 'A';

#
CREATE OR REPLACE VIEW myv4
AS
SELECT last_name, department_name
FROM employees
INNER JOIN departments d ON employees.department_id = d.department_id;

UPDATE myv4 SET last_name = '张飞' WHERE last_name = 'Whalen';
INSERT INTO myv4 VALUES ('陈真', 'xxx');
DELETE FROM myv4 WHERE last_name = '张飞';

SELECT * FROM myv4;

#
CREATE OR REPLACE VIEW myv6
AS
SELECT last_name, email, salary
FROM employees
WHERE employee_id IN (SELECT manager_id FROM employees WHERE manager_id IS NOT NULL);

SELECT * FROM myv6;

UPDATE myv6 SET salary = 1000 WHERE last_name = 'K_ing';
