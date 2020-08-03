# 1.创建一个表，里面有 id 为主键，stuname 唯一键，seat 座位号，要求将 id 设置成自增
CREATE TABLE IF NOT EXISTS stu1(
  id INT PRIMARY KEY AUTO_INCREMENT,
  stuname VARCHAR(20) UNIQUE,
  seat INT
);

# 2.要求用事务的方式插入 3 行数据
SET autocommit = 0;
START TRANSACTION;
INSERT INTO stu1(stuname, seat) VALUES ('Tom', 1);
INSERT INTO stu1(stuname, seat) VALUES ('Jerry', 2);
INSERT INTO stu1(stuname, seat) VALUES ('Lily', 3);
COMMIT;

# 3.要求用事务的方式删除数据，并回滚
SET autocommit = 0;
START TRANSACTION;
DELETE FROM stu1;
SELECT * FROM stu1;
ROLLBACK;
