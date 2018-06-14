--Weather Observation Station 11
select distinct(city) from station where (city not like 'A%' and city not like 'E%' and city not like 'I%' and city not like 'O%' and city not like 'U%') and (city not like '%a' and city not like '%e' or city not like '%i' and city not like '%o' and city not like '%u');

--Weather Observation Station 12
select distinct(city) from station where (city not like 'A%' and city not like 'E%' and city not like 'I%' and city not like 'O%' and city not like 'U%') and (city not like '%a' and city not like '%e' and city not like '%i' and city not like '%o' and city not like '%u');

--Higher Than 75 Marks
select Name from STUDENTS where Marks >75 order by SUBSTR(Name, (length(Name)-2), length(Name));

--Employee Names
select name from employee order by name asc;

--Employee Salaries
select name from employee where salary>2000 and months<10 order by employee_id asc;

--Revising Aggregations - Averages
select avg(population) from city where district = 'California';

--Average Population
select round(avg(population)) from city;

--Japan Population
select sum(population) from city where countrycode='JPN';

--Population Density Difference
select max(population)-min(population) from city;

--The Blunder
select ceil(avg(salary) - avg(replace(salary,'0',''))) from employees;