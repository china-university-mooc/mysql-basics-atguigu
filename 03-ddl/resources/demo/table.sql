CREATE DATABASE IF NOT EXISTS books;

use books;

CREATE TABLE book(
  id INT, # 编号
  bName VARCHAR(20), # 书名
  price DOUBLE, # 价格
  authorId INT, # 作者
  publishDate DATETIME # 出版日期
);

DESC book;

CREATE TABLE IF NOT EXISTS author(
  id INT,
  au_name VARCHAR(20),
  nation VARCHAR(10)
);

DESC author;

# 修改表
ALTER TABLE book CHANGE COLUMN publishDate pubDate DATETIME;
ALTER TABLE book CHANGE pubDate publicDate DATETIME;

ALTER TABLE book MODIFY COLUMN pubDate TIMESTAMP;

ALTER TABLE author ADD COLUMN annual DOUBLE;

ALTER TABLE author DROP COLUMN annual;

ALTER TABLE author RENAME TO book_author;

DESC book;
DESC author;
DESC book_author;

# 删除表
DROP TABLE book_author;

SHOW TABLES;

# 复制表
INSERT INTO author
VALUES (1, '村上春树', '日本'),
       (2, '莫言', '中国'),
       (3, '冯唐', '中国'),
       (4, '金庸', '中国');

CREATE TABLE copy LIKE author;

DESC copy;

SELECT * FROM author;
SELECT * FROM copy;

CREATE TABLE copy2
SELECT * FROM author;

SELECT * FROM copy2;

CREATE TABLE copy3
SELECT id, au_name
FROM author
WHERE nation = '中国';

SELECT * FROM copy3;

CREATE TABLE copy5
SELECT id, au_name
FROM author
WHERE 0;

SELECT * FROM copy4;

CREATE TABLE test_add(
    t1 INT,
    t2 INT,
    t3 INT
);

DESC test_add;

ALTER TABLE test_add ADD COLUMN t4 INT FIRST;
ALTER TABLE test_add ADD COLUMN t5 INT AFTER t2;
# ALTER TABLE test_add ADD COLUMN t6 INT LAST;
