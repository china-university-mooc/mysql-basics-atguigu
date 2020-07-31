# 1. 查询公司员工工资的最大值，最小值，平均值，总和
SELECT MAX(salary)           AS max_sal,
       MIN(salary)           AS min_sal,
       ROUND(AVG(salary), 2) AS avg_sal,
       SUM(salary)           AS sum_sal
FROM employees;

# 2. 查询员工表中的最大入职时间和最小入职时间的相差天数 (DIFFRENCE)
SELECT DATEDIFF(MAX(hiredate), MIN(hiredate)) AS difference FROM employees;
SELECT DATEDIFF(NOW(), '1994-11-18');
SELECT DATE(NOW());
SELECT TIME(NOW());

# 3. 查询部门编号为 90 的员工个数
SELECT COUNT(*) FROM employees WHERE department_id = 90;
