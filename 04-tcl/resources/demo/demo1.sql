SHOW ENGINES;

SHOW VARIABLES LIKE 'autocommit';
SET autocommit=0;


#
DROP TABLE IF EXISTS account;

CREATE TABLE IF NOT EXISTS account(
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(20),
  balance DOUBLE
);

INSERT INTO account(username, balance)
VALUES ('张无忌', 1000),
       ('赵敏', 1000);

#
SELECT * FROM account;

SET autocommit = 0;
START TRANSACTION;

UPDATE account SET balance = 500 WHERE username = '张无忌';
UPDATE account SET balance = 1500 WHERE username = '赵敏';

COMMIT;

SET autocommit = 0;
START TRANSACTION;

UPDATE account SET balance = 1000 WHERE username = '张无忌';
UPDATE account SET balance = 1000 WHERE username = '赵敏';

ROLLBACK;
