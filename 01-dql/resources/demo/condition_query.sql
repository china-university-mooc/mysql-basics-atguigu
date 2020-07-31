# 条件表达式
SELECT * FROM employees WHERE salary>12000;

SELECT last_name, department_id FROM  employees WHERE department_id <> 90;
SELECT last_name, department_id FROM  employees WHERE department_id != 90;

# 逻辑表达式
SELECT last_name, salary, commission_pct FROM employees WHERE salary >= 10000 AND salary <= 20000;

SELECT * FROM employees WHERE NOT (department_id >= 90 AND department_id <= 110) OR salary>15000;

# 复杂筛选

SELECT * FROM employees WHERE last_name LIKE '%a%';
SELECT last_name, salary FROM employees WHERE last_name LIKE '__n_l%';
SELECT department_id FROM employees WHERE department_id LIKE '1__';

SELECT * FROM employees WHERE employee_id BETWEEN 100 AND 120;
SELECT * FROM employees WHERE employee_id BETWEEN 120 AND 100;

SELECT last_name, job_id FROM employees WHERE job_id IN ('IT_PROG', 'AD_VP', 'AD_PRES');

SELECT last_name, commission_pct FROM employees WHERE commission_pct IS NULL;
SELECT last_name, commission_pct FROM employees WHERE commission_pct IS NOT NULL;

# 安全等于
SELECT last_name, commission_pct FROM employees WHERE commission_pct <=> NULL;
SELECT last_name, salary FROM employees WHERE salary <=> 12000;

# 转义
SELECT last_name FROM employees WHERE last_name LIKE '_\_%';
SELECT last_name FROM employees WHERE last_name LIKE '_$_%' ESCAPE '$';
