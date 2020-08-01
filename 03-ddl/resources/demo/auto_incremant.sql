CREATE TABLE tab_identity(
  id INT PRIMARY KEY,
  name VARCHAR(20)
);

INSERT INTO tab_identity VALUES (2, 'Tom');

TRUNCATE TABLE tab_identity;
INSERT INTO tab_identity VALUES (NULL, 'Tom');

SELECT * FROM tab_identity;

DROP TABLE IF EXISTS tab_identity;
CREATE TABLE tab_identity(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20)
);
DESC tab_identity;

SHOW VARIABLES LIKE '%auto_increment%';

SET auto_increment_increment=3;
SET auto_increment_offset=2;

SET auto_increment_increment=1;
SET auto_increment_offset=1;

DROP TABLE IF EXISTS tab_identity;
CREATE TABLE tab_identity(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id2 INT UNIQUE AUTO_INCREMENT,
    name VARCHAR(20)
);
DESC tab_identity;

DROP TABLE IF EXISTS tab_identity;
CREATE TABLE tab_identity(
    id INT PRIMARY KEY,
    name VARCHAR(20)
);
DESC tab_identity;

ALTER TABLE tab_identity MODIFY COLUMN id INT AUTO_INCREMENT;

ALTER TABLE tab_identity MODIFY COLUMN id INT;
