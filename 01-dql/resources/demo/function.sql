# 字符函数

SELECT LENGTH('张三丰hahaha');
# SHOW VARIABLES LIKE '%char%';
SELECT CONCAT(last_name, '_', first_name) FROM employees;
SELECT UPPER('JHon');
SELECT LOWER('JHon');
SELECT CONCAT(UPPER(last_name), ' ', LOWER(first_name)) FROM employees;

SELECT SUBSTR('李莫愁爱上了陆展元', 7) AS output;
SELECT SUBSTRING('李莫愁爱上了陆展元', 7) AS output;
SELECT SUBSTR('李莫愁爱上了陆展元', 1, 3) AS output;

SELECT CONCAT(UPPER(SUBSTR(last_name, 1, 1)), '_' , LOWER(SUBSTR(last_name, 2))) as output FROM employees;

SELECT INSTR('杨不悔爱上了殷六侠', '殷六侠');
SELECT INSTR('杨不悔殷六侠爱上了殷六侠', '殷六侠');
SELECT INSTR('杨不悔殷六侠爱上了殷六侠', '殷八侠');

SELECT TRIM('   张翠山   ');
SELECT TRIM('a' FROM 'aaa张aaa翠山aaa');
SELECT TRIM('aa' FROM 'aaa张aaa翠山aaa');

SELECT LPAD('殷素素', 10, '*') AS output;
SELECT RPAD('殷素素', 10, '*') AS output;

SELECT LPAD('殷素素', 2, '*') AS output;
SELECT RPAD('殷素素', 2, '*') AS output;

SELECT REPLACE('张无忌爱上了周芷若', '周芷若', '赵敏') AS output;
SELECT REPLACE('周芷若张无忌爱上了周芷若', '周芷若', '赵敏') AS output;

# 数学函数
SELECT ROUND(1.45);
SELECT ROUND(1.55);
SELECT ROUND(1.557, 2);

SELECT CEIL(1.01);
SELECT FLOOR(1.01);

SELECT TRUNCATE(1.699, 1);

SELECT MOD(-10, 3);
SELECT FlOOR(RAND() * 10);

# 日期函数

SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();

SELECT year(NOW());
SELECT year('1998-1-1');
SELECT year(hiredate) FROM  employees;

SELECT YEAR(hiredate) FROM  employees;
SELECT MONTH(hiredate) FROM  employees;
SELECT MONTHNAME(hiredate) FROM  employees;
SELECT DAY(hiredate) FROM  employees;

SELECT STR_TO_DATE('1998-3-2', '%Y-%c-%d');
SELECT * FROM employees WHERE hiredate = '1992-4-3';
SELECT * FROM employees WHERE hiredate = STR_TO_DATE('4-3 1992', '%c-%d %Y');

SELECT DATE_FORMAT(NOW(), '%y年%m月%d日');
SELECT last_name, DATE_FORMAT(hiredate, '%m月/%d日 %y年')
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT TIMESTAMPDIFF(YEAR, '1994-11-18', NOW());
SELECT TIMESTAMPDIFF(DAY,'2012-10-01','2013-01-13');

# 系统函数
SELECT VERSION();
SELECT DATABASE();
SELECT USER();
SELECT MD5('zhangzhao');
SELECT PASSWORD('zhangzhao');

# 流程控制函数
SELECT IF(10 > 5, '大', '小');

SELECT last_name, commission_pct, IF(commission_pct IS NULL, '没奖金，呵呵', '有奖金，哈哈')
FROM employees;

SELECT salary,
       department_id,
       CASE department_id
           WHEN 20 THEN salary * 1.1
           WHEN 30 THEN salary * 1.2
           WHEN 40 THEN salary * 1.3
           ELSE salary
           END AS new_salary
FROM employees;

SELECT salary,
       CASE
           WHEN salary > 20000 THEN 'A'
           WHEN salary > 15000 THEN 'B'
           WHEN salary > 10000 THEN 'C'
           ELSE 'D'
           END AS level
FROM employees;
