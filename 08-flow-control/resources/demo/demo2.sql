USE girls;

SELECT * FROM admin;
TRUNCATE admin;

DROP PROCEDURE whilep1;
CREATE PROCEDURE whilep1(IN insertCount INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < insertCount DO
        INSERT INTO admin(username, password) VALUES (CONCAT('Rose', i), '666');
        SET i = i + 1;
    END WHILE;
END;

CREATE PROCEDURE whilep1(IN insertCount INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    a: LOOP
        INSERT INTO admin(username, password) VALUES (CONCAT('Rose', i), '666');
        SET i = i + 1;
        IF i >= insertCount THEN leave a;
        END IF;
    END LOOP a;
END;

CREATE PROCEDURE whilep1(IN insertCount INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    REPEAT
        INSERT INTO admin(username, password) VALUES (CONCAT('Rose', i), '666');
        SET i = i + 1;
    UNTIL i >= insertCount  END REPEAT;
END;

CALL whilep1(10);

#
CREATE PROCEDURE whilep2(IN insertCount INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    a: WHILE i <= insertCount DO
        INSERT INTO admin(username, password) VALUES (CONCAT('Rose', i), '666');
        IF i >= 20 THEN LEAVE a;
        END IF;
        SET i = i + 1;
    END WHILE a;
END;

CALL whilep2(40);

#
DROP PROCEDURE whilep3;
CREATE PROCEDURE whilep3(IN insertCount INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    a: WHILE i < insertCount DO
        SET i = i + 1;
        IF i % 2 = 1 THEN ITERATE a;
        END IF;
        INSERT INTO admin(username, password) VALUES (CONCAT('Rose', i), '666');
    END WHILE a;
END;

CALL whilep3(40);
