SELECT last_name, jobs.job_id, job_title
FROM employees, jobs
WHERE employees.job_id = jobs.job_id;

SELECT e.last_name, e.job_id, j.job_title
FROM employees AS e, jobs AS j
WHERE e.job_id = j.job_id;

SELECT last_name, d.department_id, commission_pct
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.commission_pct IS NOT NULL;

SELECT COUNT(*), l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id
GROUP BY l.city;

SELECT department_name, d.manager_id, MIN(salary)
FROM departments d,
     employees e
WHERE d.department_id = e.department_id
  AND commission_pct IS NOT NULL
GROUP BY d.department_id;

# 非等值连接
SELECT last_name, salary, grade_level
FROM employees e, job_grades j
WHERE e.salary BETWEEN j.lowest_sal AND j.highest_sal;

# 自连接
SELECT e1.last_name, e2.last_name
FROM employees e1, employees e2
WHERE e1.manager_id = e2.employee_id;
