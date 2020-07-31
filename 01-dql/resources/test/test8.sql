SELECT MAX(salary), AVG(salary)
FROM employees;

SELECT employee_id, job_id, last_name, department_id, salary
FROM employees
ORDER BY department_id DESC, salary;

SELECT *
FROM employees
WHERE job_id LIKE '%a%e%';

# SELECT s.name, g.name, score
# FROM student s, grade g, result r
# WHERE s.gradeId = g.id AND s.id = r.studentNo;

# NOW(), TRIM(), SUBSTR()
