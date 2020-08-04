# 分库分表创建
USE test;

CREATE PROCEDURE mycreate(IN tableName VARCHAR(20), IN tableCount INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < tableCount DO
        SET @table = CONCAT(tableName, '_', i);
        SET @sql = CONCAT('CREATE TABLE ', @table, '(id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(20) NOT NULL );');
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        SET i = i + 1;
    END WHILE;
END;

CALL mycreate('stu', 20);
