# 1. 运行以下脚本创建表 my_employees
USE myemployees;
Create table my_employees(
    Id int(10),
    First_name varchar(10), Last_name varchar(10), Userid varchar(10), Salary double(10,2)
);
create table users(
    id int,
    userid varchar(10), department_id int
);

# 2. 显示表 my_employees 的结构
DESC my_employees;

# 3. 向 my_employees 表中插入下列数据

INSERT INTO my_employees(id, First_name, Last_name, Userid, Salary)
VALUES (1, 'patel', 'Ralph', 'Rpatel', 895),
       (2, 'Dancs', 'Berry', 'Bdancs', 860),
       (3, 'Biri', 'Ben', 'Bbiri', 1100),
       (4, 'Newman', 'Chad', 'Cnewman', 750),
       (5, 'Ropeburn', 'Audrey', 'Aropebur', 1550);

# 4. 向 users 表中插入数据
INSERT INTO users(id, userid, department_id)
VALUES (1, 'Rpatel', 10),
       (2, 'Bdancs', 10),
       (3, 'Bbiri', 20),
       (4, 'Cnewman', 30),
       (5, 'Aropebur', 40);

# 5.将 3 号员工的 last_name 修改为“drelxer”
SELECT last_name FROM my_employees WHERE id = 3;

UPDATE my_employees
SET Last_name = 'drelxer'
WHERE id = 3;

# 6.将所有工资少于 900 的员工的工资修改为 1000
UPDATE my_employees
SET Salary = 1000
WHERE Salary < 900;

SELECT * FROM my_employees;

# 7.将 userid 为 Bbiri 的 user 表和 my_employees 表的记录全部删除
DELETE e, u
FROM my_employees e
INNER JOIN users u ON e.Userid = u.userid
WHERE u.userid = 'Bbiri';

SELECT * FROM users;
SELECT * FROM my_employees;

# 8.删除所有数据
DELETE FROM my_employees;
DELETE FROM users;

# 9.检查所作的修正
SELECT * FROM users;
SELECT * FROM my_employees;

# 10.清空表 my_employees
TRUNCATE TABLE my_employees;

