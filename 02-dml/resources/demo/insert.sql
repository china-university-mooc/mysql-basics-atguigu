SELECT * FROM beauty;

INSERT INTO beauty(id, name, sex, borndate, phone, photo, boyfriend_id)
VALUES (13, '唐艺昕', '女', '1990-4-23', '18988888888', NULL, 2);

INSERT INTO beauty(id, name, phone)
VALUES (14, '古力娜扎', '13899999999');

INSERT INTO beauty
VALUES (15, '唐二昕', '女', '1990-4-23', '18988888888', NULL, 2);

INSERT INTO beauty(id, name, phone)
SELECT 26, '宋茜', '110';

INSERT INTO beauty
SET id = 16, name = '刘涛', phone = '999';
