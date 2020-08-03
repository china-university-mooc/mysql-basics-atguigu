#
CREATE DATABASE test;
USE test;

CREATE TABLE IF NOT EXISTS book(
  bid INT PRIMARY KEY ,
  bname VARCHAR(20) UNIQUE NOT NULL,
  price DOUBLE DEFAULT 10,
  btypeId INT,
  CONSTRAINT fk_book_bookType FOREIGN KEY(btypeId) REFERENCES bookType(id)
);

CREATE TABLE IF NOT EXISTS bookType(
  id INT PRIMARY KEY ,
  name VARCHAR(20)
);
INSERT INTO bookType VALUES (1, '科幻');
INSERT INTO bookType VALUES (2, '悬疑');

#
SET autocommit = 0;
START TRANSACTION;
INSERT INTO book(bid, bname, price, btypeId)
VALUES (1, '三体', 88, 1);
COMMIT ;

SELECT * FROM book;

#
INSERT INTO book(bid, bname, price, btypeId)
VALUES (2, '咒怨', 120, 2);

CREATE OR REPLACE VIEW myv1
AS
SELECT bname, t.name tname
FROM book b
INNER JOIN bookType t ON t.id = b.btypeId
WHERE price > 100;

SELECT * FROM myv1;

#
CREATE OR REPLACE VIEW myv1
AS
SELECT bname, price
FROM book
WHERE price BETWEEN 90 AND 120;

#
DROP VIEW test.myv1;
