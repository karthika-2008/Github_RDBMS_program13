CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    FacultyID INT,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE StudentCourse (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Department records
INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
(1, 'Computer Science'),
(2, 'Mathematics');

-- Faculty records
INSERT INTO Faculty (FacultyID, FacultyName, DepartmentID)
VALUES
(101, 'Dr. Ravi', 1),
(102, 'Dr. Meena', 2);

-- Student records
INSERT INTO Student (StudentID, StudentName)
VALUES
(1001, 'Arun'),
(1002, 'Priya'),
(1003, 'Kumar');

-- Course records
INSERT INTO Course (CourseID, CourseName, FacultyID)
VALUES
(201, 'Database Systems', 101),
(202, 'Data Structures', 101),
(203, 'Mathematics', 102);

-- StudentCourse records
INSERT INTO StudentCourse (StudentID, CourseID)
VALUES
(1001, 201),
(1001, 202),
(1002, 203),
(1003, 201);

-- Display normalized data using JOIN
SELECT
    Student.StudentID,
    Student.StudentName,
    Course.CourseName,
    Faculty.FacultyName,
    Department.DepartmentName
FROM Student
JOIN StudentCourse
    ON Student.StudentID = StudentCourse.StudentID
JOIN Course
    ON StudentCourse.CourseID = Course.CourseID
JOIN Faculty
    ON Course.FacultyID = Faculty.FacultyID
JOIN Department
    ON Faculty.DepartmentID = Department.DepartmentID;
