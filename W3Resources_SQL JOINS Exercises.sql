--1. Write a SQL statement to prepare a list with salesman name, customer name and their cities for the salesmen and customer who belongs to the same city. 
select s.name, c.cust_name, c.city from customer c inner join salesman s on c.city = s.city;

--2. Write a SQL statement to make a list with order no, purchase amount, customer name and their cities for those orders which order amount between 500 and 2000.
select o.ord_no, o.purch_amt, c.cust_name, c.city from orders o inner join customer c on o.customer_id=c.customer_id where o.purch_amt between 500 and 2000;

--3. Write a SQL statement to know which salesman are working for which customer.
select c.cust_name, s.name from customer c inner join salesman s on c.salesman_id=s.salesman_id;

--4. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who gets a commission from the company is more than 12%. 
select c.cust_name, s.name, s.commission from customer c inner join salesman s on c.salesman_id=s.salesman_id where s.commission>0.12;

--5. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who does not live in the same city where their customer lives, and gets a commission is above 12%
select c.cust_name, s.name, s.commission from customer c inner join salesman s on c.salesman_id=s.salesman_id where s.commission>0.12 and c.city!=s.city;

--6. Write a SQL statement to find the details of a order i.e. order number, order date, amount of order, which customer gives the order and which salesman works for that customer and how much commission he gets for an order. 
select o.ord_no, o.ord_date, o.purch_amt, s.name, s.commission, c.cust_name from orders o 
inner join customer c on c.customer_id=o.customer_id
inner join salesman s on s.salesman_id=o.salesman_id;

--7. Write a SQL statement to make a join on the tables salesman, customer and orders in such a form that the same column of each table will appear once and only the relational rows will come. (very important)
select * from orders natural join customer natural join salesman;

--8. Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own. 
select c.cust_name, s.name from customer c inner join salesman s on c.salesman_id=s.salesman_id;

--9. Write a SQL statement to make a list in ascending order for the customer who holds a grade less than 300 and works either through a salesman or by own.
select c.cust_name, c.customer_id, c.city, c.grade, s.name, s.city from customer c left join salesman s on c.salesman_id=s.salesman_id order by c.customer_id;

--10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to find that either any of the existing customers have placed no order or placed one or more orders.
select c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt from customer c inner join orders o on o.customer_id=c.customer_id order by o.ord_date desc;

--11. Write a SQL statement to make a report with customer name, city, order number, order date, order amount salesman name and commission to find that either any of the existing customers have placed no order or placed one or more orders by their salesman or by own.
select c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt, s.name, s.commission from orders o 
left join customer c on o.customer_id=c.customer_id left join salesman s on s.salesman_id=o.salesman_id;

--12. Write a SQL statement to make a list in ascending order for the salesmen who works either for one or more customer or not yet join under any of the customers. 
select s.name,s.salesman_id,s.city,s.commission,c.cust_name from customer c right join salesman s on s.salesman_id=c.salesman_id;

--13. Write a SQL statement to make a list for the salesmen who works either for one or more customer or not yet join under any of the customers who placed either one or more orders or no order to their supplier.
select s.name,s.salesman_id,s.city,o.ord_no,o.ord_date, c.cust_name from orders o 
right join salesman s on s.salesman_id=o.salesman_id 
right join customer c on c.customer_id=o.customer_id;

--14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier. 
select s.name, cust_name, o.ord_no, o.ord_date, c.grade, o.purch_amt from orders o 
inner join salesman s on s.salesman_id=o.salesman_id
inner join customer c on c.customer_id=o.customer_id
where c.grade is not null and o.purch_amt>2000;

--15. Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for those customers from the existing list who placed one or more orders or which order(s) have been placed by the customer who is not on the list.
select c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt from orders o full join customer c on c.customer_id=o.customer_id;

--16. Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who is neither in the list not have a grade.
select c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt, c.grade from orders o full join customer c on c.customer_id=o.customer_id where c.grade is not null;

--17. Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa.
select * from salesman cross join customer;
select count(*) from salesman cross join customer;

--

























