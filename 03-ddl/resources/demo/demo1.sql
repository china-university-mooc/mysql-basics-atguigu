use students;

SHOW INDEX FROM major;
SHOW INDEX FROM stuinfo;
DESC stuinfo;
SHOW CREATE TABLE stuinfo;

ALTER TABLE stuinfo DROP FOREIGN KEY fk_stuinfo_major;
ALTER TABLE stuinfo DROP INDEX fk_stuinfo_major;

ALTER TABLE stuinfo ADD CONSTRAINT fk_stuinfo_major FOREIGN KEY (majorId) REFERENCES major(id);

TRUNCATE stuinfo;

INSERT INTO major VALUES (3, '大数据');
INSERT INTO stuinfo
SELECT 1, 'john1', '女', NULL, NULL, 1 UNION ALL
SELECT 2, 'john2', '女', NULL, NULL, 1 UNION ALL
SELECT 3, 'john3', '女', NULL, NULL, 2 UNION ALL
SELECT 4, 'john4', '女', NULL, NULL, 2 UNION ALL
SELECT 5, 'john5', '女', NULL, NULL, 1 UNION ALL
SELECT 6, 'john6', '女', NULL, NULL, 3 UNION ALL
SELECT 7, 'john7', '女', NULL, NULL, 3 UNION ALL
SELECT 8, 'john8', '女', NULL, NULL, 1;

#
DELETE FROM major WHERE id = 3;

SELECT * FROM major;
SELECT * FROM stuinfo;

# 级联删除
ALTER TABLE stuinfo ADD CONSTRAINT fk_stuinfo_major FOREIGN KEY (majorId) REFERENCES major(id) ON DELETE CASCADE;

DELETE FROM major WHERE id = 3;

# 级联置空
ALTER TABLE stuinfo ADD CONSTRAINT fk_stuinfo_major FOREIGN KEY (majorId) REFERENCES major(id) ON DELETE SET NULL ;

DELETE FROM major WHERE id = 2;
