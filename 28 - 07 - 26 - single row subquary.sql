-- Subuary 
--  also known as nsted quary 
-- in which quary is praseney inside a another quary 
-- 
create database CORR_DB ;
drop table employee_c ;
use  corr_db ;
create table employee_c (id int , name varchar (20) , salary int);

insert into employee_c values (1 ,'a'  ,100 ) , (2 , 'b' , 250 ) , (3 , 'c' , 400 ) , (4 ,'d' , 380 ) ;
insert into employee_c values ( 5, 'e' , 250 ) ;
select max(salary) from employee_c ;

select * from employee_c where salary = (select max(salary) from employee_c )  ;

select * from employee_c where salary = ( select min(salary) from employee_c ) ;

select * from employee_c where salary = (select salary from employee_c where name = 'b' ) ;

 -- id name jiski salayy avg salary all emp se jayda ho 
 
 select * from employee_c where salary >  (select avg(salary) from employee_c ) ;
 
 use world ;
 
 -- get namme of city where the distric of city is same for abu dhabi 
 -- get all column from city table where population 
 --  get the district and name of the city where the country ccode is same for herat 
 -- get the distric city and the population for all the country where amsterdam is present  sort by populatio n
 select * from city ;
SELECT Name
FROM city
WHERE District = (
    SELECT District
    FROM city
    WHERE Name = 'Abu Dhabi'
);
SELECT District, Name, Population
FROM city
WHERE CountryCode = (
    SELECT CountryCode
    FROM city
    WHERE Name = 'Amsterdam'
)
ORDER BY Population DESC;
select name , district , population from city where name = (select name from city where name =  'Amsterdam' ) ;
select name , District from city where CountryCode = (select CountryCode from city where name = 'herat' ) ;

-- single row subwuary 