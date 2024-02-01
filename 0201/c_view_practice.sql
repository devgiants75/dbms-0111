# c_view_practice
# 뷰 연습 문제 #

#! school 데이터베이스 생성
#? Students 테이블 생성
# studentId: 정수, 기본키
# name: 문자열(50),
# age: 정수
# major: 문자열(50)
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Major VARCHAR(50)
);

#? Courses 테이블 생성
# courseId: 정수, 기본키
# courseName: 문자열(100)
# instructor: 문자열(100)
# creditHours: 정수
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Instructor VARCHAR(100),
    CreditHours INT
);

create table StudentCourse (
	studentCourseId int primary key,
    studentId int,
    courseId int,
    foreign key (studentId) references students(studentId),
    foreign key (courseId) references courses(courseId)
);

INSERT INTO Students (StudentID, FirstName, LastName, Age, Major)
VALUES (1, 'John', 'Doe', 20, 'Computer Science'),
       (2, 'Jane', 'Smith', 22, 'Mathematics'),
       (3, 'Alice', 'Johnson', 19, 'Biology'),
       (4, 'Bob', 'Brown', 21, 'History');

INSERT INTO Courses (CourseID, CourseName, Instructor, CreditHours)
VALUES (101, 'Introduction to Programming', 'Prof. Smith', 3),
       (102, 'Calculus I', 'Prof. Johnson', 4),
       (103, 'Biology 101', 'Prof. Davis', 3),
       (104, 'World History', 'Prof. Wilson', 3);
       
INSERT INTO StudentCourse (StudentID, CourseID)
VALUES (1, 101),
       (2, 102),
       (3, 103),
       (4, 104);