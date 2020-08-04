# 1、创建函数，实现传入两个 float，返回二者之和
use myemployees;

DROP FUNCTION myf1;

CREATE FUNCTION myf1(m FLOAT, n FLOAT) RETURNS FLOAT
BEGIN
    RETURN m + n;
END;

SELECT myf1(2, 3);


# 2、创建函数，实现传入工种名，返回该工种的员工人数
DROP FUNCTION myf2;

CREATE FUNCTION myf2(jobName VARCHAR(20)) RETURNS INT
BEGIN
    DECLARE c INT;
    SELECT COUNT(*) INTO c
        FROM employees e
        INNER JOIN jobs j ON j.job_id = e.job_id
            WHERE j.job_title = jobName;
    RETURN c;
END;

SELECT * FROM jobs;
SELECT myf2('Accounting Manager');



# 3、创建函数，实现传入员工名，返回该员工的领导名
DROP FUNCTION myf3;

CREATE FUNCTION myf3(empName VARCHAR(20)) RETURNS VARCHAR(20)
BEGIN
    DECLARE mName VARCHAR(20);

    SELECT IFNULL(m.last_name, 'null') INTO mName
           FROM employees e
    INNER JOIN employees m ON e.manager_id = m.employee_id
    WHERE e.last_name = empName;

    RETURN mName;
END;

SELECT * FROM employees;

SELECT myf3('K_ing');
