show databases;

use joinsdb ;
CREATE TABLE depart (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);
INSERT INTO depart VALUES
(10,'HR','Jaipur'),
(20,'IT','Bangalore'),
(30,'Finance','Mumbai'),
(40,'Marketing','Delhi'),
(50,'Legal','Pune');

drop table empl ;
CREATE TABLE empl (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
dept_id INT,
salary INT,
city VARCHAR(50)
);
INSERT INTO empl VALUES
(101,'Amit',10,45000,'Jaipur'),
(102,'Bhavna',20,72000,'Bangalore'),
(103,'Chirag',20,68000,'Bangalore'),
(104,'Divya',30,55000,'Mumbai'),
(105,'Esha',NULL,39000,'Delhi'),
(106,'Farhan',40,61000,'Delhi'),
(107,'Gaurav',60,50000,'Kolkata'),
(108,'Hina',30,83000,'Mumbai');
CREATE TABLE projects (
proj_id INT PRIMARY KEY,
proj_name VARCHAR(50),
dept_id INT,
budget INT
);
INSERT INTO projects VALUES
(1,'Payroll Revamp',10,120000),
(2,'Cloud Migration',20,500000),
(3,'Mobile App',20,300000),
(4,'Audit Automation',30,250000),
(5,'Brand Refresh',40,180000);


select * from depart ;
select * from empl;
select * from proje  bcts ;
use joinsdb ;

-- Q1. List each employee with their department name and location.
select e.emp_id ,  e.emp_name  , d.dept_name , d.location from empl as e 
inner join depart as d 
on e.dept_id = d.dept_id  ;


-- Q2. Show every project along with the name of the department that owns it.
select p.proj_id , p.proj_name , d.dept_name , p.budget from projects as p 
inner join depart as d 
on p.dept_id = d.dept_id ;


-- Q3. Show employee names together with the projects run by their own department.
select e.emp_name ,  dept_name , p.proj_name  from empl as e 
inner join depart  as d 
on e.dept_id = d.dept_id 
inner join projects as p 
on d.dept_id = p.dept_id  ;


-- Q4. List ALL employees with their department name; show NULL when the employee has no matching department.
select e.emp_id , e.emp_name , e.dept_id , d.dept_name from empl as e 
left join depart as d  
on e.dept_id = d.dept_id ;


-- Q5. list all departments with their projects; departments with no project must still appear.
select d.dept_id, d.dept_name, p.proj_name, p.budget
from depart as d
left join projects as p
on d.dept_id = p.dept_id;


-- Q6. find only those employees who do not belong to any valid department.
select e.emp_id, e.emp_name, e.dept_id
from empl as e
left join depart as d
on e.dept_id = d.dept_id
where d.dept_id is null;


-- Q7. list all departments and any employees in them, using a right join with employees on the left.
select e.emp_name, d.dept_id, d.dept_name
from empl as e
right join depart as d
on e.dept_id = d.dept_id;

-- Q8. list all projects and the department that owns them, keeping projects that point to a missing department.
select d.dept_name, p.proj_id, p.proj_name, p.dept_id
from depart as d
right join projects as p
on d.dept_id = p.dept_id;


-- Q9. find departments that currently have no employee assigned.
select d.dept_id, d.dept_name, d.location
from depart as d
left join empl as e
on d.dept_id = e.dept_id
where e.emp_id is null;

-- Q10. produce every possible pairing of the finance/legal departments with employees earning above 70000.
select e.emp_name, e.salary, d.dept_name
from empl as e
cross join depart as d
where e.salary > 70000
and d.dept_name in ('Finance','Legal');

-- Q11. pair every project having a budget of at least 400000 with every department located in mumbai or pune.
select p.proj_name, p.budget, d.dept_name, d.location
from projects as p
cross join depart as d
where p.budget >= 400000
and d.location in ('Mumbai','Pune');

-- Q12. how many total row combinations result from cross join of employees and departments?
select count(*) as total_combinations
from empl as e
cross join depart as d;

-- Q13. show employees whose salary is greater than 60000.
select emp_id, emp_name, dept_id, salary, city
from empl
where salary > 60000;

-- Q14. show all employees based in delhi or mumbai.
select emp_id, emp_name, salary, city
from empl
where city in ('Delhi','Mumbai');

-- Q15. show employees whose dept_id is null (unassigned employees).
select emp_id, emp_name, dept_id, salary
from empl
where dept_id is null;

-- Q16. show departments located in bangalore or delhi.
select dept_id, dept_name, location
from depart
where location in ('Bangalore','Delhi');

-- Q17. show departments whose dept_id is 30 or higher.
select dept_id, dept_name, location
from depart
where dept_id >= 30;

-- Q18. show departments whose name starts with the letter 'f' or 'l'.
select dept_id, dept_name, location
from depart
where dept_name like 'F%'
or dept_name like 'L%';

-- Q19. show projects with a budget between 200000 and 400000 (inclusive).
select proj_id, proj_name, dept_id, budget
from projects
where budget between 200000 and 400000;

-- Q20. show all projects that belong to dept_id 20.
select proj_id, proj_name, dept_id, budget
from projects
where dept_id = 20;

-- Q21. show projects whose name contains the word 'a' and budget is under 300000.
select proj_id, proj_name, budget
from projects
where proj_name like '%a%'
and budget < 300000;


-- Q22. show employee name, department name, location and project name for all matching rows across all three tables.
select e.emp_name, d.dept_name, d.location, p.proj_name, p.budget
from empl as e
inner join depart as d
on e.dept_id = d.dept_id
inner join projects as p
on d.dept_id = p.dept_id;


-- Q23. show all employees, plus department and project details where available (keep employees even with no dept/project).
select e.emp_id, e.emp_name, d.dept_name, p.proj_name
from empl as e
left join depart as d
on e.dept_id = d.dept_id
left join projects as p
on d.dept_id = p.dept_id;


-- Q24. show employees earning more than 60000 along with department and any project over 250000 budget.
select e.emp_name, e.salary, d.dept_name, p.proj_name, p.budget
from empl as e
inner join depart as d
on e.dept_id = d.dept_id
inner join projects as p
on d.dept_id = p.dept_id
where e.salary > 60000
and p.budget > 250000;


-- Q25. list all departments with their employees and projects, including departments having neither.
select d.dept_id, d.dept_name, e.emp_name, p.proj_name
from depart as d
left join empl as e
on d.dept_id = e.dept_id
left join projects as p
on d.dept_id = p.dept_id;


-- Q26. show employees who work in a department located in bangalore or mumbai, along with the projects of that department.
select e.emp_name, d.location, p.proj_name
from empl as e
inner join depart as d
on e.dept_id = d.dept_id
inner join projects as p
on d.dept_id = p.dept_id
where d.location in ('Bangalore','Mumbai');


-- Q27. pair employees who work in the same city (avoid duplicate pairs and self-pairing).
select e1.emp_name as employee_1,
e2.emp_name as employee_2,
e1.city
from empl as e1
inner join empl as e2
on e1.city = e2.city
and e1.emp_id < e2.emp_id;


-- Q28. show every project along with employees of that department; keep projects with no employees.
select p.proj_name, p.dept_id, e.emp_name
from projects as p
left join empl as e
on p.dept_id = e.dept_id;


