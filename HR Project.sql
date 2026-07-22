CREATE DATABASE HR_Employee_Management;

USE HR_Employee_Management;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    gender VARCHAR(10),
    dob DATE,
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    department_id INT,
    designation VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10,2),
    manager_id INT,
    status VARCHAR(20),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);


CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    attendance_date DATE,
    check_in TIME,
    check_out TIME,
    working_hours DECIMAL(4,2),
    status VARCHAR(20),

    FOREIGN KEY (employee_id)
    REFERENCES Employees(employee_id)
);

CREATE TABLE Leave_Requests (
    leave_id INT PRIMARY KEY,
    employee_id INT,
    leave_type VARCHAR(30),
    start_date DATE,
    end_date DATE,
    reason VARCHAR(200),
    leave_status VARCHAR(20),

    FOREIGN KEY (employee_id)
    REFERENCES Employees(employee_id)
);

CREATE TABLE Payroll (
    payroll_id INT PRIMARY KEY,
    employee_id INT,
    basic_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    deduction DECIMAL(10,2),
    net_salary DECIMAL(10,2),
    payment_date DATE,

    FOREIGN KEY (employee_id)
    REFERENCES Employees(employee_id)
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12,2),
    status VARCHAR(20)
);

CREATE TABLE Employee_Projects (
    employee_project_id INT PRIMARY KEY,
    employee_id INT,
    project_id INT,
    assigned_date DATE,
    role VARCHAR(50),

    FOREIGN KEY (employee_id)
    REFERENCES Employees(employee_id),

    FOREIGN KEY (project_id)
    REFERENCES Projects(project_id)
);

CREATE TABLE Performance (
    performance_id INT PRIMARY KEY,
    employee_id INT,
    review_date DATE,
    rating INT,
    remarks VARCHAR(200),

    FOREIGN KEY (employee_id)
    REFERENCES Employees(employee_id)
);

SHOW TABLES;

DESC Departments;
DESC Employees;
DESC Attendance;
DESC Leave_Requests;
DESC Payroll;
DESC Projects;
DESC Employee_Projects;
DESC Performance;


INSERT INTO Departments VALUES
(101,'Human Resources','Ahmedabad'),
(102,'Finance','Mumbai'),
(103,'Sales','Delhi'),
(104,'Marketing','Pune'),
(105,'IT','Bangalore'),
(106,'Operations','Hyderabad'),
(107,'Customer Support','Jaipur'),
(108,'Administration','Surat'),
(109,'Research','Chennai'),
(110,'Legal','Kolkata');

INSERT INTO Employees
(employee_id,first_name,last_name,gender,dob,phone,email,department_id,designation,hire_date,salary,manager_id,status)
VALUES
(1001,'Rahul','Sharma','Male','1998-02-15','9876543210','rahul@gmail.com',105,'Software Engineer','2023-01-10',55000,NULL,'Active'),

(1002,'Priya','Patel','Female','1997-08-21','9876543211','priya@gmail.com',101,'HR Executive','2022-05-15',45000,NULL,'Active'),

(1003,'Amit','Verma','Male','1996-11-05','9876543212','amit@gmail.com',102,'Accountant','2021-06-18',50000,NULL,'Active'),

(1004,'Sneha','Joshi','Female','1999-01-12','9876543213','sneha@gmail.com',103,'Sales Executive','2023-03-20',42000,NULL,'Active'),

(1005,'Karan','Mehta','Male','1995-07-30','9876543214','karan@gmail.com',104,'Marketing Executive','2020-02-01',48000,NULL,'Active'),

(1006,'Neha','Shah','Female','1998-09-18','9876543215','neha@gmail.com',105,'Data Analyst','2022-08-12',60000,NULL,'Active'),

(1007,'Rohit','Singh','Male','1994-04-14','9876543216','rohit@gmail.com',106,'Operations Manager','2019-04-15',75000,NULL,'Active'),

(1008,'Pooja','Gupta','Female','1997-06-25','9876543217','pooja@gmail.com',107,'Support Executive','2023-01-25',38000,NULL,'Active'),

(1009,'Vikas','Yadav','Male','1996-12-02','9876543218','vikas@gmail.com',108,'Admin Officer','2021-09-10',43000,NULL,'Active'),

(1010,'Anjali','Kapoor','Female','1998-10-10','9876543219','anjali@gmail.com',109,'Research Analyst','2022-11-01',65000,NULL,'Active');

SELECT * FROM Departments;

SELECT * FROM Employees;

INSERT INTO Attendance
(attendance_id,employee_id,attendance_date,check_in,check_out,working_hours,status)
VALUES
(1,1001,'2026-07-01','09:00:00','18:00:00',9.00,'Present'),
(2,1002,'2026-07-01','09:15:00','18:10:00',8.92,'Present'),
(3,1003,'2026-07-01','09:30:00','18:00:00',8.50,'Present'),
(4,1004,'2026-07-01','10:00:00','18:00:00',8.00,'Late'),
(5,1005,'2026-07-01','09:05:00','18:00:00',8.92,'Present'),
(6,1006,'2026-07-01','09:00:00','18:30:00',9.50,'Present'),
(7,1007,'2026-07-01','09:10:00','18:00:00',8.83,'Present'),
(8,1008,'2026-07-01','09:45:00','18:00:00',8.25,'Late'),
(9,1009,'2026-07-01','09:20:00','18:00:00',8.67,'Present'),
(10,1010,'2026-07-01','09:00:00','18:00:00',9.00,'Present');

