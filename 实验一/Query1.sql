CREATE DATABASE xskc;

USE xskc;
CREATE TABLE `Student`(
`Sno` CHAR(16) PRIMARY KEY NOT NULL,
`Sname` CHAR(10) NOT NULL,
`Ssex` CHAR(2) CHECK(Ssex = '男' OR Ssex = '女'),
`Smajor` CHAR(20),
`Sdept` CHAR(20),
`Sgrade` CHAR(2),
`Sclass` CHAR(2),
`Snumber` CHAR(11),
`Sbirth` DATETIME(6),
`Sregion` VARCHAR(30),
`Schange` CHAR(10),
`Snation` CHAR(8) DEFAULT '汉'
)

CREATE TABLE `Course`(
`Cno` CHAR(8) PRIMARY KEY,
`Cname` CHAR(10) UNIQUE,
`Cteacher` CHAR(8),
`Classroom` CHAR(8),
`Ccredit` INT(6)
)

CREATE TABLE `Grade`(
`Sno` CHAR(16),
`Cno` CHAR(8),
`Grades` REAL CHECK(Grades >= 0 AND Grades <= 100),
`Remarks` VARCHAR(50),
PRIMARY KEY(Sno,Cno),
FOREIGN KEY (Sno) REFERENCES Student(Sno),
FOREIGN KEY (Cno) REFERENCES Course(Cno)
)

ALTER TABLE Student ADD Smonitor CHAR(16);

ALTER TABLE Student MODIFY Snation CHAR(8); -- 删除默认约束`student`

ALTER TABLE Student ADD Szzmm CHAR(8);
ALTER TABLE Student ADD Szxf INT;

ALTER TABLE Course ADD Cskxs INT;
ALTER TABLE Course ADD Ckkxq INT;

ALTER TABLE Student CHANGE Sgrade Srxsj DATETIME;
SELECT * FROM Student;

ALTER TABLE Course ADD Cproject CHAR(20);
SELECT * FROM Course;

ALTER TABLE Course DROP COLUMN Cproject;
SELECT * FROM Course;