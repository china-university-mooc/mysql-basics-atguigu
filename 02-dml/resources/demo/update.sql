SELECT * FROM beauty WHERE name LIKE '唐%';

UPDATE beauty
SET phone = '119'
WHERE name LIKE '唐%';

# 修改张无忌的女朋友的手机号为114
UPDATE boys b
INNER JOIN beauty g ON b.id = g.boyfriend_id
SET g.phone = 114
WHERE b.boyName = '张无忌';

SELECT b.*, g.*
FROM boys b
    INNER JOIN beauty g ON b.id = g.boyfriend_id
    WHERE b.boyName = '张无忌';

SELECT * FROM beauty;

SELECT b.*, bo.*
FROM beauty b
LEFT OUTER JOIN boys bo ON b.boyfriend_id = bo.id
# WHERE bo.id IS NULL;

UPDATE beauty b
         LEFT OUTER JOIN boys bo ON b.boyfriend_id = bo.id
SET b.boyfriend_id = 2
WHERE bo.id IS NULL;

SELECT * FROM beauty WHERE phone LIKE '%9';

DELETE FROM beauty WHERE phone LIKE '%9';

SELECT *
FROM beauty b
INNER JOIN boys bo ON bo.id = b.boyfriend_id
WHERE bo.boyName = '张无忌';
