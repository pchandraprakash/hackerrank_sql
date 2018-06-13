--Weather Observation Station 6
select distinct(city) from station where city like 'A%'
union
select distinct(city) from station where city like 'E%'
union
select distinct(city) from station where city like 'I%'
union
select distinct(city) from station where city like 'O%'
union
select distinct(city) from station where city like 'U%';