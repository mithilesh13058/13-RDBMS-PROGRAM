CREATE DATABASE mithileshb;
USE mithileshb;
-- Department Table
CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);


CREATE TABLE Faculty (
    FacultyID INT AUTO_INCREMENT PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);


CREATE TABLE Course (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    FacultyID INT NOT NULL,
    FOREIGN KEY (FacultyID)
        REFERENCES Faculty(FacultyID)
);


CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    CourseID INT NOT NULL,
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);


INSERT INTO Department (DepartmentName)
VALUES
('Computer Science'),
('Commerce');


INSERT INTO Faculty (FacultyName, DepartmentID)
VALUES
('Dr. Kumar', 1),
('Dr. Priya', 2);


INSERT INTO Course (CourseName, FacultyID)
VALUES
('B.Sc Computer Science', 1),
('B.Com', 2);


INSERT INTO Student (StudentID, StudentName, CourseID)
VALUES
(101, 'Arun', 1),
(102, 'Priya', 1),
(103, 'Ravi', 2);


SELECT
    s.StudentID,
    s.StudentName,
    c.CourseName,
    f.FacultyName,
    d.DepartmentName
FROM Student s
JOIN Course c
    ON s.CourseID = c.CourseID
JOIN Faculty f
    ON c.FacultyID = f.FacultyID
JOIN Department d
    ON f.DepartmentID = d.DepartmentID;