INSERT INTO Leave_Requests
(leave_id,employee_id,leave_type,start_date,end_date,reason,leave_status)
VALUES
(1,1002,'Casual Leave','2026-07-10','2026-07-11','Personal Work','Approved'),
(2,1004,'Sick Leave','2026-07-15','2026-07-16','Fever','Approved'),
(3,1006,'Earned Leave','2026-07-20','2026-07-22','Family Function','Pending'),
(4,1008,'Casual Leave','2026-07-25','2026-07-25','Personal Work','Approved'),
(5,1010,'Sick Leave','2026-07-28','2026-07-29','Medical','Pending');

INSERT INTO Payroll
(payroll_id,employee_id,basic_salary,bonus,deduction,net_salary,payment_date)
VALUES
(1,1001,55000,5000,2000,58000,'2026-07-31'),
(2,1002,45000,3000,1000,47000,'2026-07-31'),
(3,1003,50000,4000,1500,52500,'2026-07-31'),
(4,1004,42000,2500,1000,43500,'2026-07-31'),
(5,1005,48000,3500,1500,50000,'2026-07-31'),
(6,1006,60000,6000,2500,63500,'2026-07-31'),
(7,1007,75000,8000,3000,80000,'2026-07-31'),
(8,1008,38000,2000,500,39500,'2026-07-31'),
(9,1009,43000,2500,1000,44500,'2026-07-31'),
(10,1010,65000,7000,2500,69500,'2026-07-31');

INSERT INTO Projects
(project_id,project_name,start_date,end_date,budget,status)
VALUES
(1,'HR Automation','2026-01-01','2026-06-30',500000,'Completed'),
(2,'Payroll System','2026-02-01','2026-08-30',800000,'Running'),
(3,'Sales Dashboard','2026-03-01','2026-09-30',650000,'Running'),
(4,'Employee Portal','2026-04-01','2026-10-30',900000,'Running'),
(5,'Attendance App','2026-05-01','2026-11-30',450000,'Planning');

INSERT INTO Employee_Projects
(employee_project_id,employee_id,project_id,assigned_date,role)
VALUES
(1,1001,4,'2026-04-02','Developer'),
(2,1002,1,'2026-01-02','HR Lead'),
(3,1003,2,'2026-02-05','Finance Analyst'),
(4,1004,3,'2026-03-05','Sales Executive'),
(5,1005,3,'2026-03-10','Marketing Executive'),
(6,1006,4,'2026-04-10','Data Analyst'),
(7,1007,2,'2026-02-10','Project Manager'),
(8,1008,5,'2026-05-10','Support Executive'),
(9,1009,1,'2026-01-15','Admin Officer'),
(10,1010,4,'2026-04-15','Research Analyst');

INSERT INTO Performance
(performance_id,employee_id,review_date,rating,remarks)
VALUES
(1,1001,'2026-06-30',5,'Excellent'),
(2,1002,'2026-06-30',4,'Very Good'),
(3,1003,'2026-06-30',4,'Good'),
(4,1004,'2026-06-30',3,'Needs Improvement'),
(5,1005,'2026-06-30',5,'Outstanding'),
(6,1006,'2026-06-30',5,'Excellent'),
(7,1007,'2026-06-30',5,'Outstanding'),
(8,1008,'2026-06-30',4,'Very Good'),
(9,1009,'2026-06-30',3,'Average'),
(10,1010,'2026-06-30',5,'Excellent');

SELECT * FROM Employees;

SELECT * FROM Departments;

SELECT first_name, last_name
FROM Employees;

SELECT *
FROM Employees
WHERE status='Active';

SELECT *
FROM Employees
WHERE salary>50000;

SELECT *
FROM Employees
WHERE department_id=105;

SELECT *
FROM Employees
WHERE hire_date>'2022-01-01';

SELECT *
FROM Employees
WHERE gender='Female';

SELECT *
FROM Employees
WHERE gender='Male';

SELECT *
FROM Employees
ORDER BY salary DESC;

SELECT *
FROM Employees
ORDER BY salary ASC
LIMIT 1;

SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 1;

SELECT *
FROM Employees
WHERE salary BETWEEN 40000 AND 60000;

SELECT *
FROM Employees
WHERE first_name LIKE 'A%';

SELECT *
FROM Employees
WHERE first_name LIKE '%a';

SELECT COUNT(*) AS Total_Employees
FROM Employees;

SELECT AVG(salary) AS Average_Salary
FROM Employees;

SELECT MAX(salary) AS Highest_Salary
FROM Employees;

