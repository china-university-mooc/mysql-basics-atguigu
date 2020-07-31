# 引入

SELECT * FROM employees;

# 1
SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY salary ASC;

# 2
SELECT * FROM employees WHERE department_id >= 90 ORDER BY hiredate ASC;

# 按表达式排序
SELECT *, salary * 12 * (1 + IFNULL(commission_pct, 0)) AS 年薪
FROM employees
ORDER BY salary * 12 * (1 + IFNULL(commission_pct, 0)) DESC;

# 按别名
SELECT *, salary * 12 * (1 + IFNULL(commission_pct, 0)) AS 年薪
FROM employees
ORDER BY 年薪 DESC;

# 按函数
SELECT * FROM employees ORDER BY LENGTH(last_name) DESC;

# 多字段排序
SELECT * FROM  employees ORDER BY salary ASC, employee_id DESC;
