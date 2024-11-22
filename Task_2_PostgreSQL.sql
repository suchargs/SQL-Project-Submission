CREATE DATABASE student_database;

CREATE TABLE student_table (
    Student_id SERIAL PRIMARY KEY,
    Stu_name TEXT NOT NULL,
    Department TEXT,
    email_id TEXT UNIQUE,
    Phone_no NUMERIC(10),
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT CHECK (Gender IN ('Male', 'Female')),
    Major TEXT,
    GPA NUMERIC(3, 2),
    Grade TEXT CHECK (Grade IN ('A', 'B', 'C', 'D', 'F'))
);
select * from student_table;

INSERT INTO student_table (Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
('Sucharita', 'Computer Science', 'sucharita@example.com', 9876543210, 'New York', '2000-04-15', 'Female', 'AI', 8.5, 'A'),
('Madhuri', 'Mechanical Engineering', 'madhuri@example.com', 8765432109, 'Los Angeles', '2001-03-10', 'Female', 'Robotics', 7.0, 'B'),
('Ramana', 'Civil Engineering', 'ramana@example.com', 7654321098, 'Chicago', '1999-07-25', 'Male', 'Construction', 6.0, 'C'),
('Mamta', 'Computer Science', 'mamta@example.com', 6543210987, 'San Francisco', '2000-11-20', 'Female', 'Data Science', 9.0, 'A'),
('Anish', 'Electrical Engineering', 'anish@example.com', 5432109876, 'Boston', '2001-05-30', 'Male', 'Circuits', 5.5, 'B'),
('Prateek', 'Mechanical Engineering', 'prateek@example.com', 4321098765, 'Seattle', '2000-08-10', 'Male', 'Thermodynamics', 4.5, 'C'),
('Suraj', 'Computer Science', 'suraj@example.com', 3210987654, 'Houston', '1998-12-25', 'Male', 'AI', 9.5, 'A'),
('Rejish', 'Civil Engineering', 'rejish@example.com', 2109876543, 'Phoenix', '1997-10-05', 'Male', 'Hydraulics', 3.0, 'D'),
('Amul', 'Electrical Engineering', 'amul@example.com', 1098765432, 'Denver', '2002-02-15', 'Male', 'Power Systems', 8.0, 'B'),
('Sujith', 'Mechanical Engineering', 'sujith@example.com', 1987654321, 'Austin', '2000-06-01', 'Male', 'Design', 7.5, 'B');

-- Retrieve all student records sorted in descending order by grade

SELECT * FROM student_table
ORDER BY Grade DESC;

-- Retrieve information about male students

SELECT * FROM student_table
WHERE Gender = 'Male';

-- Fetch details of students with GPA < 5.0
SELECT * FROM student_table
WHERE GPA < 5.0;

-- Update email and grade of a specific student
UPDATE student_table
SET email_id = 'newemail@example.com', Grade = 'A'
WHERE Student_id = 5; -- Replace with the actual Student_id

-- Retrieve names and ages of students with grade "B"

SELECT Stu_name, AGE(Date_of_birth) AS Age
FROM student_table
WHERE Grade = 'B';

-- Group by Department and Gender, and calculate average GPA
SELECT Department, Gender, AVG(GPA) AS Avg_GPA
FROM student_table
GROUP BY Department, Gender;

-- Rename the table student_table to student_info
ALTER TABLE student_table RENAME TO student_info;

select * from student_info;

-- Retrieve the name of the student with the highest GPA
SELECT Stu_name
FROM student_info
WHERE GPA = (SELECT MAX(GPA) FROM student_info);
