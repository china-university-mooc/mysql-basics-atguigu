use myemployees;

DELIMITER $;

DROP FUNCTION myf1;

#
CREATE FUNCTION myf1() RETURNS INT
BEGIN
    DECLARE c INT DEFAULT 0;
    SELECT COUNT(*) INTO c FROM employees;

    RETURN c;
END $;

SELECT myf1();

#
DROP FUNCTION myf2;
CREATE FUNCTION myf2(empName VARCHAR(20)) RETURNS DOUBLE
BEGIN
    SET @sal = 0;
    SELECT employees.salary INTO @sal FROM employees
        WHERE last_name = empName;

    RETURN @sal;
END $;

SELECT myf2('Kochhar');

#
DROP FUNCTION myf3;
CREATE FUNCTION myf3(deptName VARCHAR(20)) RETURNS DOUBLE
BEGIN
    DECLARE sal DOUBLE;
    SELECT AVG(salary) INTO sal
    FROM employees e
    INNER JOIN departments d ON d.department_id = e.department_id
    WHERE department_name = deptName;

    RETURN sal;
END $;

SELECT myf3('Acc');
SELECT myf3('IT');

SHOW CREATE FUNCTION myf3;

DROP FUNCTION myf3;
