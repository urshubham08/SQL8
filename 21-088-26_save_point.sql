show tables ;

use tcl ;

select * from tcl.test ;


start transaction ;
insert into tcl.test values (101 , 'Kreena' ) ;
delete from tcl.test where id = 18 ;

SET SQL_SAFE_UPDATES = 0;

select * from tcl.test ; -- 2 record 

rollback ; -- revert to specific point 

select * from tcl.test ;

start transaction ;
insert into tcl.test values (102 , 'dev' ) , (103 , 'devi' ) , (103 , 'archna' ) ;
select * from tcl.test ;-- all record 

rollback;

select * from tcl.test ;  -- 2 record only 



insert into tcl.test values (102 , 'dev' ) , (103 , 'devi' ) ;


savepoint test_insert_chak1 ; ; 

select * from tcl.test ; --  4 record only 
insert into tcl.test values (105 , 'name' ) , (106 , 'surname' ) ;

select * from tcl.test ; -- 6 record 

rollback to test_insert_chak1 ;