SELECT MIN(salary) AS Lowest_Salary
FROM Employees;

SELECT SUM(salary) AS Total_Salary
FROM Employees;

SELECT department_id, COUNT(*) AS Total_Employees
FROM Employees
GROUP BY department_id;

SELECT department_id, SUM(salary) AS Total_Salary
FROM Employees
GROUP BY department_id;

SELECT department_id, AVG(salary) AS Average_Salary
FROM Employees
GROUP BY department_id;

SELECT department_id, MAX(salary) AS Highest_Salary
FROM Employees
GROUP BY department_id;

SELECT department_id, MIN(salary) AS Lowest_Salary
FROM Employees
GROUP BY department_id;

SELECT department_id, COUNT(*) AS Total_Employees
FROM Employees
GROUP BY department_id
HAVING COUNT(*) > 1;

SELECT department_id, AVG(salary) AS Average_Salary
FROM Employees
GROUP BY department_id
HAVING AVG(salary) > 50000;

SELECT COUNT(*) AS Male_Employees
FROM Employees
WHERE gender='Male';

SELECT COUNT(*) AS Female_Employees
FROM Employees
WHERE gender='Female';

SELECT gender, COUNT(*) AS Total
FROM Employees
GROUP BY gender;

SELECT *
FROM Employees
WHERE YEAR(hire_date)=2023;

SELECT *
FROM Employees
WHERE MONTH(hire_date)=7;

SELECT *
FROM Employees
WHERE salary >
(
SELECT AVG(salary)
FROM Employees
);

SELECT *
FROM Employees
WHERE salary =
(
SELECT MAX(salary)
FROM Employees
);

SELECT *
FROM Employees
WHERE salary =
(
SELECT MIN(salary)
FROM Employees
);

SELECT *
FROM Employees
WHERE salary NOT BETWEEN 40000 AND 60000;

SELECT *
FROM Employees
WHERE department_id IN (101,105);

SELECT *
FROM Employees
WHERE department_id <> 101;

SELECT *
FROM Employees
ORDER BY first_name ASC;

SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 5;

SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

SELECT e.first_name,
       d.department_name,
       e.salary
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

SELECT e.first_name,
       a.attendance_date,
       a.status
FROM Employees e
INNER JOIN Attendance a
ON e.employee_id = a.employee_id;

SELECT e.first_name,
       p.net_salary,
       p.payment_date
FROM Employees e
INNER JOIN Payroll p
ON e.employee_id = p.employee_id;

SELECT e.first_name,
       l.leave_type,
       l.start_date,
       l.end_date,
       l.leave_status
FROM Employees e
INNER JOIN Leave_Requests l
ON e.employee_id = l.employee_id;

SELECT e.first_name,
       pr.project_name,
       ep.role
FROM Employees e
INNER JOIN Employee_Projects ep
ON e.employee_id = ep.employee_id
INNER JOIN Projects pr
ON ep.project_id = pr.project_id;

SELECT e.first_name,
       p.rating,
       p.remarks
FROM Employees e
INNER JOIN Performance p
ON e.employee_id = p.employee_id;

SELECT e.first_name,
       d.department_name,
       e.designation,
       e.salary
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

SELECT e.employee_id,
       e.first_name
FROM Employees e
LEFT JOIN Leave_Requests l
ON e.employee_id = l.employee_id
WHERE l.leave_id IS NULL;

SELECT e.employee_id,
       e.first_name
FROM Employees e
LEFT JOIN Employee_Projects ep
ON e.employee_id = ep.employee_id
WHERE ep.employee_project_id IS NULL;

SELECT e.first_name,
       e.salary,
       p.bonus,
       p.deduction,
       p.net_salary
FROM Employees e
INNER JOIN Payroll p
ON e.employee_id = p.employee_id;

SELECT e.first_name,
       a.attendance_date,
       a.status
FROM Employees e
INNER JOIN Attendance a
ON e.employee_id = a.employee_id;

SELECT e.first_name,
       l.leave_type
FROM Employees e
INNER JOIN Leave_Requests l
ON e.employee_id = l.employee_id
WHERE l.leave_status = 'Approved';

SELECT e.first_name,
       pr.project_name
FROM Employees e
INNER JOIN Employee_Projects ep
ON e.employee_id = ep.employee_id
INNER JOIN Projects pr
ON ep.project_id = pr.project_id
WHERE pr.status = 'Running';

SELECT e.first_name,
       d.department_name,
       e.salary
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id
ORDER BY e.salary DESC
LIMIT 1;

SELECT d.department_name,
       COUNT(e.employee_id) AS Total_Employees
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

SELECT d.department_name,
       SUM(e.salary) AS Total_Salary
FROM Departments d
INNER JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

SELECT d.department_name,
       AVG(e.salary) AS Average_Salary
FROM Departments d
INNER JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

SELECT d.department_name,
       MAX(e.salary) AS Highest_Salary
FROM Departments d
INNER JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

SELECT d.department_name,
       MIN(e.salary) AS Lowest_Salary
FROM Departments d
INNER JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;