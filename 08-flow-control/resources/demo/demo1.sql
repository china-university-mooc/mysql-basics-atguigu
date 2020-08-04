DROP PROCEDURE testp1;

CREATE PROCEDURE testp1(IN score INT)
BEGIN
    CASE
        WHEN score >= 90 THEN SELECT 'A';
        WHEN score >= 80 THEN SELECT 'B';
        WHEN score >= 60 THEN SELECT 'C';
        ELSE SELECT 'D';
    END CASE;
END;

CALL testp1(85);
CALL testp1(101);

#
DROP FUNCTION testf1;

CREATE FUNCTION testf1(score INT) RETURNS CHAR(1)
BEGIN
    IF score >= 90 THEN RETURN 'A';
    ELSEIF score >= 80 THEN RETURN 'B';
    ELSEIF score >= 60 THEN RETURN 'C';
    ELSE RETURN 'D';
    END IF;
END;

SELECT testf1('55');

UNTIL
