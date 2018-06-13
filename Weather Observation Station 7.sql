--Weather Observation Station 7
select distinct(city) from station where city like '%a'
union
select distinct(city) from station where city like '%e'
union
select distinct(city) from station where city like '%i'
union
select distinct(city) from station where city like '%o'
union
select distinct(city) from station where city like '%u';