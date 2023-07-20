CREATE USER 'jim'@'localhost' IDENTIFIED BY '123456';
SELECT USER FROM mysql.user;

RENAME USER 'jim'@'localhost' TO 'Renjingpu'@'localhost';
SELECT USER FROM mysql.user;

ALTER USER 'Renjingpu'@'localhost' IDENTIFIED BY '666666';

GRANT ALL PRIVILEGES ON xskc.Student TO 'Renjingpu'@'localhost';
SHOW GRANTS FOR 'Renjingpu'@'localhost';

GRANT INSERT, DELETE, SELECT ON xskc.Course TO 'Renjingpu'@'localhost';
SHOW GRANTS FOR 'Renjingpu'@'localhost';

GRANT SELECT ON xskc.grade TO 'Renjingpu'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'Renjingpu'@'localhost';

GRANT ALL PRIVILEGES ON xskc.* TO 'Renjingpu'@'localhost';
SHOW GRANTS FOR 'Renjingpu'@'localhost';

REVOKE INSERT ON xskc.Grade FROM 'Renjingpu'@'localhost';

GRANT ALL PRIVILEGES ON *.* TO 'Renjingpu'@'localhost';
SELECT * FROM mysql.user WHERE USER='Renjingpu';

REVOKE ALL PRIVILEGES ON *.* FROM 'Renjingpu'@'localhost';
SELECT * FROM mysql.user WHERE USER='Renjingpu';

DROP USER 'Renjingpu'@'localhost';
SELECT USER FROM mysql.user;

USE xskc;
CREATE VIEW student_view AS
SELECT Sno, Sname, Sdept
FROM xskc.Student;
SELECT * FROM xskc.student_view;

CREATE VIEW course_view AS
SELECT *
FROM xskc.Course;

SELECT *
FROM xskc.student_view
WHERE Sname LIKE '陈__';

SELECT *
FROM xskc.course_view
WHERE Cteacher='白一阁';

INSERT INTO xskc.student_view(Sno,Sname,Sdept) VALUES('50','机械熊','电子系');
SELECT * FROM xskc.student_view;

DELETE FROM xskc.student_view WHERE Sname = '机械熊';
SELECT * FROM xskc.student_view;

DROP VIEW xskc.course_view;

CREATE ROLE 'role1';

GRANT SELECT, UPDATE, INSERT ON xskc.student TO 'role1';

SHOW GRANTS FOR 'role1';

REVOKE UPDATE ON xskc.Student FROM 'role1';

CREATE USER 'jim'@'localhost' IDENTIFIED BY '123456';
SELECT USER FROM mysql.user;

GRANT 'role1' TO 'jim'@'localhost';
SET DEFAULT ROLE 'role1' TO 'jim'@'localhost';

REVOKE 'role1' FROM 'jim'@'localhost';

DROP ROLE 'role1';