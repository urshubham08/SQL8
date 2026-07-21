use world ;
select * from departments;
select * from employees ;


select c.id , c.name , c.countrycode , cty.code , cty.name from city as c 
natural join country as cty  ;  -- no record beacuse koi same column nhi hai h m    



select * from city ;
select * from country ;


create database selfjoindb ; 

drop database selfjoindb ;
use selfjoindb ;


create table emp (id int , name varchar(20) , manger_id int ) ;

insert into emp value ( 1 , 'Tushar' , null ) , ( 2 , 'abhinav' , 1 ) , (3 ,'shubham' , 1 ) ,(4  , 'akshya' , 2 ) ;



select * FROM EMP ;

select e.id , e.name , e.manger_id , m.id , m.name  from emp as e  join emp as m where e.manager_id = m.eid ;

select from emp as m ;