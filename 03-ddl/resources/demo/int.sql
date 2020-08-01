DROP TABLE IF EXISTS tab_int;
CREATE TABLE tab_int(
  c1 INT(7) ZEROFILL,
  c2 INT(7) ZEROFILL
);

DESC tab_int;

INSERT INTO tab_int VALUES (-123456, -123456);
INSERT INTO tab_int VALUES (214748364, 429496729);
INSERT INTO tab_int VALUES (123, 123);

INSERT INTO tab_int(c1) VALUES (-123456);

SELECT * FROM tab_int;

# 小数
DROP TABLE IF EXISTS tab_float;
CREATE TABLE tab_float(
  f1 FLOAT(5, 2),
  f2 DOUBLE(5, 2),
  f3 DECIMAL(5, 2)
);
CREATE TABLE tab_float(
    f1 FLOAT,
    f2 DOUBLE,
    f3 DECIMAL
);

DESC tab_float;
SELECT * FROM tab_float;

INSERT INTO tab_float VALUES (123.4523, 123.4523, 123.4523);
INSERT INTO tab_float VALUES (123.456, 123.456, 123.456);
INSERT INTO tab_float VALUES (123.4, 123.4, 123.4);
# 报错
INSERT INTO tab_float VALUES (1523.4, 1523.4, 1523.4);

# 字符
DROP TABLE IF EXISTS tab_car;
CREATE TABLE tab_car(
    c1 char(3),
    c2 varchar(3)
);

CREATE TABLE tab_car(
    c1 char,
    c2 varchar(3)
);
DESC tab_car;
SELECT * FROM tab_car;

INSERT INTO tab_car VALUES ('小阔爱', 'abc');
INSERT INTO tab_car VALUES ('小阔爱', 'abcd');

CREATE TABLE tab_enum(
  sex enum('男', '女')
);

DESC tab_enum;
SELECT * FROM tab_enum;

INSERT INTO tab_enum VALUES ('男');
INSERT INTO tab_enum VALUES ('好');


CREATE TABLE tab_set(
  s set('a', 'b', 'c')
);

INSERT INTO tab_set VALUES ('a,b');

SELECT * FROM tab_set;
