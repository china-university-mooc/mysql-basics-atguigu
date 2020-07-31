# 等值连接
SELECT last_name, department_name
FROM employees e
         INNER JOIN departments d ON e.department_id = d.department_id;

SELECT city, COUNT(*)
FROM departments d
INNER JOIN locations l ON d.location_id = l.location_id
GROUP BY city
HAVING COUNT(*) > 3;

SELECT department_name, COUNT(*) c
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
GROUP BY department_name
HAVING COUNT(*) > 3
ORDER BY c DESC;

SELECT last_name, department_name, job_title
FROM employees e
INNER JOIN departments d ON d.department_id = d.department_id
INNER JOIN jobs j ON j.job_id = e.job_id
ORDER BY department_name DESC;

SELECT last_name, department_name
FROM employees e
         JOIN departments d ON e.department_id = d.department_id;

# 非等值连接
SELECT last_name, grade_level
FROM employees e
JOIN job_grades g ON e.salary BETWEEN g.lowest_sal AND g.highest_sal;

SELECT last_name, grade_level
FROM employees e
         JOIN job_grades g ON e.salary BETWEEN g.lowest_sal AND g.highest_sal
ORDER BY grade_level;

SELECT COUNT(*) c, grade_level
FROM employees e
         JOIN job_grades g ON e.salary BETWEEN g.lowest_sal AND g.highest_sal
GROUP BY grade_level
HAVING COUNT(*) > 10
ORDER BY grade_level;

# 自连接
SELECT e.last_name, m.last_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;

SELECT e.last_name, m.last_name
FROM employees e
         JOIN employees m ON e.manager_id = m.employee_id
WHERE e.last_name LIKE '%k%' AND m.last_name LIKE  '%k%';

# 外连接
SELECT name, boyName
FROM beauty g
LEFT OUTER JOIN boys b ON g.boyfriend_id = b.id
WHERE b.id IS NULL;

SELECT name, boyName
FROM boys b
RIGHT OUTER JOIN beauty g ON g.boyfriend_id = b.id
WHERE b.id IS NULL;

SELECT d.department_id, COUNT(employee_id)
FROM departments d
LEFT OUTER JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id
HAVING COUNT(employee_id) = 0;

SELECT d.department_id, employee_id
FROM departments d
LEFT OUTER JOIN employees e ON d.department_id = e.department_id
WHERE employee_id IS NULL;


# 全外连接
# SELECT name, boyName
# FROM boys b
# FULL OUTER JOIN beauty g ON g.boyfriend_id = b.id

# 交叉连接

SELECT name, boyName
FROM boys b
CROSS JOIN beauty g;

SELECT * FROM beauty;
