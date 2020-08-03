SELECT * FROM major;
SELECT * FROM stuinfo;

INSERT INTO major VALUES (1, 'Java');
INSERT INTO major VALUES (2, 'H5');

INSERT INTO stuinfo VALUES (1, '张三丰', '男', null, 19, 1);
INSERT INTO stuinfo VALUES (2, '郭襄', '女', null, 19, 2);

SELECT s.name AS stuname, m.name AS majorname
FROM stuinfo s
INNER JOIN major m ON s.majorId = m.id
WHERE s.name LIKE '张%';

CREATE VIEW v1 AS
SELECT s.name AS stuname, m.name AS majorname
FROM stuinfo s
         INNER JOIN major m ON s.majorId = m.id;

SELECT * FROM v1 WHERE stuname LIKE '张%';
