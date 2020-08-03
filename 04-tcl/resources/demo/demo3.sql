# savepoint

SET autocommit = 0;
DELETE FROM account WHERE id = 1;
SAVEPOINT a;
DELETE FROM account WHERE id = 2;
ROLLBACK TO a;

SELECT * FROM account;
