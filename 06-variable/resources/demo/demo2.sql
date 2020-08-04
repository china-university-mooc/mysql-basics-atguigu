USE myemployees;

SET @name = 'john';
SET @name = 100;
SET @count = 1;

SELECT COUNT(*) INTO @count
FROM employees;

SELECT @count;
SELECT @name;

SET @price := 100;
SELECT @price;

SELECT @id := 2;
SELECT @id;

#
SET @m = 1;
SET @n = 2;
SET @sum = @m + @n;
SELECT @sum;

#
DECLARE m INT DEFAULT 1;
DECLATE n INT DEFAULT 2;
DECLATE sum INT;
SET sum = m + n;
SELECT sum;

