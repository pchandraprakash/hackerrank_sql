--Weather Observation Station 5
select city, length(city) from station where city='Amo'
union
select city, length(city) from station where length(city) = 21;