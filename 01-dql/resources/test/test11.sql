# 1.查询和 Zlotkey 相同部门的员工姓名和工资
SELECT last_name, salary
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    WHERE last_name = 'Zlotkey'
    );


# 2.查询工资比公司平均工资高的员工的员工号，姓名和工资。

SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    );


# 3.查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资

SELECT e.employee_id, e.last_name, e.salary
FROM (
         SELECT AVG(salary) ag, department_id
         FROM employees
         GROUP BY department_id
     ) a
INNER JOIN employees e ON e.department_id = a.department_id
WHERE e.salary > a.ag;

# 4.查询和姓名中包含字母 u 的员工在相同部门的员工的员工号和姓名

SELECT employee_id, last_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM employees
    WHERE last_name LIKE '%u%'
    );

# 5.查询在部门的 location_id 为 1700 的部门工作的员工的员工号

SELECT employee_id
FROM employees
WHERE department_id in (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
    );

# 6.查询管理者是 King 的员工姓名和工资
SELECT last_name, salary
FROM employees
WHERE manager_id IN (
    SELECT employee_id
    FROM employees
    WHERE last_name = 'K_ing'
    );

# 7.查询工资最高的员工的姓名，要求 first_name 和 last_name 显示为一列，列名为 姓.名

SELECT CONCAT(last_name, '.', first_name) AS `姓.名`
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    );

SELECT * FROM employees LIMIT 0, 5;
SELECT * FROM employees LIMIT 5;
