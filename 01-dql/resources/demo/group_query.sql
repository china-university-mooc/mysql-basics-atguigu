SELECT MAX(salary), job_id
FROM employees
GROUP BY job_id;

SELECT AVG(salary), department_id
FROM employees
WHERE email LIKE '%e%'
GROUP BY department_id;

SELECT COUNT(*) count, department_id
FROM employees
GROUP BY department_id
HAVING count > 2;

SELECT max(salary) AS max_sal, job_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id
HAVING max_sal > 12000;

SELECT min(salary), manager_id
FROM employees
WHERE manager_id > 102
GROUP BY manager_id
HAVING min(salary) > 5000;

# 按表达式或函数分组

SELECT COUNT(*) AS count, LENGTH(last_name) AS len_name
FROM employees
GROUP BY LENGTH(last_name)
HAVING COUNT(*) > 5;


SELECT COUNT(*) AS count, LENGTH(last_name) AS len_name
FROM employees
GROUP BY len_name
HAVING count > 5;

SELECT ROUND(AVG(salary), 2) AS avg, department_id, job_id
FROM employees
GROUP BY job_id, department_id
ORDER BY avg DESC;
