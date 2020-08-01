CREATE TABLE tab_date(
  t1 DATETIME,
  s2 TIMESTAMP
);

DESC tab_date;

INSERT INTO tab_date VALUES (NOW(), NOW());

TRUNCATE TABLE tab_date;

SELECT * FROM tab_date;

SHOW VARIABLES LIKE 'time_zone';

SET time_zone='+9:00';
SET time_zone='SYSTEM';
