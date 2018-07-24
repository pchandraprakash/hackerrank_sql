--1. Write a SQL statement to find those salesmen with all information who come from the city either Paris or Rome. 
select * from salesman where city in ('Paris','Rome');

--2. Write a query to filter those salesmen with all information who comes from any of the cities Paris and Rome.
select * from salesman where city = 'Paris' or city = 'Rome';

--3. Write a query to produce a list of salesman_id, name, city and commision of each salesman who live in cities other than Paris and Rome. 
select * from salesman where city not in ('Paris','Rome');

--4. Write a query to sort out those customers with all information whose ID value is within any of 3007, 3008 and 3009.
select * from customer where customer_id in (3007, 3008, 3009);

--5. Write a SQL statement to find those salesmen with all information who gets the commission within a range of 0.12 and 0.14.
select * from salesman where commission between 0.12 and 0.14;

--6. Write a query to filter all those orders with all information which purchase amount value is within the range 500 and 4000 except those orders of purchase amount value 948.50 and 1983.43.
select * from orders where purch_amt between 500 and 4000 and purch_amt not in (948.50, 1983.43);

--7. Write a SQL statement to find those salesmen with all other information and name started with any latter within 'A' and 'K'.
select * from salesman where name like 'A%' and name like '%K';

--8. Write a SQL statement to find those salesmen with all other information and name started with other than any latter within 'A' and 'L'. 
select * from salesman where name not like 'A%' and name not like 'K%';

--9. Write a SQL statement to find that customer with all information whose name begin with the letter 'B'. 
select * from customer where cust_name like 'B%' ;

--10. Write a SQL statement to find all those customers with all information whose names are ending with the letter 'n'.
select * from customer where cust_name like '%n' ;

--11. Write a SQL statement to find those salesmen with all information whose name containing the 1st character is 'N' and the 4th character is 'l' and rests may be any character.
select * from salesman where name like 'N__l%' ;

--12. Write a SQL statement to find those rows from the table testtable which contain the escape character underscore ( _ ) in its column 'col1'. 
select * from testtable where col1 like '%/_%' escape '/';

--13. Write a SQL statement to find those rows from the table testtable which does not contain the character underscore ( _ ) in its column 'col1'.
select * from testtable where col1 not like '%/_%' escape '/';

--14. Write a SQL statement to find those rows from the table testtable which contain the escape character ( / ) in its column 'col1'. 
select * from testtable where col1  like '%//%' escape '/';

--15. Write a SQL statement to find those rows from the table testtable which does not contain the escape character ( / ) in its column 'col1'. 
select * from testtable where col1 not like '%//%' escape '/';

--16. Write a SQL statement to find those rows from the table testtable which contain the string ( _/ ) in its column 'col1'. 
select * from testtable where col1 like '%/_//%' escape '/';

--17. Write a SQL statement to find those rows from the table testtable which does not contain the string ( _/ ) in its column 'col1'.
select * from testtable where col1 not like '%/_//%' escape '/';

--18. Write a SQL statement to find those rows from the table testtable which contain the character ( % ) in its column 'col1'.  (important)
select * from testtable where col1 like '%/%%' escape '/';

--19. Write a SQL statement to find those rows from the table testtable which does not contain the character ( % ) in its column 'col1'. 
select * from testtable where col1 not like '%/%%' escape '/';

--20. Write a SQL statement to find that customer with all information who does not get any grade except NULL.
select * from customer where grade is null;

--21. Write a SQL statement to find that customer with all information who gets a grade except NULL value. 
select * from customer where grade is not null;

--22. Write a query in SQL to display all the data of employees whose last name begins with an 'D'. 
select * from emp_details where emp_lname like 'D%';
















