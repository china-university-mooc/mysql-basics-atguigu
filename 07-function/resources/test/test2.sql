use girls;

SELECT DATE_FORMAT(now(), '%y年%m月%d日');

DELIMITER $
CREATE PROCEDURE testp1(IN myDate DATETIME, OUT strDate VARCHAR(20))
BEGIN
    SELECT DATE_FORMAT(myDate, '%y年%m月%d日') INTO strDate;
END $

CALL testp1(NOW(), @strDate)$
SELECT @strDate $

# 5、创建存储过程或函数实现传入女神名称，返回:女神 and 男神 格式的字符串 如 传入 :小昭
# 返回: 小昭 and 张无忌
DROP PROCEDURE testp2$
CREATE PROCEDURE testp2(IN beautyName VARCHAR(20), OUT str VARCHAR(40))
BEGIN
    SELECT CONCAT(b.name, ' and ', IFNULL(bo.boyName, 'null')) INTO str
           FROM beauty b
    LEFT JOIN boys bo ON bo.id = b.boyfriend_id
    WHERE b.name = beautyName;
END $

CALL testp2('小昭', @str)$
CALL testp2('柳岩', @str)$
SELECT @str$

# 6、创建存储过程或函数，根据传入的条目数和起始索引，查询 beauty 表的记录
CREATE PROCEDURE testp3(IN offset INT, IN size INT)
BEGIN
    SELECT *
        FROM beauty
            LIMIT offset, size;
END $

CALL testp3(0, 3)$
