# 1. 创建表 dept1
CREATE TABLE IF NOT EXISTS dept1(
  id INT(7),
  name VARCHAR(25)
);

DESC dept1;

# 2. 将表 departments 中的数据插入新表 dept2 中
SELECT * FROM departments;

INSERT INTO dept1
SELECT department_id, department_name
FROM departments;

CREATE TABLE dept2
    SELECT department_id, department_name
FROM departments;

SELECT * FROM dept1;
SELECT * FROM dept2;

# 3. 创建表 emp5

CREATE TABLE emp5(
  id INT(7),
  First_name VARCHAR(25),
  Last_name VARCHAR(25),
  Dept_id INT(7)
);

DESC emp5;
# 4. 将列 Last_name 的长度增加到 50
ALTER TABLE emp5 MODIFY COLUMN Last_name INT(50);

# 5. 根据表 employees 创建 employees2
CREATE TABLE employees3 LIKE employees;
DESC employees3;

CREATE TABLE employees2
SELECT * FROM employees;

SELECT * FROM employees2;

# 6. 删除表 emp5
# TRUNCATE TABLE emp5;
DROP TABLE IF EXISTS emp5;

# 7. 将表 employees2 重命名为 emp5
ALTER TABLE employees2 RENAME TO emp5;
# 8 在表 dept 和 emp5 中添加新列 test_column，并检查所作的操作
ALTER TABLE emp5 ADD COLUMN test_column VARCHAR(10);
DESC emp5;

# 9.直接删除表 emp5 中的列 dept_id
ALTER TABLE emp5 DROP COLUMN department_id;
