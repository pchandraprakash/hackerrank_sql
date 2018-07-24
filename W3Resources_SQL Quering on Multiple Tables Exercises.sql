--1. Write a query to find those customers with their name and those salesmen with their name and city who lives in the same city.
select customer.cust_name, salesman.name, salesman.city from salesman, customer where salesman.city=customer.city;

--2. Write a SQL statement to find the names of all customers along with the salesmen who works for them.
select customer.cust_name,salesman.name from customer,salesman where customer.salesman_id=salesman.salesman_id;

--3. Write a SQL statement to display all those orders by the customers not located in the same cities where their salesmen live. 
select orders.ord_no,customer.customer_id,salesman.salesman_id from orders,customer,salesman where customer.city != salesman.city and orders.customer_id = customer.customer_id and orders.salesman_id = salesman.salesman_id;

--4. Write a SQL statement that finds out each order number followed by the name of the customers who made the order. 
select orders.ord_no, customer.cust_name from orders,customer where orders.customer_id = customer.customer_id;

--5. Write a SQL statement that sorts out the customer and their grade who made an order. Each of the customers must have a grade and served by at least a salesman, who belongs to a city. 
select customer.cust_name, customer.grade, orders.ord_no, salesman.name from salesman,customer,orders where
orders.customer_id = customer.customer_id and salesman.salesman_id = orders.salesman_id and salesman.city is not null and customer.grade is not null;

--6. Write a query that produces all customers with their name, city, salesman and commission, who served by a salesman and the salesman works at a rate of the commission within 12% to 14%.
select customer.cust_name,salesman.name, salesman.city, salesman.commission from customer, salesman where customer.salesman_id = salesman.salesman_id and salesman.commission between 0.12 and 0.14;

--7. Write a SQL statement that produces all orders with the order number, customer name, commission rate and earned commission amount for those customers who carry their grade is 200 or more and served by an existing salesman.
select orders.ord_no, customer.cust_name, salesman.commission, (salesman.commission * orders.purch_amt) as "earned_commission" from salesman, orders, customer where customer.grade >= 200 and customer.customer_id = orders.customer_id and salesman.salesman_id = orders.salesman_id ;