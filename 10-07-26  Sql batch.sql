-- function 
--  block of code , collaection of a statment == perform certain task 
--  code reusuable ,
-- code duplicacy is removed
--  make your code divided into smaller section 


-- inbuild function 
-- scalar function == aapplies on every eow and returen the output for every row 

-- string , number , dates 

show databases;

use employees ;

seLECT * FROM employees;


select FIRST_NAME , LAST_NAME , concat_ws(' ' , BIRTH_DATE , HIRE_DATE) FROM employees;

SELECT  emp_id  , substr(first_name , 2) from employees;  --  substr me  jo fuction hai bo hi use hoga 

SELECT  first_name  , substr(first_name , 2) from employees;  -- Done 

select length(first_name)  from employees ; -- char_lenght is useable 

select first_name , replace(first_name , 'a' , '@' ) from employees;  -- 

select    trim('   he '  ) ;

select first_name , lpad( first_name , 2 , '@') from employees ;


