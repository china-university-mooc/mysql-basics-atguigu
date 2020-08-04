# 1
USE girls;

SELECT * FROM admin;

DELIMITER $
CREATE PROCEDURE myp8(IN username VARCHAR(10), IN password VARCHAR(20))
BEGIN
    INSERT INTO admin(admin.username, admin.password) VALUES (username, password);
END $

CALL myp8('jerry', '1111')$

#
CREATE PROCEDURE myp9(IN id INT, OUT name VARCHAR(50), OUT phone VARCHAR(11))
BEGIN
    SELECT b.name, b.phone INTO name, phone
    FROM beauty b
    WHERE b.id = id;
END $

CALL myp9(2, @name, @phone)$
SELECT @name, @phone$

#
CREATE PROCEDURE myp11(IN d1 DATETIME, IN d2 DATETIME, OUT res CHAR(1))
BEGIN
    DECLARE diff INT;
    SET diff = DATEDIFF(d1, d2);
    SET res = IF(diff > 0, '大', '小');
END $

CALL myp11('2024-9-1', '2022-9-1', @res)$
    SELECT @res;
