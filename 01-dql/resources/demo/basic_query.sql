# 基础查询
USE myemployees;

# 查询字段
SELECT last_name FROM employees;
SELECT last_name,salary,email FROM employees;
SELECT * FROM employees;

# 查询常量值
SELECT 100;
SELECT 'a';

# 查询表达式
SELECT 100*99;

# 查询函数
SELECT version();
SELECT DATABASE();

# 起别名
SELECT 100*99 AS "out put";
SELECT 100*99 product;

# 去重
SELECT DISTINCT department_id FROM employees;
SELECT DISTINCT department_id, job_id FROM employees;

# 字符串拼接
SELECT CONCAT(last_name, ' ', first_name) AS `name` FROM employees;
SELECT CONCAT('a','b','c') result;

SELECT ISNULL(commission_pct), commission_pct FROM employees;
