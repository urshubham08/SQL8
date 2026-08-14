-- lag and lead 
use windowsdb;
select * from orders ;

select * , lead(amount , 1 ) over () from orders ; -- take next row 

select * , lead(amount , 2 ) over () from orders ; -- take 2nd next 

select * , lag(amount ,1) over () from orders ;  -- take privious 

select * , lag (customer_name , 1 ) over ()  from orders ; -- take previous 

select * , lead(amount,1 ,100)  over ()  , lag(amount,1 ,500) over () from orders ; 

select * from orders order by customer_name ;

select * , lead(amount , 1 ) over(partition by order_id  order by order_date) , 
amount - lead(amount , 1 ) over(partition by order_id  order by order_date)  from orders ; 

select * , lag(amount , 1 ,0 ) over (partition by customer_id  order by order_date ) as prev2 ,
lag(amount , 2 ,0  ) over (partition by customer_id order by order_date ) as prev3 ,
amount + lag(amount , 1 ,1 ) over (partition by customer_id  order by order_date )  + lag(amount , 2 , 0 ) over (partition by customer_id order by order_date )
from orders ;
 
 
 -- rowsbetween 
 



