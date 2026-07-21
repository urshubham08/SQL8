-- Q1. Find the total number of employees in each department.
select dept , count(*) AS totalemployee from emp group by dept ;

-- Q2. Find the total salary paid per department.
select dept , sum(salary)  as totalsalary from emp group by dept order by dept ;

-- Q3. Find the average salary in each city
select city , avg(salary)  as avgsalary from emp group by city ;

-- Q4. Find the maximum salary in each department
select dept , max(salary) as maxsalary from emp group by dept ;

-- Q5. Find the minimum salary in each department.
select dept , min(salary)  as minsalary from emp group by dept ;

-- Q6. List departments with their employee count, sorted by count descending
select dept , count(*)  as empcount from emp group by dept order by dept ;

--  Q7. List cities with total salary, sorted by TotalSalary ascending.
select city , sum(salary)  as totalsalary from emp group by city order by city desc;

-- Q8. List all employees ordered by department (A–Z) then by salary (highest first).
select name , dept , sum(salary) from emp group by name , dept order by dept asc , sum(salary) desc;

-- Q9. List all employees ordered by city (A–Z) then by join date (oldest first)
select name , city , joindate from emp order by city  asc , joindate asc ;


-- Q10. List all employees ordered by role (A–Z) then by salary (lowest first). Q10. List all employees ordered by role (A–Z) then by salary (lowest first).
select * from  emp order by role asc , Salary asc ;

-- Q11.Show only departments that have more than 7 employees.
select dept , count(*) as total_employee from emp group by dept having count(*) > 7;

--  Q12. Show departments where the average salary exceeds 65000.
select dept , avg(salary) as average_salary from  emp group by  dept having avg(salary) > 65000;

-- Q13. Show cities where the total salary bill is greater than 650000.
select city , sum(salary) as totalsalary  from emp group by city having totalsalary > 650000;

-- Q14. Show departments where the maximum salary is at least 80000.
 select dept ,  max(salary) as maxsalary from emp group by dept having maxsalary >  80000;
 
 -- Q15. Show roles that appear more than 5 times in the table.
  select role , count(*) as RoleCount from emp group by role having Rolecount > 5  ;
 
 -- Q16. Find the overall average salary of all employees.
  select avg(salary) as CompanyAvgSalary from emp ;
 
--  Q17. Count how many female employees exist in each department.
select * from emp  ; 
select dept , count(*) as femalecount from emp where gender = 'f' group by dept ;

-- Q18 Find the highest and lowest salary across the entire company.
select max(salary) as highest  , min(salary) as lowest from emp ;

-- Q19. Find the total salary paid to employees who joined after 2019-01-01.
select sum(salary) from emp where joindate > 2019-01-01 ;

-- Q20. Find the average salary grouped by gender.
select  gender , avg(salary) from emp group by gender ;

-- Q21. Find total employees grouped by department AND city
select dept , city ,  count(*) from emp group by dept , city  order by dept  ;

--  Q22. Find average salary grouped by department AND gender.
select dept , gender , avg(salary) as avgsalary from emp group by dept , gender order by dept ;

-- Q23. Find total salary grouped by city AND role, ordered by city and total salary descending.
select city , role , sum(salary)  as totalsalary from emp group by city , role order by city asc ,totalsalary desc;

-- Q24. Count employees grouped by department AND role, show only groups with more than 1 employee.
select dept , role , count(*) as empcount from emp group by dept , role having empcount >   1 order  by dept ;

-- Q25. Find max salary grouped by city AND gender.
select city , gender , max(salary) from emp group by city , gender  ; 

-- Q26. Show departments with avg salary > 60000, ordered by avg salary descending.
select dept, avg(salary) as avg_salary from emp group by dept having avg(salary) > 60000 order by avg_salary desc;

--  Q27. Show city+dept combos with more than 1 employee, ordered by count descending then city
select city, dept, count(*) as total_employee from emp group by city, dept having count(*) > 1 order by total_employee desc, city asc;

--  Q28. Show roles where total salary exceeds 300000, ordered by total salary ascending
select role, sum(salary) as total_salary from emp group by role having sum(salary) > 300000 order by total_salary asc;

-- Q29. List each employee's name in UPPER CASE along with the year they joined, ordered by join year
select upper(name) as employee_name, year(joindate) as join_year from emp order by join_year asc;

-- Q30. Find the number of employees who joined each year, sorted by year.
select year(joindate) as join_year, count(*) as total_employee from emp group by year(joindate) order by join_year asc;
 
 