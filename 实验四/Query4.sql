DELIMITER //
CREATE PROCEDURE showStu()
BEGIN
    SELECT * FROM Student;
END //
DELIMITER ;

CALL showStu()

DROP PROCEDURE IF EXISTS showStu;

SHOW CREATE PROCEDURE showStu;

SHOW CREATE PROCEDURE showStu;

DELIMITER //
CREATE PROCEDURE getAge(IN stuName VARCHAR(50))
BEGIN
    SELECT TIMESTAMPDIFF(YEAR, Sbirth, CURDATE()) AS age FROM Student WHERE Sname = stuName;
END //
DELIMITER ;
CALL getAge('李春刚');

DELIMITER //
CREATE PROCEDURE getCourse(IN Sxh CHAR(20))
BEGIN
	SELECT Course.Cname
	FROM Course,Grade
	WHERE Grade.Sno = Sxh AND Grade.Cno = Course.Cno;
END //
DELIMITER ;
CALL getCourse('001');

DELIMITER //
CREATE PROCEDURE getScoreByStu(IN Sxm CHAR(20),IN Ckcmc CHAR(20))
BEGIN
	SELECT Grade.Grades
	FROM Student,Grade,Course
	WHERE Student.Sname = Sxm AND Student.Sno = Grade.Sno AND Grade.Cno = Course.Cno AND Course.Cname = Ckcmc;
END //
DELIMITER ;
CALL getScoreByStu('李春刚','电子商务');

DELIMITER //
CREATE PROCEDURE getScoreState(IN Sxm CHAR(20),IN Ckcmc CHAR(20))
BEGIN
	DECLARE score INT;
	SELECT Grades INTO score
	FROM Student,Course,Grade
	WHERE Student.Sno = Grade.Sno AND Grade.Cno = Course.Cno AND Student.Sname = Sxm AND Course.Cname = Ckcmc;
	
	IF score < 60 THEN 
		SELECT '不合格' AS state;
	ELSEIF score >= 60 AND score <= 80 THEN 
		SELECT '合格' AS state;
	ELSE
		SELECT '优秀' AS state;
	END IF;
END //
DELIMITER ;
CALL getScoreState('李春刚','电子商务');

CALL getScoreByStu('李春刚','数据库原理');

DROP PROCEDURE IF EXISTS showStu;

SELECT *
FROM Student;

DELIMITER //
CREATE TRIGGER unInsert BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
	IF new.Sdept = '计算机' THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '此系人数已满，不能添加人员';
	END IF;
END //
DELIMITER ;

INSERT INTO Student(Sno,Sname,Ssex,Smajor,Sdept,Srxsj,Sclass,Snumber,Sbirth,Sregion,Schange,Snation,Smonitor,Szzmm,Szxf) VALUES('031','任精普','男','计算机应用','计算机','2019-09-01','01',NULL,'2000-09-01','呼和浩特市','无','汉族','shen','团员',132);

DELIMITER //
CREATE TRIGGER insCourse AFTER INSERT ON Student
FOR EACH ROW
BEGIN
	INSERT INTO Grade (Sno,Cno,Grades) VALUES (new.Sno,'05',NULL);
END //
DELIMITER ;

INSERT INTO Student(Sno,Sname,Ssex,Smajor,Sdept,Srxsj,Sclass,Snumber,Sbirth,Sregion,Schange,Snation,Smonitor,Szzmm,Szxf) VALUES('031','任精普','男','计算机应用','计算机','2019-09-01','01',NULL,'2000-09-01','呼和浩特市','无','汉族','shen','团员',132);
SELECT *
FROM Grade;
DELETE FROM Grade WHERE Sno = '031';
DELETE FROM Student WHERE Sno = '031';

SELECT *
FROM Student;

SELECT *
FROM Course;

SHOW CREATE TRIGGER unInsert;

DROP TRIGGER IF EXISTS unInsert;