CREATE DATABASE studentEnrollmentSystem;
USE studentEnrollmentSystem;

CREATE TABLE student (

    id INT PRIMARY KEY  AUTO_INCREMENT,
    name VARCHAR(255),
    age INT,
    enrolled BOOLEAN,
    averageScore DECIMAL(6,5)

);

INSERT INTO student (id, name, age, enrolled, averageScore)
VALUES (501367, 'Dalai', 21, 1, 0.99);

SELECT * FROM student;


CREATE TABLE course (

    courseID INT PRIMARY KEY  AUTO_INCREMENT,
    courseName VARCHAR(255),
    studentCount INT,
    active BOOLEAN,
    averageScore DECIMAL(6,6)

);

INSERT INTO course (courseID, courseName, studentCount, active, averageScore)
VALUES (455, 'Database', 22, 1, 60.13),
       (4113, 'JAVA', 25, 1, 60.13),
        (453, 'C++', 21, 1, 70.13);


SELECT * FROM course;



