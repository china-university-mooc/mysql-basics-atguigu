SELECT last_name, salary
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE last_name = 'Abel'
);


SELECT last_name, job_id, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

SELECT MIN(salary), department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (
    SELECT MIN(salary)
    FROM employees
    WHERE department_id = 50
    );

SELECT last_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id IN (1400, 1700)
);

SELECT last_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE d.location_id IN (1400, 1700);

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY(
    SELECT salary
    FROM employees
    WHERE job_id = 'IT_PROG'
) AND job_id <> 'IT_PROG';

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE job_id = 'IT_PROG'
) AND job_id <> 'IT_PROG';



SELECT *
FROM employees
WHERE (employee_id, salary) = (
    SELECT MIN(employee_id), MAX(salary)
    FROM employees
);

SELECT *
FROM employees
WHERE employee_id = (
    SELECT MIN(employee_id) FROM employees
    )
AND salary = (
    SELECT MAX(salary) FROM  employees
    );

;

SELECT department_id, department_name,
       (
           SELECT COUNT(*)
           FROM employees
           WHERE department_id = d.department_id
       )
FROM departments d;

SELECT d.department_id, department_name, COUNT(e.department_id)
FROM departments d
LEFT OUTER JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id;

SELECT a.*, g.grade_level
FROM (
         SELECT department_id, AVG(salary) ag
         FROM employees
         GROUP BY department_id
     ) a
INNER JOIN job_grades g ON a.ag BETWEEN g.lowest_sal AND g.highest_sal;

SELECT EXISTS(SELECT employee_id FROM employees);
SELECT EXISTS(SELECT employee_id FROM employees WHERE salary = 30000);

SELECT 1 > 2;

SELECT department_name
FROM departments
WHERE department_id IN (
    SELECT DISTINCT department_id
    FROM employees
);

SELECT department_name
FROM departments d
WHERE EXISTS(
              SELECT *
              FROM employees
              WHERE department_id = d.department_id
          );

SELECT b.*
FROM boys b
WHERE NOT EXISTS(
    SELECT *
    FROM beauty
    WHERE boyfriend_id = b.id
    );
