DROP DATABASE UniversityRegistrationSystem;
CREATE DATABASE UniversityRegistrationSystem;
USE UniversityRegistrationSystem;

CREATE TABLE UniversityMember(
	memberID INTEGER ,
    memberType CHAR(20),
    firstName CHAR(20),
    lastName CHAR(20),
    SIN INTEGER,
    dateOfBirth DATE,
    homeAddress CHAR(50),
    statusType CHAR(20),
    PRIMARY KEY(memberID)
);

CREATE TABLE Course(
	courseName CHAR(40),
    courseCode CHAR(10),
    subject CHAR(50),
    description CHAR(200),
    PRIMARY KEY(courseName, courseCode)
);

CREATE TABLE Section(
    courseName CHAR(40),
    courseCode CHAR(10),
    courseSection CHAR(20),
    memberID INTEGER,
    time TIME,
    PRIMARY KEY (courseName, courseCode, courseSection,  memberID),
    FOREIGN KEY (courseName, courseCode) REFERENCES Course(courseName, courseCode) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (memberID) REFERENCES UniversityMember(memberID) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE CourseList(
	memberID INTEGER,
    courseName CHAR(40),
    courseCode CHAR(10),
    courseSection CHAR(20),
    PRIMARY KEY (memberID, courseName, courseCode, courseSection),
    FOREIGN KEY (memberID) REFERENCES UniversityMember(memberID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (courseName, courseCode, courseSection) REFERENCES Section(courseName, courseCode, courseSection) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CourseGrades(
    courseName CHAR(40),
    courseCode CHAR(10),
    courseSection CHAR(20),
    memberID INTEGER,
    grade INTEGER,
    PRIMARY KEY (memberID, courseName, courseCode, courseSection),
    FOREIGN KEY (memberID) REFERENCES UniversityMember(memberID) ON DELETE CASCADE,
    FOREIGN KEY (courseName, courseCode, courseSection) REFERENCES CourseList(courseName, courseCode, courseSection) ON DELETE CASCADE
);

CREATE TABLE Login(
	memberID INTEGER,
    password CHAR(50),
    memberType CHAR(20),
    PRIMARY KEY (memberID, password),
    FOREIGN KEY (memberID) REFERENCES UniversityMember(memberID) ON DELETE CASCADE
);


#### Entries ####
#Students
INSERT INTO UniversityMember VALUES (1231231, 'Undergraduate', 'John', 'Smith', 123456789, '1990-10-22', '123 Main Street, Thunder Bay, ON, P7Y 4L9, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (4215976, 'Undergraduate', 'Justin', 'Gates', 212512322, '1986-02-02', '421 Dundas Ave, Thunder Bay, ON, P4C 1T8, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (5188121, 'Undergraduate', 'Albert', 'Marteus', 782164524, '1992-12-08', '915 Bay Street, Thunder Bay, ON, P1K 7Z9, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (9015219, 'Undergraduate', 'Marcus', 'Potts', 976735653, '1990-04-05', '1303 Walnut Drive, Thunder Bay, ON, P8J 2L1, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (7537134, 'Undergraduate', 'Dimitri', 'Schtern', 145318586, '1989-01-20', '891 Winnipeg Ave, Thunder Bay, ON, P2P 5W1, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (0125392, 'Undergraduate', 'Austin', 'Maxine', 879021175, '1985-05-09', '1052 Parkdale Ave, Thunder Bay, ON, P5A 9M8, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (5329210, 'Undergraduate', 'Alexandra', 'West', 597901180, '1984-11-13', '777 Algoma Street, Thunder Bay, ON, P7C 1G9, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (1205189, 'Undergraduate', 'Landon', 'McDonald', 616839872, '1995-10-29', '623 Brodie Street, Thunder Bay, ON, P6M 2M1, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (2125890, 'Undergraduate', 'Peter', 'Chen', 324327530, '1989-02-26', '1234 Third Street, Thunder Bay, ON, P3K 8J6, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (5181205, 'Graduate', 'James', 'Wong', 186014558, '1982-12-26', '139 Franklin Ave, Thunder Bay, ON, P2K 7O2, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (2195182, 'Graduate', 'Nicole', 'Lowry', 324327530, '2000-05-04', '619 Victoria Street, Thunder Bay, ON, P9S 2W1, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (9518953, 'Graduate', 'Deandra', 'White', 772976152, '1988-02-20', '1214 Erendale Street, Thunder Bay, ON, P0P 3M3, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (7531923, 'Graduate', 'Zach', 'Scott', 592972413, '2002-07-23', '812 Loyola Place, Thunder Bay, ON, P4J 1R0, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (0124829, 'Undergraduate', 'Jessica', 'Fernley', 323359646, '1996-06-15', '421 Acorn Avenue, Thunder Bay, ON, P7T 1T9, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (1583815, 'Undergraduate', 'Trenton', 'Hobbs', 127577684, '1984-08-29', '1109 Cottonwood Crescent, Thunder Bay, ON, P1R 0G9, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (8215721, 'Undergraduate', 'Nicole', 'Young', 178020326, '1985-01-14', '921 Glasgow Street, Thunder Bay, ON, P8I 7X2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (5292719, 'Undergraduate', 'Samantha', 'Martin Jr.', 533913098, '2002-12-10', '512 Jade Court, Thunder Bay, ON, P5B 9I0, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (1929148, 'Undergraduate', 'Tien', 'Wade', 205318702, '2000-11-17', '218 Lancaster Street, Thunder Bay, ON, PL0 4N4, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (7214933, 'Undergraduate', 'Tyler', 'Shin', 456789123, '1982-09-27', '721 King Street, Thunder Bay, ON, P4L 9P2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (6216862, 'Undergraduate', 'Pablo', 'North', 192079634, '1989-06-21', '1512 Norah Crescent, Thunder Bay, ON, P9Z 3Z9, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (5320911, 'Undergraduate', 'Hannah', 'Baldwin', 047288825, '1999-11-18', '351 Oliver Road, Thunder Bay, ON, P7X 3E1, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (3190185, 'Undergraduate', 'Tony', 'Rich', 435839484, '1987-06-27', '521 Rona Street, Thunder Bay, ON, P5J 3M5, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (2109012, 'Undergraduate', 'Gia', 'Stevens', 186710588, '1992-03-14', '707 Silas Road, Thunder Bay, ON, P5J 9J0, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (4210305, 'Undergraduate', 'Pablo', 'North', 425643419, '1990-10-08', '512 Tokio Street, Thunder Bay, ON, P3E 6H3, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (2190182, 'Undergraduate', 'Reese', 'Kemp', 598704490, '1995-02-16', '807 Trillium Place, Thunder Bay, ON, P3E 5Y3, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (5031219, 'Undergraduate', 'Harper', 'Wyatt', 706460918, '1994-08-11', '972 Wilson Street, Thunder Bay, ON, P3E 2W1, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (6102213, 'Undergraduate', 'Asia', 'Brown', 833988144, '1988-03-01', '121 Yale Street, Thunder Bay, ON, P8I 5R2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (1294194, 'Undergraduate', 'Zoey', 'Waller', 853225450, '1991-08-23', '345 Wren Court, Thunder Bay, ON, P8I 0L6, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (5901821, 'Undergraduate', 'Bruce', 'Harper', 308074144, '1987-09-24', '911 Hodder Ave, Thunder Bay, ON, P8I 1T2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (0912942, 'Undergraduate', 'Jasmine Fritz', 'North', 083235525, '2002-02-23', '218 Syndicate Avenue, Thunder Bay, ON, P0T 9G2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (5429195, 'Undergraduate', 'Nicole', 'Diaz', 864095537, '1982-07-01', '6218 Riverdale Street, Thunder Bay, ON, P0T 1D6, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (6942091, 'Undergraduate', 'Walker', 'Obrien', 983358142, '1983-02-24', '1123 Picard Ave, Thunder Bay, ON, P0T 1D1, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (5313903, 'Undergraduate', 'Marco', 'Polo', 228660223, '1998-07-26', '619 Neebing Ave, Thunder Bay, ON, P3I 8I9, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (2140915, 'Undergraduate', 'Nixon', 'Cross', 698227090, '1990-04-11', '314 Mary Street, Thunder Bay, ON, P5Y 5L2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (7214905, 'Undergraduate', 'Andrew', 'Williamson', 695863577, '1982-11-17', '4212 Arthur Street, Thunder Bay, ON, P8W 0P2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (2510933, 'Undergraduate', 'Tanya', 'Hill', 419536451, '2000-04-10', '512 Fanshaw Street, Thunder Bay, ON, P9R 5W2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (6231593, 'Undergraduate', 'Mary', 'Louise', 367274028, '2002-10-08', '2145 Chippewa Drive, Thunder Bay, ON, P1E 9R2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (2189218, 'Undergraduate', 'Gabriel', 'Iglesias', 456789123, '1989-01-05', '210 Coyote Street, Thunder Bay, ON, P1E 7I5, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (7419953, 'Undergraduate', 'Grace', 'Perez', 437963457, '1992-06-09', '521 Clearwater Way, Thunder Bay, ON, P2R 4I2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (0921355, 'Undergraduate', 'Hunter', 'Chung', 769152728, '1996-10-31', '518 HW-61, Thunder Bay, ON, P7O 3T5, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (0125825, 'Undergraduate', 'Tony', 'Zeng', 277918893, '1996-04-16', '330 Brock Street, Thunder Bay, ON, P5T 3R4, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (8593295, 'Undergraduate', 'Ernest', 'Bond', 241595421, '1985-05-03', '599 Black Bay Road, Thunder Bay, ON, P9U 5U7, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (3219998, 'Graduate', 'Aaron', 'Rogers', 906744957, '1994-02-23', '214 Ambrose Street, Thunder Bay, ON, P1Y 5K9, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (5153912, 'Graduate', 'Brandon', 'Bembry', 794231517, '1993-10-21', '951 15th Sideroad, Thunder Bay, ON, P1Y 4L0, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (1005190, 'Graduate', 'Pascal', 'Ingram', 945399607, '1998-11-16', '1521 High Street, Thunder Bay, ON, P1Y 1U7, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (8892149, 'Graduate', 'Kyle', 'Butler', 586518060, '1998-03-30', '721 Central Ave, Thunder Bay, ON, P4B 5J1, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (6661293, 'Graduate', 'Stephen', 'Thompson', 870679523, '1990-08-20', '777 Balmoral Street, Thunder Bay, ON, P4B 4L9, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (1024920, 'Graduate', 'Klay', 'Curry', 562539179, '1987-08-26', '821 James Street, Thunder Bay, ON, P4B 8L1, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (9218529, 'Graduate', 'Draymond', 'Brown', 728929658, '1990-02-22', '8519 Nick Street, Thunder Bay, ON, P7C 9U7, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (6314892, 'Graduate', 'Kevin', 'Warner', 152747405, '2000-03-14', '592 Alberta Street, Thunder Bay, ON, P7C 2R4, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (1521249, 'Graduate', 'Devin', 'Crowder', 426797769, '2000-09-30', '531 Wiley Street, Thunder Bay, ON, P7C 5O9, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (1214201, 'Graduate', 'Logan', 'Bumstead', 795663544, '1999-10-07', '300 McKellar Street, Thunder Bay, ON, P6Y 9L9, Canada', 'Full-Time');

#Instructors
INSERT INTO UniversityMember VALUES (0646314, 'Instructor', 'Ken', 'Ironside', 147258369, '1984-08-31', '6351 Windsor Street, Thunder Bay, ON, P2U 3X7, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (2419215, 'Instructor', 'Chadwick', 'Boucher', 638799434, '1961-09-27', '941 Bankers Street, Thunder Bay, ON, P5X 7J3, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (6319921, 'Instructor', 'Margeret', 'Jordan', 698802186, '1991-09-28', '219 High Street, Thunder Bay, ON, P4N 3K5, Canada', 'Part-Time');
INSERT INTO UniversityMember VALUES (0021521, 'Instructor', 'Yuri', 'Orslof', 698802186, '1974-03-17', '271 Bristol Court, Thunder Bay, ON, P8B 3M6, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (2419522, 'Instructor', 'Thomas', 'Andre', 298960408, '1966-02-28', '829 Third Street, Thunder Bay, ON, P0B 6G2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (7214777, 'Instructor', 'Henry', 'Miller', 752264681, '1961-05-23', '124 Cherrygrove Street, Thunder Bay, ON, P2C 1B7, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (3450968, 'Instructor', 'Harrison', 'Ford', 431423924, '1973-03-23', '3582 John Street, Thunder Bay, ON, P5N 3A5, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (7892152, 'Instructor', 'Christina', 'Hemsworth', 254836716, '1983-05-19', '742 Frankwood Avenue, Thunder Bay, ON, P9A 4A4, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (2192100, 'Instructor', 'Nicholas', 'Emperius', 607400547, '1962-02-21', '682 Huntington Street, Thunder Bay, ON, P5F 2F5, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (4210012, 'Instructor', 'Natasha', 'Popov', 525491129, '1982-05-19', '482 Langworthy Crescent, Thunder Bay, ON, P1S 6B2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (7821942, 'Instructor', 'Bill', 'Gates', 388639027, '1965-07-23', '2105 Mireault Crescent, Thunder Bay, ON, P9B 7Q3, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (5678762, 'Instructor', 'Steve', 'Jobbs', 668754218, '1984-05-28', '517 Nipigon Avenue, Thunder Bay, ON, P1Q 6L2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (7544327, 'Instructor', 'Squid', 'Game', 849927954, '1964-11-21', '298 Porcupine Avenue, Thunder Bay, ON, P5L 1Q5, Canada', 'Full-Time');

#Administrators
INSERT INTO UniversityMember VALUES (9000546, 'Administrator', 'Bailey', 'Hull', 369147258, '1968-04-15', '365 Fifth Street, Thunder Bay, ON, P6Z 3B2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (5129851, 'Administrator', 'Precious', 'Davis', 570862430, '1961-09-03', '1213 Ridgeway Street, Thunder Bay, ON, P1M 5U2, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (2199921, 'Administrator', 'Shaquille', 'James', 812330796, '1976-07-24', '6217 Shirley Road, Thunder Bay, ON, P9N 3K1, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (8582188, 'Administrator', 'Hassan', 'Mohammed', 683611787, '1970-11-26', '521 Walsh Street, Thunder Bay, ON, P4S 9I4, Canada', 'Full-Time');
INSERT INTO UniversityMember VALUES (7772147, 'Administrator', 'Karen', 'Winters', 447628671, '1985-01-10', '846 Oxford Street, Thunder Bay, ON, P8D 2V9, Canada', 'Full-Time');

#Courses (Add Descriptions)
INSERT INTO Course VALUES ('ESOF', '3050', 'Software Engineering', 'This is the description of the course...');
INSERT INTO Course VALUES ('ESOF', '3655', 'Principles of Operating Systems', 'This is the description of the course...');
INSERT INTO Course VALUES ('MATH', '3071', 'Discrete Mathematics', 'This is the description of the course...');
INSERT INTO Course VALUES ('ENGL', '1012', 'Academic Communications', 'This is the description of the course...');
INSERT INTO Course VALUES ('BUSI', '4071', 'Strategic Management II', 'This is the description of the course...');
INSERT INTO Course VALUES ('CHEM', '2211', 'Organic Chemistry I', 'This is the description of the course...');
INSERT INTO Course VALUES ('WOME', '1100', 'Women and Gender Studies', 'This is the description of the course...');
INSERT INTO Course VALUES ('MUSI', '4330', 'String Ensemble IV', 'This is the description of the course...');
INSERT INTO Course VALUES ('SPAN', '1000', 'Introductory Spanish', 'This is the description of the course...');
INSERT INTO Course VALUES ('NURS', '2055', 'Adult Illness Concepts I', 'This is the description of the course...');
INSERT INTO Course VALUES ('MEDI', '5045', 'Social and Population Health I', 'This is the description of the course...');
INSERT INTO Course VALUES ('EDUC', '6411', 'Cognition and Learning', 'This is the description of the course...');
INSERT INTO Course VALUES ('SOCI', '5111', 'Problem and Issues Socialogy', 'This is the description of the course...');
INSERT INTO Course VALUES ('COMP', '9800', 'Project Research/Writing', 'This is the description of the course...');

#Section
INSERT INTO Section VALUES ('ESOF', '3050', 'FA', 0646314, '13:30:00');
INSERT INTO Section VALUES ('ESOF', '3050', 'FB', 0646314, '10:00:00');
INSERT INTO Section VALUES ('ESOF', '3655', 'FA', 7214777, '10:00:00');
INSERT INTO Section VALUES ('ESOF', '3655', 'FB', 7214777, '15:00:00');
INSERT INTO Section VALUES ('MATH', '3071', 'FA', 5678762, '08:30:00');
INSERT INTO Section VALUES ('MATH', '3071', 'FB', 2192100, '10:30:00');
INSERT INTO Section VALUES ('MATH', '3071', 'FC', 2419522, '12:30:00');
INSERT INTO Section VALUES ('MATH', '3071', 'FD', 4210012, '14:30:00');
INSERT INTO Section VALUES ('ENGL', '1012', 'FA', 7892152, '18:00:00');
INSERT INTO Section VALUES ('ENGL', '1012', 'FB', 7892152, '09:30:00');
INSERT INTO Section VALUES ('BUSI', '4071', 'FA', 7544327, '17:15:00');
INSERT INTO Section VALUES ('CHEM', '2211', 'FA', 3450968, '08:30:00');
INSERT INTO Section VALUES ('WOME', '1100', 'FA', 6319921, '09:00:00');
INSERT INTO Section VALUES ('MUSI', '4330', 'FA', 4210012, '14:30:00');
INSERT INTO Section VALUES ('SPAN', '1000', 'FA', 0021521, '20:00:00');
INSERT INTO Section VALUES ('NURS', '2055', 'FA', 7214777, '08:30:00');
INSERT INTO Section VALUES ('NURS', '2055', 'FB', 7214777, '12:30:00');
INSERT INTO Section VALUES ('NURS', '2055', 'FC', 5678762, '16:00:00');
INSERT INTO Section VALUES ('MEDI', '5045', 'FA', 2419522, '08:30:00');
INSERT INTO Section VALUES ('EDUC', '6411', 'FA', 2419215, '18:45:00');
INSERT INTO Section VALUES ('SOCI', '5111', 'FA', 7544327, '07:15:00');
INSERT INTO Section VALUES ('COMP', '9800', 'FA', 0646314, '12:30:00');
INSERT INTO Section VALUES ('COMP', '9800', 'FB', 2192100, '17:30:00');

#CourseList

#CourseGrade

#Login
INSERT INTO Login VALUES (1231231, 'password', 'student');
INSERT INTO Login VALUES (4215976, 'password', 'student');
INSERT INTO Login VALUES (5188121, 'password', 'student');
INSERT INTO Login VALUES (9015219, 'password', 'student');
INSERT INTO Login VALUES (7537134, 'password', 'student');
INSERT INTO Login VALUES (0125392, 'password', 'student');
INSERT INTO Login VALUES (5329210, 'password', 'student');
INSERT INTO Login VALUES (1205189, 'password', 'student');
INSERT INTO Login VALUES (2125890, 'password', 'student');
INSERT INTO Login VALUES (5181205, 'password', 'student');
INSERT INTO Login VALUES (2195182, 'password', 'student');
INSERT INTO Login VALUES (9518953, 'password', 'student');
INSERT INTO Login VALUES (7531923, 'password', 'student');
INSERT INTO Login VALUES (0124829, 'password', 'student');
INSERT INTO Login VALUES (1583815, 'password', 'student');
INSERT INTO Login VALUES (8215721, 'password', 'student');
INSERT INTO Login VALUES (5292719, 'password', 'student');
INSERT INTO Login VALUES (1929148, 'password', 'student');
INSERT INTO Login VALUES (7214933, 'password', 'student');
INSERT INTO Login VALUES (6216862, 'password', 'student');
INSERT INTO Login VALUES (5320911, 'password', 'student');
INSERT INTO Login VALUES (3190185, 'password', 'student');
INSERT INTO Login VALUES (2109012, 'password', 'student');
INSERT INTO Login VALUES (4210305, 'password', 'student');
INSERT INTO Login VALUES (2190182, 'password', 'student');
INSERT INTO Login VALUES (5031219, 'password', 'student');
INSERT INTO Login VALUES (6102213, 'password', 'student');
INSERT INTO Login VALUES (1294194, 'password', 'student');
INSERT INTO Login VALUES (5901821, 'password', 'student');
INSERT INTO Login VALUES (0912942, 'password', 'student');
INSERT INTO Login VALUES (5429195, 'password', 'student');
INSERT INTO Login VALUES (6942091, 'password', 'student');
INSERT INTO Login VALUES (5313903, 'password', 'student');
INSERT INTO Login VALUES (2140915, 'password', 'student');
INSERT INTO Login VALUES (7214905, 'password', 'student');
INSERT INTO Login VALUES (2510933, 'password', 'student');
INSERT INTO Login VALUES (6231593, 'password', 'student');
INSERT INTO Login VALUES (2189218, 'password', 'student');
INSERT INTO Login VALUES (7419953, 'password', 'student');
INSERT INTO Login VALUES (0921355, 'password', 'student');
INSERT INTO Login VALUES (0125825, 'password', 'student');
INSERT INTO Login VALUES (8593295, 'password', 'student');
INSERT INTO Login VALUES (3219998, 'password', 'student');
INSERT INTO Login VALUES (5153912, 'password', 'student');
INSERT INTO Login VALUES (1005190, 'password', 'student');
INSERT INTO Login VALUES (8892149, 'password', 'student');
INSERT INTO Login VALUES (6661293, 'password', 'student');
INSERT INTO Login VALUES (1024920, 'password', 'student');
INSERT INTO Login VALUES (9218529, 'password', 'student');
INSERT INTO Login VALUES (6314892, 'password', 'student');
INSERT INTO Login VALUES (1521249, 'password', 'student');
INSERT INTO Login VALUES (1214201, 'password', 'student');

INSERT INTO Login VALUES (0646314, 'password', 'instructor');
INSERT INTO Login VALUES (2419215, 'password', 'instructor');
INSERT INTO Login VALUES (6319921, 'password', 'instructor');
INSERT INTO Login VALUES (0021521, 'password', 'instructor');
INSERT INTO Login VALUES (2419522, 'password', 'instructor');
INSERT INTO Login VALUES (7214777, 'password', 'instructor');
INSERT INTO Login VALUES (3450968, 'password', 'instructor');
INSERT INTO Login VALUES (7892152, 'password', 'instructor');
INSERT INTO Login VALUES (2192100, 'password', 'instructor');
INSERT INTO Login VALUES (4210012, 'password', 'instructor');
INSERT INTO Login VALUES (7821942, 'password', 'instructor');
INSERT INTO Login VALUES (5678762, 'password', 'instructor');
INSERT INTO Login VALUES (7544327, 'password', 'instructor');

INSERT INTO Login VALUES (9000546, 'password', 'administrator');
INSERT INTO Login VALUES (5129851, 'password', 'administrator');
INSERT INTO Login VALUES (2199921, 'password', 'administrator');
INSERT INTO Login VALUES (8582188, 'password', 'administrator');
INSERT INTO Login VALUES (7772147, 'password', 'administrator');

INSERT INTO CourseList VALUES(1231231, 'ESOF', '3050', 'FA');
INSERT INTO CourseList VALUES(1231231, 'ESOF', '3655', 'FB');
INSERT INTO CourseList VALUES(1231231, 'MATH', '3071', 'FA');
INSERT INTO CourseList VALUES(1214201, 'BUSI', '4071', 'FA');


commit;

SELECT * FROM CourseGrades WHERE memberID = 1231231 ORDER BY courseName, courseCode, courseSection;

SELECT * FROM UniversityMember WHERE memberType != 'student';

#SET FOREIGN_KEY_CHECKS=0;
#DELETE FROM Section WHERE courseName = 'COMP' AND courseCode = '9800' and courseSection = 'FA';
#SET FOREIGN_KEY_CHECKS=1;

SELECT * FROM Course INNER JOIN Section ON Course.courseName = Section.courseName AND Course.courseCode = Section.courseCode
WHERE NOT EXISTS (SELECT courseName, courseCode, courseSection, memberID FROM CourseList WHERE CourseList.courseName = Section.courseName AND CourseList.courseCode = Section.courseCode AND CourseList.courseSection = Section.courseSection AND CourseList.memberID = 1231231)
ORDER BY Course.courseName;



SELECT CourseList.courseName, CourseList.courseCode, CourseList.courseSection, subject, time, firstName, lastName FROM CourseList 
INNER JOIN Course ON Course.courseName = CourseList.courseName AND Course.courseCode = CourseList.courseCode
INNER JOIN Section ON Section.courseName = CourseList.courseName AND Section.courseCode = CourseList.courseCode AND Section.courseSection = CourseList.courseSection
INNER JOIN UniversityMember ON UniversityMember.memberID = Section.memberID 
WHERE CourseList.memberID = 1231231 
ORDER BY Course.courseName, Course.courseCode, courseSection;

SELECT * FROM UniversityMember WHERE memberType = 'instructor' OR memberType = 'administrator';

SELECT CourseList.courseName, CourseList.courseCode, courseSection, subject FROM CourseList
INNER JOIN Course ON Course.courseName = CourseList.courseName
AND Course.courseCode = CourseList.courseCode
WHERE CourseList.memberID = 1231231
ORDER BY CourseList.courseName;

SELECT Section.courseName, Section.courseCode, Section.courseSection, subject, Section.time
FROM Section
INNER JOIN Course ON Course.courseName = Section.courseName
AND Course.courseCode = Section.courseCode
WHERE Section.memberID = 0646314
ORDER BY Section.courseName, Section.courseCode, Section.courseSection;

SELECT Section.courseName, Section.courseCode, Section.courseSection, subject, Section.time, firstName, lastName FROM Section
INNER JOIN Course ON Course.courseName = Section.courseName AND Course.courseCode = Section.courseCode
INNER JOIN UniversityMember ON UniversityMember.memberID = Section.memberID
ORDER BY Section.courseName, Section.courseCode, Section.courseSection;

SELECT Course.courseName, Course.courseCode, Section.courseSection, Course.subject, Course.description, Section.memberID, Section.time FROM Course INNER JOIN Section ON Course.courseName = Section.courseName AND Course.courseCode = Section.courseCode ORDER BY Course.courseName, Course.courseCode, Section.courseSection