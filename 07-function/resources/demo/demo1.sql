USE girls;

SELECT * FROM admin;
SELECT * FROM beauty;

DELIMITER $
CREATE PROCEDURE myp1()
BEGIN
    INSERT INTO admin(username, password)
    VALUES ('john1', '0000'),
           ('lily', '0001'),
           ('lucy', '0001'),
           ('jack', '0001'),
           ('tom', '0001');
END $

CALL myp1()$


#
CREATE PROCEDURE myp2(IN beautyName VARCHAR(20))
BEGIN
    SELECT bo.*
    FROM boys bo
    RIGHT JOIN beauty b ON b.boyfriend_id = bo.id
    WHERE b.name = beautyName;
END $

CALL myp2('小昭')$

#
CREATE PROCEDURE myp3(IN username VARCHAR(20), IN password VARCHAR(20))
BEGIN
    DECLARE result VARCHAR(20) DEFAULT '';
    SELECT COUNT(*) INTO result
    FROM admin
    WHERE admin.username = username AND admin.password = password;

    SELECT result;
END $

CALL myp3('Tom', '0001')$

CREATE PROCEDURE myp0(IN username VARCHAR(20), IN password VARCHAR(20))
BEGIN
    DECLARE result INT DEFAULT 0;
    SELECT COUNT(*) INTO result
    FROM admin
    WHERE admin.username = username AND admin.password = password;

    SELECT IF(result > 0, '登录成功', '登录失败');
END $

CALL myp4('Tom', '0001')$
CALL myp4('Tom', '0000')$

#
CREATE PROCEDURE myp5(IN beautyName VARCHAR(20), OUT boyName VARCHAR(20))
BEGIN
    SELECT bo.boyName INTO boyName
        FROM boys bo
    RIGHT JOIN beauty b ON b.boyfriend_id = bo.id
    WHERE b.name = beautyName;
END$

CALL myp5('小昭', @boyName)$
SELECT @boyName$

#
CREATE PROCEDURE myp6(IN beautyName VARCHAR(20), OUT boyName VARCHAR(20), OUT userCP INT)
BEGIN
    SELECT bo.boyName, bo.userCP INTO boyName, userCP
    FROM boys bo
             RIGHT JOIN beauty b ON b.boyfriend_id = bo.id
    WHERE b.name = beautyName;
END $

CALL myp6('小昭', @boyName, @userCP)$
SELECT @boyName, @userCP$

#
CREATE PROCEDURE myp7(INOUT a INT, INOUT b INT)
BEGIN
    SET a = 2 * a;
    SET b = 2 * b;
END $

SET @a := 1;
SET @b := 2;
CALL myp7(@a, @b)$
SELECT @a, @b;

