 create  database ecommerce;
USE ecommerce;
create table customers (
customer_id INT PRIMARY KEY
auto_increment,
name varchar(50) NOT NULL,
email varchar(50) NOT NULL unique
);

CREATE TABLE orders (
order_id INT PRIMARY KEY
auto_increment,
customer_id INT NOT NULL,
order_date DATE NOT NULL,
total_amount DECIMAL(10, 2) NOT
NULL,
foreign key (customer_id)
references customers (customer_id)
);

create table order_items (
oder_item_id INT PRIMARY KEY
auto_increment,
order_id INT NOT NULL,
product_name VARCHAR(50) NOT NULL,
quantity INT NOT NULL,
unit_price decimal (10, 2) NOT NULL,
foreign key (order_id) references
orders (order_id)
);


create table products (
product_id INT PRIMARY KEY 
auto_increment,
product_name varchar(50) NOT NULL,
category varchar(50) NOT NULL,
describtion varchar(255) NOT NULL
);


INSERT INTO customers (name, email)
VALUES
('John Doe', 'john.doe@gmail.com'),
('jan Doe','jane.doe@gmail.com'),
('Bob Smith', 'bob.Smith@gmail.com'), 
('Alice Sith','alice.smith@gmail.com');


INSERT INTO orders (customer_id, order_date, 
total_amount) VALUES
(1, '2022-01-01', 100.00),
(1, '2022-02-01', 200.00),
(2, '2022-01-01', 50.00),
(2, '2022-02-01', 75.00),
(3, '2022-01-01', 150.00),
(3, '2022-02-01', 100.00),
(4, '2022-01-01', 200.00),
(4, '2022-01-01', 250.00);


INSERT INTO order_items (order_id,
product_name, quantity, unit_price)
VALUES
(1, 'product A', 2, 25.00),
(1, 'product B', 3, 10.00),
(2, 'product A', 1, 25.00),
(2, 'product B', 4, 19.00);


select 
customers.name,
order_items.product_name,
order_items.quantity,
CASE

   when order_items.quantity >= 3
   THEN 'LARG ORDER'
   WHEN order_items.quantity <= 2
   THEN 'MEDIUM ORDER'
   
       ELSE 'SMALL ORDER'
       
       END AS order_size
       
       From 
         ecommerce.customers
         INNER JOIN ecommerce.order_items
         ON customers.customer_id =
         order_items.order_id;
         
         
         




