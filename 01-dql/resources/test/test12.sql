# 1
SELECT last_name, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
    );

# 2
SELECT department_id, department_name
FROM departments
WHERE department_id = (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING AVG(salary) = (
        SELECT MIN(a.ag)
        FROM (
                 SELECT department_id, AVG(salary) ag
                 FROM employees
                 GROUP BY department_id
             ) a
    )
);

SELECT d.department_id, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
GROUP BY department_id
ORDER BY AVG(salary)
LIMIT 1;

SELECT *
FROM departments
WHERE department_id = (
    SELECT department_id
    FROM employees e
    GROUP BY department_id
    ORDER BY AVG(salary)
    LIMIT 1
);

# 3
SELECT d.department_id, d.department_name, AVG(salary) avg_sal
FROM employees e
         INNER JOIN departments d ON e.department_id = d.department_id
GROUP BY department_id
ORDER BY AVG(salary)
LIMIT 1;

SELECT d.*, a.avg_sal
FROM (
         SELECT department_id, AVG(salary) avg_sal
         FROM employees e
         GROUP BY department_id
         ORDER BY AVG(salary)
         LIMIT 1
         ) a
JOIN departments d on a.department_id = d.department_id;

# 4
SELECT job_id, AVG(salary)
FROM employees
GROUP BY job_id
ORDER BY AVG(salary) DESC
LIMIT 1;

SELECT *
FROM jobs
WHERE job_id = (
    SELECT job_id
    FROM employees
    GROUP BY job_id
    ORDER BY AVG(salary) DESC
    LIMIT 1
    );

# 5

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM employees
    );

# 6

SELECT *
FROM employees
WHERE employee_id IN (
    SELECT DISTINCT manager_id
    FROM employees
    );

# 7
SELECT department_id, MAX(salary), MIN(salary)
FROM employees
GROUP BY department_id
ORDER BY MAX(salary)
LIMIT 1;

SELECT MIN(salary), department_id
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    ORDER BY MAX(salary)
    LIMIT 1
    )
GROUP BY department_id;

# 8
SELECT department_id
FROM employees
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;

SELECT manager_id
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1
    );

SELECT last_name, department_id, email, salary
FROM employees
WHERE employee_id = (
    SELECT manager_id
    FROM departments
    WHERE department_id = (
        SELECT department_id
        FROM employees
        GROUP BY department_id
        ORDER BY AVG(salary) DESC
        LIMIT 1
    )
    );

SELECT last_name, d.department_id, email, salary
FROM employees e
         INNER JOIN departments d ON e.employee_id = d.manager_id
WHERE d.department_id = (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1
);
