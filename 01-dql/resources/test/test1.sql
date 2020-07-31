# 1. 下面的语句是否可以执行成功
SELECT last_name, job_id, salary AS sal
FROM employees;

# 2. 下面的语句是否可以执行成功
SELECT *
FROM employees;

# 3. 找出下面语句中的错误
SELECT employee_id,
       last_name,
       salary * 12 AS "ANNUAL SALARY"
FROM employees;

# 4. 显示表 departments 的结构，并查询其中的全部数据
DESC departments;
SELECT *
FROM departments;

# 5. 显示出表 employees 中的全部 job_id(不能重复)
SELECT DISTINCT job_id
FROM employees;

# 6. 显示出表 employees 的全部列，各个列之间用逗号连接，列头显示成 OUT_PUT
SELECT IFNULL(commission_pct, 0) AS pct, commission_pct FROM employees;

SELECT CONCAT(employee_id, ',', first_name, ',', last_name, ',', email, ',', phone_number, ',',
              job_id, ',', salary, ',', IFNULL(commission_pct, 0), ',', manager_id, ',', department_id, ',',
              hiredate) AS OUT_PUT
FROM employees;
