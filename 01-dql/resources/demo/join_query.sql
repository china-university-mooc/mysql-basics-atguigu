# 等值连接
SELECT * FROM beauty;
SELECT * FROM boys;

SELECT name, boyName FROM beauty, boys;

SELECT name, boyName FROM beauty, boys
WHERE beauty.boyfriend_id = boys.id;

# 非等值连接

