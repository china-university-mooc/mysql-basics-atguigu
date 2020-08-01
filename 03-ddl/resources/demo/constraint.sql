SHOW DATABASES ;

CREATE DATABASE IF NOT EXISTS students;

USE students;

DROP TABLE IF EXISTS stuinfo;
CREATE TABLE stuinfo(
    id INT PRIMARY KEY, # 主键
    name VARCHAR(20) NOT NULL, # 非空
    gender CHAR(1) CHECK(gender = '男' OR gender = '女'), # 检查
    seat INT UNIQUE, # 唯一
    age INT DEFAULT 18, # 默认
    majorId INT REFERENCES major(id) # 外键
);

DESC stuinfo;
SHOW INDEX FROM stuinfo;

CREATE TABLE major(
    id INT PRIMARY KEY ,
    name VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS stuinfo;

CREATE TABLE stuinfo (
    id      INT,
    name    VARCHAR(20),
    gender  CHAR(1),
    seat    INT,
    age     INT,
    majorId INT,
    CONSTRAINT pk PRIMARY KEY (id),                                        # 主键
    CONSTRAINT uk UNIQUE (seat),                                           # 唯一键
    CONSTRAINT ck CHECK ( gender = '男' OR gender = '女'),                   # 检查
    CONSTRAINT fk_suinfo_major FOREIGN KEY (majorId) REFERENCES major (id) # 外键
);

DESC stuinfo;
SHOW INDEX FROM stuinfo;

CREATE TABLE stuinfo (
    id      INT,
    name    VARCHAR(20),
    gender  CHAR(1),
    seat    INT,
    age     INT,
    majorId INT,
    PRIMARY KEY (id),                                        # 主键
    UNIQUE (seat),                                           # 唯一键
    CHECK ( gender = '男' OR gender = '女'),                   # 检查
    FOREIGN KEY (majorId) REFERENCES major (id) # 外键
);

CREATE TABLE stuinfo(
    id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    gender CHAR(1),
    seat INT UNIQUE,
    age INT DEFAULT 18,
    majorId INT,
    CONSTRAINT fk_stuinfo_major FOREIGN KEY(majorId) REFERENCES major(id)
);

INSERT INTO major VALUES (1, 'Java');
INSERT INTO major VALUES (2, 'H5');

INSERT INTO stuinfo VALUES (1, 'john', '男', null, 19, 1);
INSERT INTO stuinfo VALUES (2, 'lily', '女', null, 19, 2);

SELECT * FROM students.stuinfo;

DROP TABLE IF EXISTS students.stuinfo;
CREATE TABLE stuinfo(
    id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    gender CHAR(1),
    seat INT UNIQUE,
    seat2 INT PRIMARY KEY,
    age INT DEFAULT 18,
    majorId INT,
    CONSTRAINT fk_stuinfo_major FOREIGN KEY(majorId) REFERENCES major(id)
);
DESC students.stuinfo;


DROP TABLE IF EXISTS students.stuinfo;
CREATE TABLE stuinfo(
    id INT,
    name VARCHAR(20) NOT NULL,
    gender CHAR(1),
    seat INT,
    seat2 INT,
    age INT DEFAULT 18,
    majorId INT,
    PRIMARY KEY (id, name),
    UNIQUE (seat, seat2),
    CONSTRAINT fk_stuinfo_major FOREIGN KEY(majorId) REFERENCES major(id)
);
DESC students.stuinfo;
SHOW INDEX FROM students.stuinfo;

DROP TABLE IF EXISTS students.major;
CREATE TABLE major(
    id INT UNIQUE ,
    name VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS students.stuinfo;
CREATE TABLE stuinfo(
    id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    gender CHAR(1),
    seat INT UNIQUE,
    age INT DEFAULT 18,
    majorId DOUBLE,
    CONSTRAINT fk_stuinfo_major FOREIGN KEY(majorId) REFERENCES major(id)
);
DESC students.stuinfo;


DROP TABLE IF EXISTS students.stuinfo;
CREATE TABLE stuinfo(
    id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE DEFAULT 'Jhon',
    gender CHAR(1),
    seat INT UNIQUE,
    age INT DEFAULT 18,
    majorId INT,
    CONSTRAINT fk_stuinfo_major FOREIGN KEY(majorId) REFERENCES major(id)
);
DESC students.stuinfo;

# 修改表时添加约束
DROP TABLE IF EXISTS students.stuinfo;
CREATE TABLE stuinfo(
    id INT,
    name VARCHAR(20),
    gender CHAR(1),
    seat INT,
    age INT,
    majorId INT
);
DESC students.stuinfo;
SHOW INDEX FROM students.stuinfo;

ALTER TABLE stuinfo MODIFY COLUMN name VARCHAR(20) NOT NULL;
ALTER TABLE stuinfo MODIFY COLUMN age INT DEFAULT 18;
ALTER TABLE stuinfo MODIFY COLUMN id INT PRIMARY KEY;
ALTER TABLE stuinfo MODIFY COLUMN seat INT UNIQUE;

ALTER TABLE stuinfo MODIFY COLUMN name VARCHAR(20);
ALTER TABLE stuinfo MODIFY COLUMN id INT;
ALTER TABLE stuinfo MODIFY COLUMN seat INT;

ALTER TABLE stuinfo ADD PRIMARY KEY(id);
ALTER TABLE stuinfo ADD UNIQUE(seat);
ALTER TABLE stuinfo ADD CONSTRAINT fk_stuinfo_major FOREIGN KEY(majorId) REFERENCES major(id);

# 删除约束
ALTER TABLE stuinfo MODIFY COLUMN name VARCHAR(20);
ALTER TABLE stuinfo MODIFY COLUMN age INT;
ALTER TABLE students.stuinfo DROP PRIMARY KEY;
ALTER TABLE students.stuinfo DROP INDEX seat;
ALTER TABLE students.stuinfo DROP FOREIGN KEY fk_stuinfo_major;
