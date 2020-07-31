# 一、查询编号>3 的女神的男朋友信息，如果有则列出详细，如果没有，用 null 填充
SELECT g.id, g.name, b.*
FROM beauty g
LEFT OUTER JOIN boys b ON g.boyfriend_id = b.id
WHERE g.id > 3;

# 二、查询哪个城市没有部门
SELECT l.city, d.location_id
FROM locations l
LEFT OUTER JOIN departments d ON l.location_id = d.location_id
WHERE d.location_id IS NULL;

# 三、查询部门名为 SAL 或 IT 的员工信息
SELECT d.department_id,d.department_name, e.*
FROM employees e
RIGHT OUTER JOIN  departments d ON e.department_id = d.department_id
WHERE d.department_name IN ('SAL', 'IT');
