--  root connection 

create database tcl ;

use tcl ;

create table tcl.test (id int , name varchar(20) ) ;
insert into tcl.test values (18 , 'Shubham') ; 


select @@autocommit ; -- by default auto 

start transaction ;
insert into tcl.test values (20 , 'Arya' ) ;
select * from test ;  --  two rows hare dont show secont -- isolated 

commit ; --  save the change in database  (1) 

start transaction ;
insert into tcl. test values(20, 'japan');
insert into tcl.test values(21, 'north korea');

rollback ; --  to revert the two lines inserted   (2 ) 
select * from test ; 


