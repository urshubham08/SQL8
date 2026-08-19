create database DDl ;
use ddl ;
create table ddl.employee1 (id int ) ;
create table department (id int )  ;
select * from ddl.employee1 ;

-- ddl (alter) 

alter table ddl.employee1 add column name varchar(20) ;               --  add a column change structure 
alter table ddl.employee1 add column order_id int ;                    -- add a column  
alter table ddl.employee1 add column city varchar(20) ;                --  add a column 
alter table ddl.employee1 add column emp_id int ;                      -- add column 
alter table ddl.employee1 modify column name int  ;                   -- change deta type 

alter table ddl.employee1 drop column city ;                          --  drop the column 



alter table ddl.employee1 add constraint unique(name) ;              -- constraint use 
alter table ddl.employee1 modify column emp_id int not null ;        --  not null constraint 

alter table ddl.employee1  modify column emp_id int primary key ;   --  primary key 
alter table ddl.employee1  drop column emp_id ;
alter table ddl.employee1  add constraint primary key(order_id ) ;  --  now this is primmary key 

alter table ddl.employee1 rename column emp_id to id ;              -- rename the column 
alter table ddl.employee1 rename to EMP_DATA ;                      -- renmae the table name 

-- Truncate 
select * from ddl.employee1 ; 
insert into ddl.employee1 values ('Shubham' , 101 ) ;

truncate ddl.employee1 ; -- first it drop the table then recreat the table again 

insert into ddl.employee1 values ('Shubham' ,101 ) ,('Arya' , 102 ) ,('Kreena' , 103 ) ;

SET SQL_SAFE_UPDATES = 0;

-- update    -- will make chnage to every row 
update ddl.employee1 set name  = '420' ;  -- all name replace with 420 
update ddl.employee1 set id = '10001' where id = 101;

-- delete -- all row also use condition 

delete from ddl.employee1 where id  = 102 ; -- delete cpondition row 
delete from ddl.employee1 ; -- delete all row 

-- truncate and delete 
-- csv file 20 -5 0 record andd try to im[port in my sql 
-- TCL 
-- ACID property why we use 

















create table ddl.employee1 (name varchar(20)) ;
alter table ddl.employee1 add column id int ;
use ddl ;
select * from employee1 ;
