DELETE b
FROM beauty b
         INNER JOIN boys bo ON bo.id = b.boyfriend_id
WHERE bo.boyName = '张无忌';

SELECT *
FROM beauty b
         INNER JOIN boys bo ON bo.id = b.boyfriend_id
WHERE bo.boyName = '黄晓明';

DELETE b, bo
FROM beauty b
         INNER JOIN boys bo ON bo.id = b.boyfriend_id
WHERE bo.boyName = '黄晓明';

SELECT * FROM boys;
SELECT * FROM beauty;

DESC boys;
INSERT INTO boys(boyName, userCP) VALUES ('刘备', 200);

DELETE FROM boys;

INSERT INTO boys(boyName, userCP)
VALUES ('张飞', 100),
       ('刘备', 200),
       ('关羽', 300);

TRUNCATE TABLE boys;
