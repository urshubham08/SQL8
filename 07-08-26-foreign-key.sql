drop database if exists foreigndb;
create database foreigndb;

use foreigndb;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers VALUES
(101,'John'),
(102,'Alice'),
(103,'David');

insert into customers values 
(108 , 'shubham');

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

INSERT INTO products VALUES
(1,'Laptop'),
(2,'Mouse'),
(3,'Keyboard');



CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    CONSTRAINT any_name_fk FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON DELETE CASCADE,
    CONSTRAINT a_name_fk FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);

INSERT INTO orders
VALUES
(1,101,1,2);

INSERT INTO orders
VALUES
(2,999,1,1);

-- we do join. [Wrong name]
SELECT 
    *
FROM
    orders o
        LEFT JOIN
    customers c ON o.customer_id = c.customer_id;



INSERT INTO orders
VALUES
(3,101,500,1);




INSERT INTO orders
VALUES
(3,102,500,1);

INSERT INTO orders
VALUES
(5,102,55,22);


INSERT INTO orders
VALUES
(4,108,500,1);

SELECT 
    *
FROM
    orders;




-- wrong can't order if the product is not listed
SELECT 
    *
FROM
    orders o
        LEFT JOIN
    products p ON o.product_id = p.product_id;






-- ----------- $$$$$$$$ ------

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);



-- ------------------------------- 
-- create table child_table (
-- 	column data_type
--     column data_type 
--     ...
--     constraint fk_name foreigh key (column 1) reference parent_table (current_column ) 
--     


SELECT 
    *
FROM
    customers;
-- DML (insert) 

DELETE FROM customers 
WHERE
    customer_id = 101; -- parent recoord 


