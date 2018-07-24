--1. Write a SQL statement to display the commission with the percent sign ( % ) with salesman ID, name and city columns for all the salesmen.
select commission as "commission in %" from salesman;

--2. Write a SQL statement to find out the number of orders booked for each day and display it in such a format like "For 2001-10-10 there are 15 orders". 
select 'for '||ord_date||' there are '||count(*)||' orders' as "number_of_orders_wrt_date" from orders group by ord_date order by ord_date;

--3. Write a query to display the orders according to the order number arranged by ascending order. 
select * from orders order by ord_no asc;

--4. Write a SQL statement to arrange the orders according to the order date in such a manner that the latest date will come first then previous dates. 
select * from orders order by ord_date desc;

--5. Write a SQL statement to display the orders with all information in such a manner that, the older order date will come first and the highest purchase amount of same day will come first.
select * from orders order by ord_date, purch_amt desc;

--6. Write a SQL statement to display the customer name, city, and grade, etc. and the display will be arranged according to the smallest customer ID.
select * from customer order by customer_id;

--7. Write a SQL statement to make a report with salesman ID, order date and highest purchase amount in such an arrangement that, the smallest salesman ID will come first along with their smallest order date.
select salesman_id,ord_date,max(purch_amt) from orders group by salesman_id,ord_date order by salesman_id,ord_date;

--8. Write a SQL statement to display customer name, city and grade in such a manner that, the customer holding highest grade will come first.
select cust_name, city, grade from customer order by grade desc;

--9. Write a SQL statement to make a report with customer ID in such a manner that, the largest number of orders booked by the customer will come first along with their highest purchase amount. 
select customer_id,count(*),max(purch_amt) from orders group by customer_id order by count desc;

--10. Write a SQL statement to make a report with order date in such a manner that, the latest order date will come last along with the total purchase amount and total commission (15% for all salesmen) for that date.
select ord_date,sum(purch_amt),sum(0.15 * purch_amt) as "commission" from orders group by ord_date order by ord_date desc;