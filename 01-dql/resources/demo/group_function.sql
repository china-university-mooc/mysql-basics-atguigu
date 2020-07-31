SELECT SUM(salary) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT MIN(salary) FROM employees;
SELECT MAX(salary) FROM employees;
SELECT COUNT(salary) FROM employees;

SELECT COUNT(commission_pct) FROM employees;

SELECT AVG(commission_pct) FROM employees;
SELECT AVG(commission_pct) FROM employees WHERE commission_pct IS NOT NULL;

SELECT SUM(DISTINCT salary), SUM(salary) FROM employees;
SELECT COUNT(DISTINCT salary) FROM employees;

SELECT COUNT(*) FROM employees;
SELECT COUNT(1) FROM employees;
