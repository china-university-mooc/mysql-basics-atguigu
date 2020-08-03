# 脏读
#t2,                      t1
SET autocommit = 0;
UPDATE account SET balance = 1000 WHERE id = 1;
                SET autocommit = 0;
                SELECT * FROM account WHERE id = 1;
ROLLBACK;
                SELECT * FROM account WHERE id = 1;
                COMMIT;

# 不可重复读
                SET autocommit = 0;
                SELECT * FROM account WHERE id = 1;
SET autocommit = 0;
UPDATE account SET balance = 500 WHERE id = 1;
COMMIT;
                SELECT * FROM account WHERE id = 1;
                COMMIT;

# 幻读
                SET autocommit = 0;
                SELECT * FROM account;
SET autocommit = 0;
INSERT INTO account(username, balance) VALUES ('郭襄', 5000);
COMMIT;
                SELECT * FROM account;
                COMMIT;


                set autocommit=0;
                select * from account;
set autocommit = 0;
insert into account values(null, 'tom', 3);
commit;
                update account set username = 'qq';
                commit;
