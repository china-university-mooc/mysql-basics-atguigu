SHOW GLOBAL VARIABLES ;

SHOW GLOBAL VARIABLES LIKE '%char%';

SELECT @@global.autocommit;
SELECT @@session.autocommit;
SELECT @@global.tx_isolation;

SET @@global.autocommit = 0;
SET @@global.autocommit = 1;


#
SHOW SESSION VARIABLES;
SHOW VARIABLES ;

SHOW VARIABLES LIKE '%char%';
SHOW SESSION VARIABLES LIKE '%char%';

SELECT @@tx_isolation;
SELECT @@session.tx_isolation;

SET @@tx_isolation = 'read-uncommitted';
SET @@session.tx_isolation = 'read-uncommitted';

SET SESSION tx_isolation = 'read-committed';


