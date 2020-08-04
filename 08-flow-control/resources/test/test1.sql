# 1、已知表 stringcontent 其中字段:
# id 自增长
# content varchar(20)
# 向该表插入指定个数的，随机的字符串

USE test;

CREATE TABLE IF NOT EXISTS strcontent(
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(20) NOT NULL
);

SELECT * FROM strcontent;
TRUNCATE strcontent;
DELETE FROM strcontent;

DROP PROCEDURE myinsert;
CREATE PROCEDURE myinsert(IN insertCount INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE len INT DEFAULT 10;
    DECLARE j INT DEFAULT 0;
    DECLARE cont VARCHAR(20);
    DECLARE idx INT;
    DECLARE str VARCHAR(26) DEFAULT 'abcdefghigklmnopqrstuvwxyz';
    WHILE i < insertCount DO

        SET len = FLOOR(RAND() * 20) + 1;
        SET j = 0;
        SET cont = '';
        WHILE j <len DO
            SET idx = FLOOR(RAND() * 26) + 1;
            SET cont = CONCAT(cont, SUBSTR(str, idx, 1));
            SET j = j + 1;
        END WHILE;

        INSERT INTO strcontent(content) VALUES (cont);
        SET i = i + 1;
    END WHILE;
END;

CALL myinsert(100);
